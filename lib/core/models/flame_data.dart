import 'dart:math';
import 'package:hive/hive.dart';
import '../enums/flame_stage.dart';

part 'flame_data.g.dart';

/// Core flame state model
/// Represents the current state of the user's flame
@HiveType(typeId: 0)
class FlameData extends HiveObject {
  /// Current fuel in kg
  @HiveField(0)
  double currentFuel;

  /// Last time the fuel was updated
  @HiveField(1)
  DateTime lastUpdate;

  /// Current streak in days
  @HiveField(2)
  int streakDays;

  /// Current flame stage
  @HiveField(3)
  FlameStage stage;

  /// User's "why" - their motivation
  @HiveField(4)
  String userWhy;

  /// Whether the fire is currently banked (sleep mode)
  @HiveField(5)
  bool isBanked;

  /// When the fire was last banked
  @HiveField(6)
  DateTime? lastBankedTime;

  /// Number of AI messages used during onboarding (max 10)
  @HiveField(7)
  int aiMessagesUsed;

  /// When the flame was first lit (for lifetime stats)
  @HiveField(8)
  DateTime? firstLitDate;

  /// Total number of flames lit (across all resets)
  @HiveField(9)
  int totalFlamesLit;

  FlameData({
    required this.currentFuel,
    required this.lastUpdate,
    this.streakDays = 0,
    this.stage = FlameStage.spark,
    this.userWhy = '',
    this.isBanked = false,
    this.lastBankedTime,
    this.aiMessagesUsed = 0,
    this.firstLitDate,
    this.totalFlamesLit = 1,
  });

  /// Get max capacity based on current stage
  double get maxCapacity => stage.maxCapacity;

  /// Get active burn rate based on current stage
  double get activeBurnRate => stage.activeBurnRate;

  /// Get banked burn rate based on current stage
  double get bankedBurnRate => stage.bankedBurnRate;

  /// Get current burn rate (active or banked)
  double get currentBurnRate => isBanked ? bankedBurnRate : activeBurnRate;

  /// Get fuel percentage (0.0 to 1.0)
  double get fuelPercentage => currentFuel / maxCapacity;

  /// Get time until death as Duration
  Duration get timeUntilDeath {
    if (currentFuel <= 0) return Duration.zero;
    final hours = currentFuel / currentBurnRate;
    return Duration(
      hours: hours.floor(),
      minutes: ((hours - hours.floor()) * 60).floor(),
    );
  }

  /// Check if fuel is in critical state (<25%)
  bool get isCritical => fuelPercentage < 0.25;

  /// Check if fuel is low (25-50%)
  bool get isLow => fuelPercentage >= 0.25 && fuelPercentage < 0.50;

  /// Check if fuel is healthy (>50%)
  bool get isHealthy => fuelPercentage >= 0.50;

  /// Update fuel based on time elapsed since last update
  void updateFuel() {
    final now = DateTime.now();
    final hoursPassed = now.difference(lastUpdate).inMinutes / 60.0;
    final burnRate = isBanked ? bankedBurnRate : activeBurnRate;

    // Reduce fuel based on time passed
    currentFuel = max(0, currentFuel - (burnRate * hoursPassed));
    lastUpdate = now;

    // Auto-unbank after 10 hours
    if (isBanked && lastBankedTime != null) {
      final bankedHours = now.difference(lastBankedTime!).inHours;
      if (bankedHours >= 10) {
        isBanked = false;
      }
    }

    // Check for death or upgrade
    _updateStage();
  }

  /// Bank the fire for sleep
  /// Returns true if successful, false if already banked or insufficient fuel
  bool bankFire() {
    // Need at least 2kg to bank
    if (currentFuel < 2) return false;

    // Can only bank once every 20 hours
    if (lastBankedTime != null &&
        DateTime.now().difference(lastBankedTime!).inHours < 20) {
      return false;
    }

    // Cost 2kg fuel to bank
    currentFuel -= 2;
    isBanked = true;
    lastBankedTime = DateTime.now();
    return true;
  }

  /// Add fuel from completed challenge
  void addFuel(double amount) {
    currentFuel = min(currentFuel + amount, maxCapacity);
    lastUpdate = DateTime.now();
    _updateStage();
  }

  /// Update stage based on current fuel
  /// Handles both upgrades and death
  void _updateStage() {
    // DEATH: If fuel hits 0 at ANY stage = GAME OVER
    if (currentFuel <= 0) {
      _triggerDeath();
      return;
    }

    // UPGRADE: Automatically upgrade when reaching next stage threshold
    if (stage == FlameStage.spark && currentFuel >= 60) {
      stage = FlameStage.match;
    } else if (stage == FlameStage.match && currentFuel >= 120) {
      stage = FlameStage.kindling;
    } else if (stage == FlameStage.kindling && currentFuel >= 180) {
      stage = FlameStage.smallFire;
    } else if (stage == FlameStage.smallFire && currentFuel >= 300) {
      stage = FlameStage.campfire;
    } else if (stage == FlameStage.campfire && currentFuel >= 500) {
      stage = FlameStage.bonfire;
    }
  }

  /// Trigger death - hard reset
  void _triggerDeath() {
    // HARD RESET - NO SECOND CHANCES
    currentFuel = 0;
    streakDays = 0;
    stage = FlameStage.spark;
    isBanked = false;
    lastBankedTime = null;
    totalFlamesLit++;
    // userWhy is preserved
    // Trigger death animation and show "why"
  }

  /// Increment streak (called daily when flame is still alive)
  void incrementStreak() {
    streakDays++;
  }

  /// Create initial flame for new user
  factory FlameData.initial() {
    return FlameData(
      currentFuel: 15, // Start with 50% capacity
      lastUpdate: DateTime.now(),
      streakDays: 0,
      stage: FlameStage.spark,
      userWhy: '',
      isBanked: false,
      aiMessagesUsed: 0,
      firstLitDate: DateTime.now(),
      totalFlamesLit: 1,
    );
  }

  /// Copy with method for immutable updates
  FlameData copyWith({
    double? currentFuel,
    DateTime? lastUpdate,
    int? streakDays,
    FlameStage? stage,
    String? userWhy,
    bool? isBanked,
    DateTime? lastBankedTime,
    int? aiMessagesUsed,
    DateTime? firstLitDate,
    int? totalFlamesLit,
  }) {
    return FlameData(
      currentFuel: currentFuel ?? this.currentFuel,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      streakDays: streakDays ?? this.streakDays,
      stage: stage ?? this.stage,
      userWhy: userWhy ?? this.userWhy,
      isBanked: isBanked ?? this.isBanked,
      lastBankedTime: lastBankedTime ?? this.lastBankedTime,
      aiMessagesUsed: aiMessagesUsed ?? this.aiMessagesUsed,
      firstLitDate: firstLitDate ?? this.firstLitDate,
      totalFlamesLit: totalFlamesLit ?? this.totalFlamesLit,
    );
  }
}

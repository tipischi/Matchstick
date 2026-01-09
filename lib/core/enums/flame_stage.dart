import 'package:hive/hive.dart';

part 'flame_stage.g.dart';

/// Enum representing the different stages of the flame
/// Each stage has different fuel capacity, burn rates, and unlocked challenges
@HiveType(typeId: 10)
enum FlameStage {
  @HiveField(0)
  /// Initial stage - 30kg max capacity
  spark(
    displayName: 'Spark',
    maxCapacity: 30,
    activeBurnRate: 0.5,
    bankedBurnRate: 0.1,
    upgradeThreshold: 60,
  ),

  @HiveField(1)
  /// Second stage - 60kg max capacity
  match(
    displayName: 'Match Flame',
    maxCapacity: 60,
    activeBurnRate: 0.75,
    bankedBurnRate: 0.15,
    upgradeThreshold: 120,
  ),

  @HiveField(2)
  /// Third stage - 120kg max capacity
  kindling(
    displayName: 'Kindling Fire',
    maxCapacity: 120,
    activeBurnRate: 1.0,
    bankedBurnRate: 0.2,
    upgradeThreshold: 180,
  ),

  @HiveField(3)
  /// Fourth stage - 180kg max capacity
  smallFire(
    displayName: 'Small Fire',
    maxCapacity: 180,
    activeBurnRate: 1.5,
    bankedBurnRate: 0.3,
    upgradeThreshold: 300,
  ),

  @HiveField(4)
  /// Fifth stage - 300kg max capacity
  campfire(
    displayName: 'Campfire',
    maxCapacity: 300,
    activeBurnRate: 2.0,
    bankedBurnRate: 0.4,
    upgradeThreshold: 500,
  ),

  @HiveField(5)
  /// Final stage - 500kg max capacity
  bonfire(
    displayName: 'Bonfire',
    maxCapacity: 500,
    activeBurnRate: 2.5,
    bankedBurnRate: 0.5,
    upgradeThreshold: double.infinity, // Max level
  );

  const FlameStage({
    required this.displayName,
    required this.maxCapacity,
    required this.activeBurnRate,
    required this.bankedBurnRate,
    required this.upgradeThreshold,
  });

  final String displayName;
  final double maxCapacity; // kg
  final double activeBurnRate; // kg/hour
  final double bankedBurnRate; // kg/hour (80% reduction)
  final double upgradeThreshold; // Fuel needed to upgrade to next stage

  /// Get daily fuel requirement (assuming 16 active hours)
  double get dailyNeed => activeBurnRate * 16 + bankedBurnRate * 8;

  /// Get the next stage, or null if already at max
  FlameStage? get nextStage {
    final currentIndex = FlameStage.values.indexOf(this);
    if (currentIndex < FlameStage.values.length - 1) {
      return FlameStage.values[currentIndex + 1];
    }
    return null;
  }

  /// Get the previous stage, or null if already at minimum
  FlameStage? get previousStage {
    final currentIndex = FlameStage.values.indexOf(this);
    if (currentIndex > 0) {
      return FlameStage.values[currentIndex - 1];
    }
    return null;
  }

  /// Check if this stage can upgrade to next with given fuel amount
  bool canUpgradeTo(FlameStage targetStage, double currentFuel) {
    return currentFuel >= targetStage.upgradeThreshold;
  }
}

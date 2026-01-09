import 'package:hive/hive.dart';
import '../enums/challenge_category.dart';
import '../enums/flame_stage.dart';

part 'challenge.g.dart';

/// Challenge model
/// Represents a single challenge that users can complete to add fuel
@HiveType(typeId: 1)
class Challenge extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String? description;

  @HiveField(3)
  final double fuelValue; // kg of fuel this challenge provides

  @HiveField(4)
  final ChallengeCategory category;

  @HiveField(5)
  final FlameStage requiredStage; // Minimum stage to unlock this challenge

  @HiveField(6)
  final bool isCustom; // True if user-created

  @HiveField(7)
  final bool isPredefined; // True if built into the app

  Challenge({
    required this.id,
    required this.title,
    this.description,
    required this.fuelValue,
    required this.category,
    required this.requiredStage,
    this.isCustom = false,
    this.isPredefined = true,
  });

  /// Check if this challenge is unlocked for the current flame stage
  bool isUnlockedFor(FlameStage currentStage) {
    return currentStage.index >= requiredStage.index;
  }

  /// Get max fuel value allowed for custom challenges at a given stage
  static double getMaxFuelForStage(FlameStage stage) {
    switch (stage) {
      case FlameStage.spark:
        return 5;
      case FlameStage.match:
        return 8;
      case FlameStage.kindling:
        return 12;
      case FlameStage.smallFire:
        return 18;
      case FlameStage.campfire:
        return 25;
      case FlameStage.bonfire:
        return 40;
    }
  }

  /// Copy with method
  Challenge copyWith({
    String? id,
    String? title,
    String? description,
    double? fuelValue,
    ChallengeCategory? category,
    FlameStage? requiredStage,
    bool? isCustom,
    bool? isPredefined,
  }) {
    return Challenge(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      fuelValue: fuelValue ?? this.fuelValue,
      category: category ?? this.category,
      requiredStage: requiredStage ?? this.requiredStage,
      isCustom: isCustom ?? this.isCustom,
      isPredefined: isPredefined ?? this.isPredefined,
    );
  }
}

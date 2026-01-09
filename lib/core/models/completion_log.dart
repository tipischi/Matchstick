import 'package:hive/hive.dart';

part 'completion_log.g.dart';

/// Log of completed challenges
@HiveType(typeId: 2)
class CompletionLog extends HiveObject {
  @HiveField(0)
  final String challengeId;

  @HiveField(1)
  final DateTime completedAt;

  @HiveField(2)
  final double fuelAdded;

  @HiveField(3)
  final String? note; // Optional user note about the challenge

  @HiveField(4)
  final String challengeTitle;

  CompletionLog({
    required this.challengeId,
    required this.completedAt,
    required this.fuelAdded,
    this.note,
    required this.challengeTitle,
  });

  /// Create a log entry for a completed challenge
  factory CompletionLog.fromChallenge({
    required String challengeId,
    required String challengeTitle,
    required double fuelAdded,
    String? note,
  }) {
    return CompletionLog(
      challengeId: challengeId,
      completedAt: DateTime.now(),
      fuelAdded: fuelAdded,
      note: note,
      challengeTitle: challengeTitle,
    );
  }
}

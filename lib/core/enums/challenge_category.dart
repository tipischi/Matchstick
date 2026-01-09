import 'package:hive/hive.dart';

part 'challenge_category.g.dart';

/// Categories for challenges
@HiveType(typeId: 11)
enum ChallengeCategory {
  @HiveField(0)
  physical('Physical', 'Physical challenges like workouts and cold showers'),

  @HiveField(1)
  mental('Mental', 'Mental challenges like meditation and learning'),

  @HiveField(2)
  social('Social', 'Social challenges like difficult conversations'),

  @HiveField(3)
  custom('Custom', 'User-created custom challenges');

  const ChallengeCategory(this.displayName, this.description);

  final String displayName;
  final String description;
}

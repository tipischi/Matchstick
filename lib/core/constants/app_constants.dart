/// App-wide constants
class AppConstants {
  // App Info
  static const String appName = 'Matchstick';
  static const String appTagline = 'Keep Your Fire Burning';

  // AI Limits
  static const int maxAiMessages = 10;
  static const String deepSeekApiUrl = 'https://api.deepseek.com/v1/chat/completions';

  // Banking
  static const double bankingCost = 2.0; // kg
  static const int bankingCooldownHours = 20;
  static const int autoBankDurationHours = 10;
  static const double bankedBurnRateMultiplier = 0.2; // 80% reduction

  // Notifications
  static const int twoHourWarningMinutes = 120;
  static const int oneHourWarningMinutes = 60;
  static const int bankingReminderHour = 21; // 9 PM

  // Widget
  static const int widgetUpdateIntervalMinutes = 15;

  // Hive Box Names
  static const String flameBoxName = 'flame_box';
  static const String challengeBoxName = 'challenge_box';
  static const String completionBoxName = 'completion_box';

  // SharedPreferences Keys
  static const String onboardingCompletedKey = 'onboarding_completed';
  static const String userWhyKey = 'user_why';
  static const String totalFlamesLitKey = 'total_flames_lit';
}

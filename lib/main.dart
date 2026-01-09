import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/constants/app_constants.dart';
import 'core/models/flame_data.dart';
import 'core/models/challenge.dart';
import 'core/models/completion_log.dart';
import 'core/enums/flame_stage.dart';
import 'core/enums/challenge_category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive
  await Hive.initFlutter();

  // Register Hive adapters
  Hive.registerAdapter(FlameDataAdapter());
  Hive.registerAdapter(ChallengeAdapter());
  Hive.registerAdapter(CompletionLogAdapter());
  Hive.registerAdapter(FlameStageAdapter());
  Hive.registerAdapter(ChallengeCategoryAdapter());

  // Open Hive boxes
  await Hive.openBox(AppConstants.flameBoxName);
  await Hive.openBox(AppConstants.challengeBoxName);
  await Hive.openBox(AppConstants.completionBoxName);

  runApp(
    const ProviderScope(
      child: MatchstickApp(),
    ),
  );
}

class MatchstickApp extends StatelessWidget {
  const MatchstickApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

/// Temporary splash screen
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_fire_department,
              size: 100,
              color: Colors.orange.shade700,
            ),
            const SizedBox(height: 24),
            Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              AppConstants.appTagline,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: 48),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

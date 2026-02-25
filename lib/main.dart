import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/constants/app_constants.dart';
import 'core/constants/app_assets.dart';
import 'core/constants/app_colors.dart';
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
          seedColor: AppColors.flameOrange,
          brightness: Brightness.dark,
          surface: AppColors.background,
        ),
        scaffoldBackgroundColor: AppColors.background,
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

/// Animated splash screen using the SVG logo and flutter_animate.
/// Navigates to [HomeScreen] automatically after the entrance animation.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate once the entrance animation has finished.
    Future.delayed(const Duration(milliseconds: 2200), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionsBuilder: (_, anim, __, child) =>
              FadeTransition(opacity: anim, child: child),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ── Animated logo ────────────────────────────────────────────────
            SvgPicture.asset(
              AppAssets.logo,
              width: 140,
              height: 140,
            )
                .animate()
                .fadeIn(duration: 600.ms)
                .scale(
                  begin: const Offset(0.6, 0.6),
                  end: const Offset(1.0, 1.0),
                  duration: 700.ms,
                  curve: Curves.elasticOut,
                )
                .then(delay: 200.ms)
                // Gentle ongoing flicker after entrance
                .scaleXY(
                  begin: 1.0,
                  end: 1.04,
                  duration: 750.ms,
                  curve: Curves.easeInOut,
                ),

            const SizedBox(height: 32),

            // ── App name ─────────────────────────────────────────────────────
            Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
            )
                .animate()
                .fadeIn(delay: 400.ms, duration: 500.ms)
                .slideY(begin: 0.2, end: 0.0, duration: 500.ms, curve: Curves.easeOut),

            const SizedBox(height: 8),

            // ── Tagline ───────────────────────────────────────────────────────
            Text(
              AppConstants.appTagline,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppColors.flameOrange,
                    letterSpacing: 0.5,
                  ),
            )
                .animate()
                .fadeIn(delay: 650.ms, duration: 500.ms)
                .slideY(begin: 0.2, end: 0.0, duration: 500.ms, curve: Curves.easeOut),

            const SizedBox(height: 60),

            // ── Loading indicator ─────────────────────────────────────────────
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.flameOrange),
              ),
            )
                .animate()
                .fadeIn(delay: 900.ms, duration: 400.ms),
          ],
        ),
      ),
    );
  }
}

/// Placeholder home screen – replace with full implementation.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.logo, width: 80, height: 80)
                .animate(onPlay: (c) => c.repeat(reverse: true))
                .scaleXY(
                  begin: 1.0,
                  end: 1.06,
                  duration: 800.ms,
                  curve: Curves.easeInOut,
                ),
            const SizedBox(height: 24),
            Text(
              AppConstants.appName,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              AppConstants.appTagline,
              style: TextStyle(color: AppColors.flameOrange),
            ),
          ],
        ),
      ),
    );
  }
}

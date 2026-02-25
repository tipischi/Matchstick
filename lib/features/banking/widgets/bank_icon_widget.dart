import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

/// Animated banking / sleep-mode button icon.
///
/// Shows a moon SVG with a pulsing glow when [isBanked] is true.
/// When banking is available the icon gently scales to draw attention.
class BankIconWidget extends StatelessWidget {
  const BankIconWidget({
    super.key,
    required this.isBanked,
    required this.canBank,
    this.size = 56.0,
    this.onTap,
  });

  /// Whether the fire is currently in banked (sleep) mode.
  final bool isBanked;

  /// Whether the user can bank right now.
  final bool canBank;

  /// Widget size.
  final double size;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    // The icon SVG is always the moon.
    Widget icon = GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOut,
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isBanked
              ? AppColors.moonBlue.withOpacity(0.22)
              : AppColors.backgroundCard,
          border: Border.all(
            color: isBanked
                ? AppColors.moonBlue.withOpacity(0.75)
                : AppColors.textMuted.withOpacity(0.28),
            width: isBanked ? 1.8 : 1.0,
          ),
          boxShadow: isBanked
              ? [
                  BoxShadow(
                    color: AppColors.moonBlue.withOpacity(0.35),
                    blurRadius: 20,
                    spreadRadius: 3,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: SvgPicture.asset(
            AppAssets.iconBank,
            width: size * 0.58,
            height: size * 0.58,
          ),
        ),
      ),
    );

    // Pulse when the fire is actively banked
    if (isBanked) {
      icon = icon
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scaleXY(begin: 1.0, end: 1.06, duration: 1200.ms, curve: Curves.easeInOut)
          .shimmer(
            duration: 1800.ms,
            color: AppColors.moonBlue.withOpacity(0.3),
          );
    }
    // Subtle wiggle when banking is available but not yet done
    else if (canBank) {
      icon = icon
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scaleXY(begin: 1.0, end: 1.04, duration: 1000.ms);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(height: 6),
        AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 300),
          style: TextStyle(
            color: isBanked ? AppColors.moonBlue : AppColors.textSecondary,
            fontSize: 10,
            fontWeight: isBanked ? FontWeight.w600 : FontWeight.normal,
            letterSpacing: 0.3,
          ),
          child: Text(isBanked ? 'Banked' : 'Bank'),
        ),
      ],
    );
  }
}

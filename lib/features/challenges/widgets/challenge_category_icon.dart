import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/enums/challenge_category.dart';

/// Animated icon for a [ChallengeCategory].
///
/// Behaviours:
/// • Bounce + scale on tap.
/// • Glow ring when [isSelected].
/// • Gentle pulse when [hasPendingChallenges].
class ChallengeCategoryIcon extends StatelessWidget {
  const ChallengeCategoryIcon({
    super.key,
    required this.category,
    this.isSelected = false,
    this.hasPendingChallenges = false,
    this.size = 52.0,
    this.onTap,
  });

  final ChallengeCategory category;

  /// Whether this category is currently active / selected.
  final bool isSelected;

  /// Whether there are uncompleted challenges in this category.
  final bool hasPendingChallenges;

  /// Widget size (width = height).
  final double size;

  final VoidCallback? onTap;

  static String _svgFor(ChallengeCategory cat) {
    switch (cat) {
      case ChallengeCategory.physical: return AppAssets.iconPhysical;
      case ChallengeCategory.mental:   return AppAssets.iconMental;
      case ChallengeCategory.social:   return AppAssets.iconSocial;
      case ChallengeCategory.custom:   return AppAssets.iconCustom;
    }
  }

  static String _labelFor(ChallengeCategory cat) => cat.displayName;

  @override
  Widget build(BuildContext context) {
    final svgPath = _svgFor(category);

    Widget icon = GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.flameOrange.withOpacity(0.18)
              : AppColors.backgroundCard,
          borderRadius: BorderRadius.circular(size * 0.28),
          border: Border.all(
            color: isSelected
                ? AppColors.flameOrange.withOpacity(0.70)
                : AppColors.textMuted.withOpacity(0.28),
            width: isSelected ? 1.8 : 1.0,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.flameOrange.withOpacity(0.30),
                    blurRadius: 16,
                    spreadRadius: 2,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: SvgPicture.asset(
            svgPath,
            width: size * 0.55,
            height: size * 0.55,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.flameOrange : AppColors.textSecondary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );

    // Bounce on tap
    icon = icon
        .animate(onPlay: (_) {})
        .scale(
          begin: const Offset(1, 1),
          end: const Offset(0.92, 0.92),
          duration: 80.ms,
        )
        .then()
        .scale(
          begin: const Offset(0.92, 0.92),
          end: const Offset(1, 1),
          duration: 120.ms,
          curve: Curves.elasticOut,
        );

    // Pulse when there are pending challenges
    if (hasPendingChallenges && !isSelected) {
      icon = icon
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .scaleXY(begin: 1.0, end: 1.05, duration: 900.ms, curve: Curves.easeInOut);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(height: 6),
        Text(
          _labelFor(category),
          style: TextStyle(
            color: isSelected ? AppColors.flameOrange : AppColors.textSecondary,
            fontSize: 10,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }
}

/// Row of all four category icons.
class ChallengeCategoryRow extends StatelessWidget {
  const ChallengeCategoryRow({
    super.key,
    required this.selected,
    this.pendingCategories = const {},
    required this.onSelect,
    this.iconSize = 52.0,
  });

  final ChallengeCategory selected;
  final Set<ChallengeCategory> pendingCategories;
  final ValueChanged<ChallengeCategory> onSelect;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: ChallengeCategory.values.map((cat) {
        return ChallengeCategoryIcon(
          category: cat,
          isSelected: cat == selected,
          hasPendingChallenges: pendingCategories.contains(cat),
          size: iconSize,
          onTap: () => onSelect(cat),
        );
      }).toList(),
    );
  }
}

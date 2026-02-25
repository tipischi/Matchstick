import '../enums/flame_stage.dart';

/// Centralised asset paths for every SVG in the project.
/// All paths point to assets/images/svgs/.
class AppAssets {
  AppAssets._();

  static const String _svg = 'assets/images/svgs';

  // ── Flame-stage SVGs ────────────────────────────────────────────────────────
  static const String flameSpark    = '$_svg/flame_spark.svg';
  static const String flameMatch    = '$_svg/flame_match.svg';
  static const String flameKindling = '$_svg/flame_kindling.svg';
  static const String flameSmallFire= '$_svg/flame_small_fire.svg';
  static const String flameCampfire = '$_svg/flame_campfire.svg';
  static const String flameBonfire  = '$_svg/flame_bonfire.svg';

  /// Returns the correct flame SVG path for the given [stage].
  static String flameForStage(FlameStage stage) {
    switch (stage) {
      case FlameStage.spark:     return flameSpark;
      case FlameStage.match:     return flameMatch;
      case FlameStage.kindling:  return flameKindling;
      case FlameStage.smallFire: return flameSmallFire;
      case FlameStage.campfire:  return flameCampfire;
      case FlameStage.bonfire:   return flameBonfire;
    }
  }

  // ── Category-icon SVGs ───────────────────────────────────────────────────────
  static const String iconPhysical = '$_svg/icon_physical.svg';
  static const String iconMental   = '$_svg/icon_mental.svg';
  static const String iconSocial   = '$_svg/icon_social.svg';
  static const String iconCustom   = '$_svg/icon_custom.svg';

  // ── UI-element SVGs ──────────────────────────────────────────────────────────
  static const String iconBank  = '$_svg/icon_bank.svg';
  static const String iconCheck = '$_svg/icon_check.svg';

  // ── Onboarding / branding SVGs ───────────────────────────────────────────────
  static const String matchstickUnlit = '$_svg/matchstick_unlit.svg';
  static const String matchstickLit   = '$_svg/matchstick_lit.svg';
  static const String logo            = '$_svg/logo.svg';

  // ── Misc decoration SVGs ─────────────────────────────────────────────────────
  static const String woodLog = '$_svg/wood_log.svg';
  static const String sparks  = '$_svg/sparks.svg';
}

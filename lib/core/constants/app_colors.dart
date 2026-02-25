import 'package:flutter/material.dart';

/// App-wide colour palette built around the fire / matchstick theme.
class AppColors {
  AppColors._();

  // ── Dark background ──────────────────────────────────────────────────────────
  static const Color background      = Color(0xFF0D0D0D);
  static const Color backgroundCard  = Color(0xFF1A1A1A);
  static const Color backgroundSheet = Color(0xFF141414);

  // ── Fire palette ─────────────────────────────────────────────────────────────
  /// Near-white yellow (flame centre / core)
  static const Color flameCoreWhite  = Color(0xFFFFFDE7);
  /// Bright amber (inner flame)
  static const Color flameAmber      = Color(0xFFFFD54F);
  /// Warm amber
  static const Color flameWarmAmber  = Color(0xFFFFB300);
  /// Primary orange (mid flame, brand accent)
  static const Color flameOrange     = Color(0xFFFF6D00);
  /// Deep orange (outer flame)
  static const Color flameDeepOrange = Color(0xFFE64A19);
  /// Dark red-orange (flame edge)
  static const Color flameDark       = Color(0xFFBF360C);

  // ── Ember / glow ─────────────────────────────────────────────────────────────
  static const Color emberGlow  = Color(0xFFFF8F00);
  static const Color emberDark  = Color(0xFFA04000);

  // ── Status colours ───────────────────────────────────────────────────────────
  /// Fuel > 50 % — safe
  static const Color fuelHealthy  = Color(0xFFFF6D00);
  /// 25 % ≤ fuel ≤ 50 % — warning
  static const Color fuelWarning  = Color(0xFFFFAB00);
  /// fuel < 25 % — critical
  static const Color fuelCritical = Color(0xFFFF1744);

  /// Green for completed / success
  static const Color success = Color(0xFF66BB6A);

  // ── Wood / log palette ───────────────────────────────────────────────────────
  static const Color woodLight = Color(0xFF8D6E63);
  static const Color woodMid   = Color(0xFF5D4037);
  static const Color woodDark  = Color(0xFF3E2723);

  // ── Banking / sleep ──────────────────────────────────────────────────────────
  static const Color moonBlue   = Color(0xFF5C6BC0);
  static const Color moonSilver = Color(0xFFB0BEC5);

  // ── Text ─────────────────────────────────────────────────────────────────────
  static const Color textPrimary   = Color(0xFFF5F5F5);
  static const Color textSecondary = Color(0xFFAAAAAA);
  static const Color textMuted     = Color(0xFF555555);

  // ── Fuel-level colour helper ─────────────────────────────────────────────────
  /// Returns the appropriate colour for a given [fuelPercentage] (0.0 – 1.0).
  static Color forFuelLevel(double fuelPercentage) {
    if (fuelPercentage < 0.25) return fuelCritical;
    if (fuelPercentage < 0.50) return fuelWarning;
    return fuelHealthy;
  }

  // ── Glow colour helper ───────────────────────────────────────────────────────
  /// Ambient glow colour that intensifies when fuel is low.
  static Color glowForFuelLevel(double fuelPercentage) {
    return forFuelLevel(fuelPercentage).withOpacity(
      0.12 + (1.0 - fuelPercentage) * 0.30,
    );
  }
}

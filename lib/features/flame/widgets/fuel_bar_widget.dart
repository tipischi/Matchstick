import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

/// Animated horizontal fuel-level bar.
///
/// The bar fill animates smoothly whenever [fuelPercentage] changes and its
/// colour transitions through orange → amber → red as fuel depletes.
/// A small drip shimmer runs continuously to convey real-time consumption.
class FuelBarWidget extends StatefulWidget {
  const FuelBarWidget({
    super.key,
    required this.fuelPercentage,
    required this.currentFuel,
    required this.maxCapacity,
    this.timeUntilDeath,
    this.showLabel = true,
    this.height = 14.0,
  });

  /// Current fuel as a fraction of max capacity (0.0 – 1.0).
  final double fuelPercentage;

  /// Current fuel in kg.
  final double currentFuel;

  /// Maximum fuel capacity in kg.
  final double maxCapacity;

  /// Time until the flame dies (shown as a sub-label).
  final Duration? timeUntilDeath;

  /// Whether to show the kg / time labels above the bar.
  final bool showLabel;

  /// Bar height in logical pixels.
  final double height;

  @override
  State<FuelBarWidget> createState() => _FuelBarWidgetState();
}

class _FuelBarWidgetState extends State<FuelBarWidget>
    with SingleTickerProviderStateMixin {
  // Shimmer animation to convey real-time burn
  late final AnimationController _shimmerCtrl;
  late final Animation<double> _shimmerAnim;

  @override
  void initState() {
    super.initState();
    _shimmerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    _shimmerAnim = Tween<double>(begin: -1.0, end: 2.0).animate(
      CurvedAnimation(parent: _shimmerCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _shimmerCtrl.dispose();
    super.dispose();
  }

  Color get _barColor => AppColors.forFuelLevel(widget.fuelPercentage);

  String _formatDuration(Duration d) {
    final h = d.inHours;
    final m = d.inMinutes % 60;
    if (h > 0) return '${h}h ${m}m remaining';
    return '${m}m remaining';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.showLabel) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left label: icon + "FUEL"
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    AppAssets.iconPhysical,
                    width: 14,
                    height: 14,
                    colorFilter: ColorFilter.mode(
                      AppColors.textSecondary,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'FUEL',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              // Right label: kg values
              Text(
                '${widget.currentFuel.toStringAsFixed(1)} / '
                '${widget.maxCapacity.toStringAsFixed(0)} kg',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
        ],

        // ── Bar ─────────────────────────────────────────────────────────────────
        ClipRRect(
          borderRadius: BorderRadius.circular(widget.height / 2),
          child: Container(
            height: widget.height,
            color: AppColors.woodDark.withOpacity(0.6),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final fillWidth =
                    constraints.maxWidth * widget.fuelPercentage.clamp(0.0, 1.0);
                return Stack(
                  children: [
                    // Animated fill
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                      width: fillWidth,
                      height: widget.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            _barColor.withOpacity(0.72),
                            _barColor,
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: _barColor.withOpacity(0.55),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                    ),
                    // Shimmer drip
                    if (widget.fuelPercentage > 0.02)
                      AnimatedBuilder(
                        animation: _shimmerAnim,
                        builder: (context, _) {
                          return Positioned(
                            left: fillWidth * _shimmerAnim.value -
                                fillWidth * 0.15,
                            top: 0,
                            child: Container(
                              width: fillWidth * 0.30,
                              height: widget.height,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.transparent,
                                    Colors.white.withOpacity(0.18),
                                    Colors.transparent,
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
          ),
        ),

        // ── Time-until-death sub-label ───────────────────────────────────────────
        if (widget.timeUntilDeath != null && widget.showLabel) ...[
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.timer_outlined,
                size: 11,
                color: _barColor,
              ),
              const SizedBox(width: 3),
              Text(
                _formatDuration(widget.timeUntilDeath!),
                style: TextStyle(
                  color: _barColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

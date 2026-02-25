import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

/// Shows a pile of wood logs that shrinks as fuel depletes.
///
/// Displays up to [maxLogs] logs stacked.  As [fuelPercentage] falls the
/// visible logs fade and shrink, giving an intuitive visual of the wood
/// being consumed.  An ember glow at the base pulses continuously.
class WoodPileWidget extends StatefulWidget {
  const WoodPileWidget({
    super.key,
    required this.fuelPercentage,
    this.maxLogs = 5,
    this.width = 240,
  });

  /// Current fuel as a fraction of max capacity (0.0 – 1.0).
  final double fuelPercentage;

  /// Maximum number of log rows to display.
  final int maxLogs;

  /// Widget width in logical pixels.
  final double width;

  @override
  State<WoodPileWidget> createState() => _WoodPileWidgetState();
}

class _WoodPileWidgetState extends State<WoodPileWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _emberCtrl;
  late final Animation<double> _emberAnim;

  @override
  void initState() {
    super.initState();
    _emberCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat(reverse: true);

    _emberAnim = Tween<double>(begin: 0.3, end: 0.7).animate(
      CurvedAnimation(parent: _emberCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _emberCtrl.dispose();
    super.dispose();
  }

  /// How many logs are "active" (not yet consumed).
  int get _activeLogs =>
      (widget.maxLogs * widget.fuelPercentage).ceil().clamp(0, widget.maxLogs);

  @override
  Widget build(BuildContext context) {
    final logH = widget.width * 0.22;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Log stack ───────────────────────────────────────────────────────────
        SizedBox(
          width: widget.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(widget.maxLogs, (i) {
              // i == 0 is the TOP log; i == maxLogs-1 is the BOTTOM log.
              final isActive = i >= (widget.maxLogs - _activeLogs);
              final scale = isActive ? 1.0 : 0.88;
              final opacity = isActive ? 1.0 : 0.22;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOut,
                margin: EdgeInsets.only(bottom: logH * 0.08),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 700),
                  opacity: opacity,
                  child: Transform.scale(
                    scale: scale,
                    child: SvgPicture.asset(
                      AppAssets.woodLog,
                      width: widget.width * (1.0 - i * 0.04),
                      height: logH,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),

        // ── Ember glow ──────────────────────────────────────────────────────────
        AnimatedBuilder(
          animation: _emberAnim,
          builder: (context, _) {
            return Container(
              width: widget.width * 0.80,
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.emberGlow.withOpacity(_emberAnim.value),
                    blurRadius: 24,
                    spreadRadius: 4,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

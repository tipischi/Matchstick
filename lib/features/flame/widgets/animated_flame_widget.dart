import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/enums/flame_stage.dart';

/// A fully animated flame widget.
///
/// Renders the correct SVG illustration for the current [stage] and applies:
///  • A vertical **flicker** (fast scale along the Y axis).
///  • A lateral **sway** (gentle rotation around the base).
///  • An ambient **glow** whose colour shifts from orange → red as fuel drops.
///  • A **critical pulse** that makes the glow throb when [fuelPercentage] < 0.25.
class AnimatedFlameWidget extends StatefulWidget {
  const AnimatedFlameWidget({
    super.key,
    required this.stage,
    required this.fuelPercentage,
    this.size = 200,
  });

  /// Which flame-stage to display (determines the SVG used).
  final FlameStage stage;

  /// Current fuel as a fraction of max capacity (0.0 – 1.0).
  final double fuelPercentage;

  /// Width / height constraint of the widget.
  final double size;

  @override
  State<AnimatedFlameWidget> createState() => _AnimatedFlameWidgetState();
}

class _AnimatedFlameWidgetState extends State<AnimatedFlameWidget>
    with TickerProviderStateMixin {
  // Flicker – fast, subtle vertical breath
  late final AnimationController _flickerCtrl;
  late final Animation<double> _flickerAnim;

  // Sway – slow, pendulum-like lateral rotation
  late final AnimationController _swayCtrl;
  late final Animation<double> _swayAnim;

  // Critical pulse – extra glow throb when dying
  late final AnimationController _pulseCtrl;
  late final Animation<double> _pulseAnim;

  @override
  void initState() {
    super.initState();

    _flickerCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 620),
    )..repeat(reverse: true);

    _flickerAnim = Tween<double>(begin: 1.0, end: 1.07).animate(
      CurvedAnimation(parent: _flickerCtrl, curve: Curves.easeInOut),
    );

    _swayCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1850),
    )..repeat(reverse: true);

    _swayAnim = Tween<double>(begin: -0.030, end: 0.030).animate(
      CurvedAnimation(parent: _swayCtrl, curve: Curves.easeInOut),
    );

    _pulseCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );

    _pulseAnim = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut),
    );

    _updateCriticalPulse();
  }

  @override
  void didUpdateWidget(AnimatedFlameWidget old) {
    super.didUpdateWidget(old);
    if (old.fuelPercentage != widget.fuelPercentage) {
      _updateCriticalPulse();
    }
  }

  void _updateCriticalPulse() {
    if (widget.fuelPercentage < 0.25) {
      if (!_pulseCtrl.isAnimating) _pulseCtrl.repeat(reverse: true);
    } else {
      _pulseCtrl.stop();
      _pulseCtrl.value = 0.5;
    }
  }

  @override
  void dispose() {
    _flickerCtrl.dispose();
    _swayCtrl.dispose();
    _pulseCtrl.dispose();
    super.dispose();
  }

  Color get _glowColor => AppColors.forFuelLevel(widget.fuelPercentage);

  double get _glowIntensity =>
      widget.fuelPercentage < 0.25 ? _pulseAnim.value : 0.55;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_flickerCtrl, _swayCtrl, _pulseCtrl]),
      builder: (context, child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            // ── Ambient glow ────────────────────────────────────────────────────
            _AmbientGlow(
              size: widget.size,
              color: _glowColor,
              intensity: _glowIntensity,
            ),

            // ── Flame SVG (flickering + swaying) ────────────────────────────────
            Transform(
              alignment: Alignment.bottomCenter,
              transform: Matrix4.identity()
                ..rotateZ(_swayAnim.value),
              child: Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..scale(1.0, _flickerAnim.value),
                child: child,
              ),
            ),

            // ── Sparks overlay (only for campfire / bonfire) ─────────────────────
            if (widget.stage.index >= FlameStage.campfire.index)
              _SparkOverlay(size: widget.size, swayValue: _swayAnim.value),
          ],
        );
      },
      child: SvgPicture.asset(
        AppAssets.flameForStage(widget.stage),
        width: widget.size,
        height: widget.size,
      ),
    );
  }
}

// ─── Helpers ──────────────────────────────────────────────────────────────────

class _AmbientGlow extends StatelessWidget {
  const _AmbientGlow({
    required this.size,
    required this.color,
    required this.intensity,
  });

  final double size;
  final Color color;
  final double intensity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size * 0.65,
      height: size * 0.20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(intensity * 0.65),
            blurRadius: size * 0.35,
            spreadRadius: size * 0.04,
          ),
          BoxShadow(
            color: color.withOpacity(intensity * 0.35),
            blurRadius: size * 0.60,
            spreadRadius: size * 0.10,
          ),
        ],
      ),
    );
  }
}

class _SparkOverlay extends StatelessWidget {
  const _SparkOverlay({required this.size, required this.swayValue});

  final double size;
  final double swayValue;

  @override
  Widget build(BuildContext context) {
    // Simple sparks that drift slightly opposite to the sway direction.
    final sparks = [
      _SparkDot(dx: -0.18, dy: -0.72, radius: 2.4, opacity: 0.80),
      _SparkDot(dx:  0.22, dy: -0.60, radius: 2.0, opacity: 0.70),
      _SparkDot(dx: -0.06, dy: -0.82, radius: 1.6, opacity: 0.75),
      _SparkDot(dx:  0.34, dy: -0.50, radius: 1.8, opacity: 0.60),
      _SparkDot(dx: -0.30, dy: -0.55, radius: 1.4, opacity: 0.65),
    ];

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: sparks.map((s) {
          final x = (size / 2) + (s.dx + swayValue * 0.3) * size;
          final y = (1.0 + s.dy) * size;
          return Positioned(
            left: x - s.radius,
            top: y - s.radius,
            child: Container(
              width: s.radius * 2,
              height: s.radius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.flameAmber.withOpacity(s.opacity),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.flameOrange.withOpacity(s.opacity * 0.6),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _SparkDot {
  const _SparkDot({
    required this.dx,
    required this.dy,
    required this.radius,
    required this.opacity,
  });
  final double dx, dy, radius, opacity;
}

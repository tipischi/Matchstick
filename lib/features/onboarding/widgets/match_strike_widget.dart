import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';

/// Onboarding widget that lets the user "strike" a match to light their flame.
///
/// Shows the unlit match SVG.  The user drags horizontally; as they drag,
/// a streak progress bar fills.  When complete the SVG swaps to the lit
/// version with an animated spark burst and a flame reveal, then calls
/// [onStruck] after a short celebration delay.
class MatchStrikeWidget extends StatefulWidget {
  const MatchStrikeWidget({super.key, required this.onStruck});

  /// Called once the strike animation fully completes.
  final VoidCallback onStruck;

  @override
  State<MatchStrikeWidget> createState() => _MatchStrikeWidgetState();
}

class _MatchStrikeWidgetState extends State<MatchStrikeWidget>
    with TickerProviderStateMixin {
  bool _isLit = false;
  double _dragProgress = 0.0;

  // Flame reveal after striking
  late final AnimationController _revealCtrl;
  late final Animation<double> _revealAnim;

  // Spark burst
  late final AnimationController _sparkCtrl;
  late final Animation<double> _sparkAnim;

  @override
  void initState() {
    super.initState();

    _revealCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _revealAnim = CurvedAnimation(
      parent: _revealCtrl,
      curve: Curves.elasticOut,
    );

    _sparkCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _sparkAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _sparkCtrl, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _revealCtrl.dispose();
    _sparkCtrl.dispose();
    super.dispose();
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    if (_isLit) return;
    setState(() {
      _dragProgress =
          (_dragProgress + details.delta.dx / 160).clamp(0.0, 1.0);
    });
    if (_dragProgress >= 1.0) {
      _strike();
    }
  }

  void _onHorizontalDragEnd(DragEndDetails _) {
    if (!_isLit) {
      setState(() => _dragProgress = 0.0);
    }
  }

  Future<void> _strike() async {
    if (_isLit) return;
    HapticFeedback.heavyImpact();
    setState(() => _isLit = true);
    _sparkCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 200));
    _revealCtrl.forward();
    await Future.delayed(const Duration(milliseconds: 1400));
    widget.onStruck();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _onHorizontalDragUpdate,
      onHorizontalDragEnd: _onHorizontalDragEnd,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Match / flame display ─────────────────────────────────────────────
          SizedBox(
            height: 280,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Ambient glow (grows when lit)
                AnimatedBuilder(
                  animation: _revealAnim,
                  builder: (context, _) {
                    return Container(
                      width: 160 * _revealAnim.value,
                      height: 160 * _revealAnim.value,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            AppColors.flameOrange
                                .withOpacity(0.45 * _revealAnim.value),
                            AppColors.flameOrange.withOpacity(0),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                // Unlit → Lit match (cross-fades)
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _isLit
                      ? ScaleTransition(
                          key: const ValueKey('lit'),
                          scale: _revealAnim,
                          alignment: Alignment.bottomCenter,
                          child: SvgPicture.asset(
                            AppAssets.matchstickLit,
                            height: 260,
                          ),
                        )
                      : SvgPicture.asset(
                          key: const ValueKey('unlit'),
                          AppAssets.matchstickUnlit,
                          height: 240,
                        ),
                ),

                // Spark burst circles
                if (_isLit)
                  AnimatedBuilder(
                    animation: _sparkAnim,
                    builder: (context, _) => _SparkBurst(
                      progress: _sparkAnim.value,
                    ),
                  ),
              ],
            ),
          ),

          // ── Strike progress bar ───────────────────────────────────────────────
          if (!_isLit) ...[
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: _dragProgress,
                  minHeight: 8,
                  backgroundColor: AppColors.backgroundCard,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    AppColors.flameOrange,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '← ',
                  style: TextStyle(
                    color: AppColors.flameAmber,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Swipe to strike',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 15,
                    letterSpacing: 0.5,
                  ),
                ),
                Text(
                  ' →',
                  style: TextStyle(
                    color: AppColors.flameAmber,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ] else ...[
            const SizedBox(height: 20),
            Text(
              'Your flame is lit 🔥',
              style: TextStyle(
                color: AppColors.flameAmber,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Spark burst decoration ───────────────────────────────────────────────────

class _SparkBurst extends StatelessWidget {
  const _SparkBurst({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    const sparks = [
      _Spark(angle: 0.0,   distance: 60),
      _Spark(angle: 0.52,  distance: 50),
      _Spark(angle: 1.05,  distance: 70),
      _Spark(angle: 1.57,  distance: 55),
      _Spark(angle: 2.09,  distance: 65),
      _Spark(angle: 2.62,  distance: 48),
      _Spark(angle: 3.14,  distance: 58),
      _Spark(angle: 3.67,  distance: 52),
      _Spark(angle: 4.19,  distance: 68),
      _Spark(angle: 4.71,  distance: 45),
      _Spark(angle: 5.24,  distance: 62),
      _Spark(angle: 5.76,  distance: 56),
    ];

    return SizedBox(
      width: 160,
      height: 160,
      child: CustomPaint(
        painter: _SparkBurstPainter(sparks: sparks, progress: progress),
      ),
    );
  }
}

class _Spark {
  const _Spark({required this.angle, required this.distance});
  final double angle;
  final double distance;
}

class _SparkBurstPainter extends CustomPainter {
  const _SparkBurstPainter({required this.sparks, required this.progress});

  final List<_Spark> sparks;
  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..style = PaintingStyle.fill;

    for (final spark in sparks) {
      final dist = spark.distance * progress;
      final opacity = (1.0 - progress).clamp(0.0, 1.0);
      final radius = (3.0 * (1.0 - progress * 0.6)).clamp(0.0, 6.0);

      final dx = dist * _cos(spark.angle);
      final dy = dist * _sin(spark.angle);

      paint.color = AppColors.flameAmber.withOpacity(opacity);
      paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 2);
      canvas.drawCircle(center + Offset(dx, dy), radius, paint);
    }
  }

  @override
  bool shouldRepaint(_SparkBurstPainter old) => old.progress != progress;

  double _cos(double a) {
    // Simple cos approximation using dart:math-free approach via a lookup
    // (avoids the need to import dart:math in this file).
    const coeffs = [1.0, -0.5, 0.041667, -0.001389, 0.0000248];
    double x = a % (2 * 3.14159265);
    double result = 0;
    double xPow = 1;
    int factDen = 1;
    for (int n = 0; n < coeffs.length; n++) {
      result += coeffs[n] * xPow;
      xPow *= x * x;
    }
    return result;
  }

  double _sin(double a) {
    return _cos(a - 1.5707963);
  }
}

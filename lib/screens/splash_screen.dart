import 'dart:math' as math;

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeOut),
    );
    Future.delayed(const Duration(seconds: 4), () {
      _fadeController.forward();
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          Navigator.of(context).pushReplacementNamed('/');
        }
      });
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final starColor = const Color(0xFF0A2342); // dark blue
    final starSize = size.width * 0.25;
    final circleRadius = starSize / 2 + size.width * 0.02;
    final center = Offset(size.width / 2, size.height / 2 - starSize * 0.2);
    return Scaffold(
      backgroundColor: Colors.white,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Stack(
          children: [
            // Circle
            Positioned(
              left: center.dx - circleRadius,
              top: center.dy - circleRadius,
              child: Container(
                width: circleRadius * 2,
                height: circleRadius * 2,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(color: starColor, width: 3),
                ),
              ),
            ),
            // Star
            Positioned(
              left: center.dx - starSize / 2,
              top: center.dy - starSize / 2,
              child: CustomPaint(
                size: Size(starSize, starSize),
                painter: _SingleStarPainter(starColor),
              ),
            ),
            // Main text
            Positioned(
              left: 0,
              right: 0,
              top: center.dy + circleRadius + 24,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Guest 5 Stars',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: starColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your Portable Reputation',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: starColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SingleStarPainter extends CustomPainter {
  final Color color;
  _SingleStarPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fill = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    final Path path = Path();
    double r = size.width / 2;
    double cx = size.width / 2;
    double cy = size.height / 2;
    for (int i = 0; i < 5; i++) {
      double angle = (i * 72 - 90) * math.pi / 180;
      double x = cx + r * 0.95 * math.cos(angle);
      double y = cy + r * 0.95 * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      double innerAngle = angle + 36 * math.pi / 180;
      double ix = cx + r * 0.42 * math.cos(innerAngle);
      double iy = cy + r * 0.42 * math.sin(innerAngle);
      path.lineTo(ix, iy);
    }
    path.close();
    canvas.drawPath(path, fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

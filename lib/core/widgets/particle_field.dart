import 'dart:math';
import 'package:flutter/material.dart';

class ParticleField extends StatefulWidget {
  final int numberOfParticles;
  const ParticleField({super.key, this.numberOfParticles = 60});

  @override
  State<ParticleField> createState() => _ParticleFieldState();
}

class _ParticleFieldState extends State<ParticleField>
    with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late AnimationController _controller;
  final Random random = Random();
  int _frameSkip = 0;

  @override
  void initState() {
    super.initState();
    particles = List.generate(
      widget.numberOfParticles,
      (index) => Particle.random(random),
    );
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..addListener(() {
            // Update particles every frame for smooth motion
            for (var particle in particles) {
              particle.update();
            }
            // Only setState every 3rd frame to reduce CPU while maintaining smoothness
            _frameSkip++;
            if (_frameSkip >= 3) {
              _frameSkip = 0;
              setState(() {});
            }
          })
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ParticlePainter(particles),
      size: Size.infinite,
    );
  }
}

class Particle {
  double x;
  double y;
  double vx;
  double vy;
  double radius;
  double opacity;
  double baseOpacity;
  Color color;

  Particle({
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.opacity,
    required this.baseOpacity,
    required this.color,
  });

  factory Particle.random(Random random) {
    final colors = [
      const Color(0xFF4285F4).withOpacity(0.3), // Blue
      const Color(0xFF34A853).withOpacity(0.2), // Green
      const Color(0xFFEA4335).withOpacity(0.2), // Red
      const Color(0xFFFBBC04).withOpacity(0.2), // Yellow
    ];
    final double radius = random.nextDouble() * 2.5 + 1.0;
    final double baseOpacity = random.nextDouble() * 0.4 + 0.1;
    return Particle(
      x: random.nextDouble() * 1000,
      y: random.nextDouble() * 1000,
      vx: (random.nextDouble() - 0.5) * 0.4,
      vy: (random.nextDouble() - 0.5) * 0.4,
      radius: radius,
      opacity: baseOpacity,
      baseOpacity: baseOpacity,
      color: colors[random.nextInt(colors.length)],
    );
  }

  void update() {
    x += vx;
    y += vy;

    // Boundary wrapping
    if (x < -20) x = 1020;
    if (x > 1020) x = -20;
    if (y < -20) y = 1020;
    if (y > 1020) y = -20;
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  ParticlePainter(this.particles);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..style = PaintingStyle.fill;

    for (var particle in particles) {
      // Map coordinates to local canvas size
      final double px = (particle.x / 1000) * size.width;
      final double py = (particle.y / 1000) * size.height;

      paint.color = particle.color.withOpacity(particle.baseOpacity);
      canvas.drawCircle(Offset(px, py), particle.radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

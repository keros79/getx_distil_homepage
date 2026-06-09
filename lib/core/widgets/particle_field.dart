import 'dart:math';
import 'package:flutter/material.dart';

class ParticleField extends StatefulWidget {
  final int numberOfParticles;
  const ParticleField({super.key, this.numberOfParticles = 30});

  @override
  State<ParticleField> createState() => _ParticleFieldState();
}

class _ParticleFieldState extends State<ParticleField>
    with SingleTickerProviderStateMixin {
  late List<Particle> particles;
  late AnimationController _controller;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    particles = List.generate(
      widget.numberOfParticles,
      (index) => Particle.random(random),
    );
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..addListener(_updateParticles)
          ..repeat();
  }

  void _updateParticles() {
    // Update particle positions outside of paint()
    // to let Flutter optimize rendering
    for (var particle in particles) {
      particle.update();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_updateParticles);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ParticlePainter(particles),
      size: Size.infinite,
      // Mark as complex so the GPU creates a dedicated render layer
      isComplex: true,
      // Tell Flutter this will change every frame (allows layer caching)
      willChange: true,
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
  int _lastHash = 0;

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
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // Quick hash check: compare particle positions
    int hash = 0;
    for (var p in particles) {
      hash = hash * 31 + p.x.round();
      hash = hash * 31 + p.y.round();
    }
    final bool needsRepaint = hash != _lastHash;
    _lastHash = hash;
    return needsRepaint;
  }
}

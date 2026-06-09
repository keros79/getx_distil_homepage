import 'dart:math';
import 'package:flutter/material.dart';

class AnimatedOrb extends StatefulWidget {
  final double width;
  final double height;
  final List<Color> colors;
  final Duration duration;

  const AnimatedOrb({
    super.key,
    required this.width,
    required this.height,
    required this.colors,
    this.duration = const Duration(seconds: 15),
  });

  @override
  State<AnimatedOrb> createState() => _AnimatedOrbState();
}

class _AnimatedOrbState extends State<AnimatedOrb>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Use a 2x shorter duration and avoid reverse to reduce compute cycles
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration * 0.5,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, child) {
        final double animValue = _controller.value;
        final double scale = 0.85 + (animValue * 0.3);
        final double rotation = animValue * 2 * pi;
        final double dx = sin(animValue * pi * 2) * 25;
        final double dy = cos(animValue * pi * 2) * 25;

        // Separate Transform widgets allow the GPU to optimize
        // each transform independently instead of multiplying a full Matrix4.
        return Transform.translate(
          offset: Offset(dx, dy),
          child: Transform.rotate(
            angle: rotation,
            child: Transform.scale(scale: scale, child: child),
          ),
        );
      },
      // Pre-build the gradient container once; transforms animate on top
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            center: const Alignment(-0.3, -0.3),
            radius: 0.85,
            colors: [
              widget.colors[0],
              widget.colors[1].withValues(alpha: 0.5),
              Colors.transparent,
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
      ),
    );
  }
}

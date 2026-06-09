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
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat(reverse: true);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _animation,
      builder: (context, child) {
        final double animValue = _animation.value;
        final double scale = 0.85 + (animValue * 0.3);
        final double rotation = animValue * 2 * pi;
        final double dx = sin(animValue * pi * 2) * 25;
        final double dy = cos(animValue * pi * 2) * 25;

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(0, 3, dx)
            ..setEntry(1, 3, dy)
            ..rotateZ(rotation)
            ..scaleByDouble(scale, scale, 1, 1),
          alignment: Alignment.center,
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
      },
    );
  }
}

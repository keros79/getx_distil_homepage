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

class _AnimatedOrbState extends State<AnimatedOrb> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final double scale = 0.85 + (_animation.value * 0.3);
        final double rotation = _animation.value * 2 * pi;
        
        // Dynamic floating offset
        final double dx = sin(_animation.value * pi * 2) * 25;
        final double dy = cos(_animation.value * pi * 2) * 25;

        return Transform.translate(
          offset: Offset(dx, dy),
          child: Transform.rotate(
            angle: rotation,
            child: Transform.scale(
              scale: scale,
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
                      widget.colors[1].withOpacity(0.5),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import '../app_theme.dart';

class NextNavCard extends StatelessWidget {
  final String label;
  final String title;
  final VoidCallback onTap;
  final Color? glowColor;

  const NextNavCard({
    super.key,
    required this.label,
    required this.title,
    required this.onTap,
    this.glowColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveColor = glowColor ?? AppTheme.googleBlue;

    return Card(
      color: Colors.white.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(color: Colors.black.withOpacity(0.06)),
      ),
      elevation: glowColor != null ? 0 : null,
      shadowColor: glowColor != null ? effectiveColor.withOpacity(0.08) : null,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16.0),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    title,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_rounded,
                color: effectiveColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

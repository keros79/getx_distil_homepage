import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final double scrollOffset;

  const NavBar({
    super.key,
    required this.scrollOffset,
  });

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  void _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/keros79/getx_distil');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Dynamic styling based on scroll
    final double opacity = (scrollOffset / 150).clamp(0.0, 0.85);
    final double blur = (scrollOffset / 150).clamp(0.0, 15.0);
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 70.0,
          decoration: BoxDecoration(
            color: AppTheme.bg.withOpacity(opacity),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(scrollOffset > 50 ? 0.08 : 0.0),
                width: 1.0,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Logo
              InkWell(
                onTap: () => context.go('/'),
                borderRadius: BorderRadius.circular(8.0),
                child: Row(
                  children: [
                    // Spark/Shield logo design
                    ShaderMask(
                      shaderCallback: (bounds) => AppTheme.primaryGradient.createShader(bounds),
                      child: const Icon(
                        Icons.bolt_rounded,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Text(
                      'getx_distil',
                      style: TextStyle(
                        fontFamily: 'Google Sans Flex',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w800,
                        letterSpacing: -0.5,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),

              // Nav Links
              if (!isMobile)
                Row(
                  children: [
                    _NavLink(
                      label: 'Home',
                      onPressed: () => context.go('/'),
                      isActive: GoRouterState.of(context).uri.path == '/',
                    ),
                    _NavLink(
                      label: 'Guide',
                      onPressed: () => context.go('/guide'),
                      isActive: GoRouterState.of(context).uri.path == '/guide',
                    ),
                    _NavLink(
                      label: 'API Reference',
                      onPressed: () => context.go('/api/reactive-state'),
                      isActive: GoRouterState.of(context).uri.path.startsWith('/api'),
                    ),
                    _NavLink(
                      label: 'About',
                      onPressed: () => context.go('/about'),
                      isActive: GoRouterState.of(context).uri.path == '/about',
                    ),
                    const SizedBox(width: 16.0),
                    
                    // GitHub Button
                    ElevatedButton.icon(
                      onPressed: _launchGitHub,
                      icon: const Icon(Icons.code_rounded, size: 16.0),
                      label: const Text('GitHub'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.white.withOpacity(0.08),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          side: BorderSide(
                            color: Colors.white.withOpacity(0.12),
                            width: 1.0,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                      ),
                    ),
                  ],
                )
              else
                // Mobile menu triggers drawer (handled in home_page/pages scaffolds)
                IconButton(
                  icon: const Icon(Icons.menu_rounded, color: Colors.white),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isActive;

  const _NavLink({
    required this.label,
    required this.onPressed,
    required this.isActive,
  });

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: TextButton(
        onPressed: widget.onPressed,
        style: TextButton.styleFrom(
          foregroundColor: widget.isActive 
              ? Colors.white 
              : (_isHovered ? Colors.white : AppTheme.textSecondary),
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.label,
              style: const TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 14.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 3),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2.0,
              width: widget.isActive ? 16.0 : 0.0,
              decoration: BoxDecoration(
                color: AppTheme.googleBlue,
                borderRadius: BorderRadius.circular(1.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

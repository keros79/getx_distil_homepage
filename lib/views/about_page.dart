import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/particle_field.dart';
import '../core/widgets/glass_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  void _launchUrl(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: AppTheme.bg,
      endDrawer: isMobile ? const _AboutMobileDrawer() : null,
      body: Stack(
        children: [
          // Background particles
          const ParticleField(),

          // Main contents scroll view
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 120.0), // Space for NavBar

                  Center(
                    child: Container(
                      width: 900.0,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Developer Avatar Placeholder / Icon
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppTheme.primaryGradient,
                              boxShadow: [
                                BoxShadow(
                                  color: AppTheme.googleBlue.withOpacity(0.3),
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.person_rounded,
                                size: 50.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24.0),

                          // Name
                          const Text(
                            'Donghyeop Kang (keros79)',
                            style: TextStyle(
                              fontFamily: 'Google Sans Flex',
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: -1.0,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          const Text(
                            'Flutter Framework & Architecture Engineer',
                            style: TextStyle(
                              fontFamily: 'Google Sans Flex',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                              color: AppTheme.googleBlue,
                            ),
                          ),
                          const SizedBox(height: 32.0),

                          // Profile summary Card
                          GlassCard(
                            glowColor: AppTheme.googleBlue,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'ABOUT THE DEVELOPER',
                                  style: TextStyle(
                                    fontFamily: 'Google Sans Flex',
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.googleBlue,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                                const SizedBox(height: 16.0),
                                const Text(
                                  'Hello! I am a passionate mobile and web framework engineer interested in Flutter, state machines, reactive programming, and modular Dependency Injection (DI) system design. My goal is to build tools that maximize developer productivity and maintain high visual excellence.',
                                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 14.5, height: 1.6),
                                ),
                                const SizedBox(height: 16.0),
                                const Text(
                                  'I pioneered "getx_distil" out of a practical need to integrate the reactive DX paradigms of GetX with modern declarative routers like GoRouter, completely removing unnecessary legacy global overlays and fixing concurrency issues.',
                                  style: TextStyle(color: AppTheme.textSecondary, fontSize: 14.5, height: 1.6),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24.0),

                          // Contributions & Links
                          isMobile
                              ? Column(
                                  children: _buildLinkCards(),
                                )
                              : Row(
                                  children: _buildLinkCards().map((w) => Expanded(child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0), child: w))).toList(),
                                ),

                          const SizedBox(height: 60.0),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Fixed Glass Navbar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(scrollOffset: screenWidth > 800 ? 100 : 0),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLinkCards() {
    return [
      GlassCard(
        glowColor: AppTheme.googleGreen,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.code_rounded, color: AppTheme.googleGreen, size: 28.0),
            const SizedBox(height: 12.0),
            const Text(
              'GitHub Profile',
              style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Checkout repositories, open-source utilities, and contribute to getx_distil packages.',
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 13.0, height: 1.4),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () => _launchUrl('https://github.com/keros79'),
              child: const Text('Visit GitHub ->', style: TextStyle(color: AppTheme.googleGreen, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      const SizedBox(height: 16.0),
      GlassCard(
        glowColor: AppTheme.googleYellow,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.layers_outlined, color: AppTheme.googleYellow, size: 28.0),
            const SizedBox(height: 12.0),
            const Text(
              'pub.dev Packages',
              style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Explore published packages, benchmarks, documentation scoring, and installations.',
              style: TextStyle(color: AppTheme.textSecondary, fontSize: 13.0, height: 1.4),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () => _launchUrl('https://pub.dev/packages/getx_distil'),
              child: const Text('Visit pub.dev ->', style: TextStyle(color: AppTheme.googleYellow, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    ];
  }
}

class _AboutMobileDrawer extends StatelessWidget {
  const _AboutMobileDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.bg,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.bolt_rounded, color: AppTheme.googleBlue),
              title: const Text('getx_distil', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
              trailing: IconButton(
                icon: const Icon(Icons.close_rounded, color: AppTheme.textSecondary),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Divider(color: Color(0xFF1E1E2F)),
            ListTile(
              leading: const Icon(Icons.home_outlined, color: AppTheme.textSecondary),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                context.go('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_outlined, color: AppTheme.textSecondary),
              title: const Text('Guide', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                context.go('/guide');
              },
            ),
            ListTile(
              leading: const Icon(Icons.code_rounded, color: AppTheme.textSecondary),
              title: const Text('API Reference', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
                context.go('/api/reactive-state');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline_rounded, color: AppTheme.textSecondary),
              title: const Text('About Developer', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}

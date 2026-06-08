import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';

import '../controllers/docs_controller.dart';
import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/particle_field.dart';
import '../core/widgets/code_block.dart';
import '../core/widgets/glass_card.dart';

class GuidePage extends GetView<DocsController> {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: AppTheme.bg,
      endDrawer: isMobile ? const _GuideMobileDrawer() : null,
      body: Stack(
        children: [
          // Background Particles
          const ParticleField(),

          // Main contents
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 120.0), // Space for NavBar

                  // Contents Area
                  Center(
                    child: Container(
                      width: 1000,
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Breadcrumbs / Category tag
                          Row(
                            children: [
                              Text(
                                'DOCUMENTATION',
                                style: TextStyle(
                                  fontFamily: 'Google Sans Flex',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.googleBlue,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              const Icon(Icons.chevron_right_rounded, color: AppTheme.textMuted, size: 16.0),
                              const SizedBox(width: 8.0),
                              const Text(
                                'GETTING STARTED',
                                style: TextStyle(
                                  fontFamily: 'Google Sans Flex',
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppTheme.textSecondary,
                                  letterSpacing: 2.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16.0),

                          // Header Title
                          const Text(
                            'Quick Start Guide',
                            style: TextStyle(
                              fontFamily: 'Google Sans Flex',
                              fontSize: 38.0,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                              letterSpacing: -1.0,
                            ),
                          ),
                          const SizedBox(height: 12.0),
                          const Text(
                            'Learn how to integrate getx_distil and deploy high-performance reactive architectures in under 5 minutes.',
                            style: TextStyle(color: AppTheme.textSecondary, fontSize: 16.0, height: 1.5),
                          ),
                          const SizedBox(height: 40.0),

                          // Step 1: Installation
                          _buildSectionTitle('1. Add getx_distil dependency'),
                          const Text(
                            'Add getx_distil to your Flutter project using command line or configure it in pubspec.yaml file.',
                            style: TextStyle(color: AppTheme.textSecondary, height: 1.5),
                          ),
                          const SizedBox(height: 16.0),
                          const CodeBlock(
                            code: 'flutter pub add getx_distil',
                            language: 'bash',
                          ),
                          const SizedBox(height: 32.0),

                          // Step 2: Main Application Config
                          _buildSectionTitle('2. Set up GetMaterialApp'),
                          const Text(
                            'Configure the router and theme systems inside your core entry point using GetMaterialApp.',
                            style: TextStyle(color: AppTheme.textSecondary, height: 1.5),
                          ),
                          const SizedBox(height: 16.0),
                          const CodeBlock(
                            code: '''
import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Reactive App',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}''',
                            language: 'dart',
                          ),
                          const SizedBox(height: 32.0),

                          // Step 3: Implement Reactive State (Using controller.obx for lazy asset state load)
                          _buildSectionTitle('3. Create a Controller & View'),
                          const Text(
                            'Structure your controller classes with .obs properties. Bind the view elements with Obx wrappers to catch updates reactively.',
                            style: TextStyle(color: AppTheme.textSecondary, height: 1.5),
                          ),
                          const SizedBox(height: 16.0),

                          controller.obx(
                            (state) => CodeBlock(
                              code: state?['reactive_state'] ?? '// Failed loading code sample.',
                              language: 'dart',
                            ),
                            onLoading: const GlassCard(
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(24.0),
                                  child: CircularProgressIndicator(color: AppTheme.googleBlue),
                                ),
                              ),
                            ),
                            onError: (error) => Text('Error loading code sample: $error', style: const TextStyle(color: AppTheme.googleRed)),
                          ),

                          const SizedBox(height: 48.0),

                          // Bottom Navigation Card
                          GlassCard(
                            glowColor: AppTheme.googleGreen,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Next up',
                                      style: TextStyle(color: AppTheme.textMuted, fontSize: 13.0, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 4.0),
                                    const Text(
                                      'Explore Reactive State (Rx & Obx)',
                                      style: TextStyle(color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(Icons.arrow_forward_rounded, color: AppTheme.googleGreen),
                                  onPressed: () => context.go('/api/reactive-state'),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 80.0),
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

  Widget _buildSectionTitle(String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}

class _GuideMobileDrawer extends StatelessWidget {
  const _GuideMobileDrawer();

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
                context.go('/about');
              },
            ),
          ],
        ),
      ),
    );
  }
}

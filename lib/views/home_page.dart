import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../controllers/home_controller.dart';
import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/particle_field.dart';
import '../core/widgets/animated_orb.dart';
import '../core/widgets/glass_card.dart';
import '../core/widgets/code_block.dart';
import '../core/widgets/app_drawer.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  void _launchGitHub() async {
    final Uri url = Uri.parse('https://github.com/keros79/getx_distil');
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
      endDrawer: isMobile ? const AppDrawer() : null,
      body: Stack(
        children: [
          // 1. Particle Background
          const ParticleField(),

          // 2. Glowing Orbs (Fluid pastel colors for Light Theme)
          Positioned(
            top: -150,
            right: -100,
            child: const AnimatedOrb(
              width: 500,
              height: 500,
              colors: [Color(0x1A4285F4), Color(0x0034A853)],
              duration: Duration(seconds: 18),
            ),
          ),
          Positioned(
            bottom: -200,
            left: -150,
            child: const AnimatedOrb(
              width: 600,
              height: 600,
              colors: [Color(0x12EA4335), Color(0x00FBBC04)],
              duration: Duration(seconds: 22),
            ),
          ),

          // 3. Scrollable Contents
          Positioned.fill(
            child: SingleChildScrollView(
              controller: controller.scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 120.0), // Space for NavBar
                  // --- HERO SECTION ---
                  _buildHero(context, isMobile),

                  const SizedBox(height: 100.0),

                  // --- INTERACTIVE PLAYGROUND ---
                  _buildPlayground(context, isMobile),

                  const SizedBox(height: 120.0),

                  // --- FEATURE HIGHLIGHTS ---
                  _buildFeatures(context, isMobile),

                  const SizedBox(height: 120.0),

                  // --- ARCHITECTURE CALLOUT ---
                  _buildArchitectureCallout(context, isMobile),

                  const SizedBox(height: 100.0),

                  // --- FOOTER ---
                  _buildFooter(context, isMobile),
                ],
              ),
            ),
          ),

          // 4. Fixed Glass Navbar (Reads scrollOffset reactively)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Obx(
              () => NavBar(scrollOffset: controller.scrollOffset.value),
            ),
          ),
        ],
      ),
    );
  }

  // Hero Section
  Widget _buildHero(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: 1100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Main Header Text (Dark Gradient for Light Theme)
          ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFF1C1D21), Color(0xFF5F6368)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ).createShader(bounds),
            child: Text(
              isMobile
                  ? 'Flutter State\nManagement'
                  : 'Flutter State Management\nDistilled & Refined',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: isMobile ? 48.0 : 80.0,
                fontWeight: FontWeight.w900,
                letterSpacing: -1.5,
                height: 1.1,
                color: Colors.white, // Masked by shader
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          // Animated typing slogan
          SizedBox(
            height: 40.0,
            child: DefaultTextStyle(
              style: TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: isMobile ? 18.0 : 22.0,
                fontWeight: FontWeight.w500,
                color: AppTheme.googleBlue,
              ),
              child: AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Same Developer Experience. Zero Overhead.',
                  ),
                  TypewriterAnimatedText('Tree-Scoped Lifecycle & GC.'),
                  TypewriterAnimatedText('Self-Healing Post-Frame Rebuilds.'),
                  TypewriterAnimatedText('Fast-Path Reactive Engine.'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24.0),

          // Description Paragraph
          SizedBox(
            width: 700.0,
            child: Text(
              'A distilled, high-performance micro-state management and tree-scoped dependency injection (DI) engine for Flutter. Shed the legacy navigation overhead and build modern reactive architectures seamlessly.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: isMobile ? 14.5 : 17.0,
                height: 1.6,
                fontWeight: FontWeight.w400,
                color: AppTheme.textSecondary,
              ),
            ),
          ),
          const SizedBox(height: 40.0),

          // CTA Buttons
          Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            alignment: WrapAlignment.center,
            children: [
              // Primary Get Started
              Container(
                decoration: BoxDecoration(
                  gradient: AppTheme.primaryGradient,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.googleBlue.withOpacity(0.2),
                      blurRadius: 16.0,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () => context.go('/guide'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 20.0,
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Get Started',
                        style: TextStyle(
                          fontFamily: 'Google Sans Flex',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Icon(Icons.arrow_forward_rounded, size: 18.0),
                    ],
                  ),
                ),
              ),

              // Secondary Documentation
              OutlinedButton.icon(
                onPressed: () => context.go('/api/reactive-state'),
                icon: const Icon(Icons.menu_book_rounded, size: 18.0),
                label: const Text('API Reference'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.textPrimary,
                  side: BorderSide(
                    color: Colors.black.withOpacity(0.12),
                    width: 1.2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28.0,
                    vertical: 20.0,
                  ),
                  backgroundColor: Colors.black.withOpacity(0.01),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPlayground(BuildContext context, bool isMobile) {
    const String playgroundCode = '''
// 1. Declare reactive variables inside Controller
final counter = 0.obs;
final textInput = 'Type something...'.obs;
final demoItems = <String>[].obs;

// 2. Wrap UI widgets with Obx() for pinpoint reactive rebuilds
Obx(() => Text('\${controller.counter.value}'))

Obx(() => Text(controller.textInput.value))

Obx(() => Wrap(
  children: controller.demoItems.map((item) => Chip(label: Text(item))).toList(),
))''';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: 1000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.center,
            child: Text(
              'EXPERIENCE THE REACTIVITY',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Google Sans Flex',
                color: AppTheme.googleBlue,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'Try the micro-state engine live',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Google Sans Flex',
                color: AppTheme.textPrimary,
                fontSize: 28.0,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
          ),
          const SizedBox(height: 24.0),

          GlassCard(
            glowColor: AppTheme.googleBlue,
            child: isMobile
                ? Column(
                    children: [
                      _buildPlaygroundLeft(context),
                      const SizedBox(height: 32.0),
                      _buildPlaygroundRight(context),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildPlaygroundLeft(context)),
                      const SizedBox(width: 48.0),
                      Expanded(child: _buildPlaygroundRight(context)),
                    ],
                  ),
          ),
          const SizedBox(height: 32.0),
          const SizedBox(
            width: double.infinity,
            child: CodeBlock(code: playgroundCode, language: 'dart'),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaygroundLeft(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '🎯 Interactive Demo Controls',
          style: TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
          ),
        ),
        const SizedBox(height: 12.0),
        const Text(
          'Trigger state mutations. Obx UI elements on the right update instantly with zero lagging or full widget rebuilds.',
          style: TextStyle(color: AppTheme.textSecondary, height: 1.4),
        ),
        const SizedBox(height: 24.0),

        // Count Control
        Row(
          children: [
            ElevatedButton(
              onPressed: controller.increment,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.googleBlue.withOpacity(0.08),
                foregroundColor: AppTheme.googleBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.add_rounded, size: 16),
                  SizedBox(width: 4.0),
                  Text('Count++'),
                ],
              ),
            ),
            const SizedBox(width: 12.0),
            OutlinedButton(
              onPressed: controller.decrement,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.textSecondary,
                side: BorderSide(color: Colors.black.withOpacity(0.1)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.remove_rounded, size: 16),
                  SizedBox(width: 4.0),
                  Text('Count--'),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),

        // List Control
        Row(
          children: [
            ElevatedButton(
              onPressed: controller.addPlaygroundItem,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.googleGreen.withOpacity(0.08),
                foregroundColor: AppTheme.googleGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 12.0,
                ),
              ),
              child: const Row(
                children: [
                  Icon(Icons.playlist_add_rounded, size: 18),
                  SizedBox(width: 4.0),
                  Text('Add List Item'),
                ],
              ),
            ),
            const SizedBox(width: 12.0),
            TextButton(
              onPressed: controller.resetDemo,
              style: TextButton.styleFrom(foregroundColor: AppTheme.googleRed),
              child: const Text('Reset Demo'),
            ),
          ],
        ),
        const SizedBox(height: 24.0),

        // Input Control
        TextField(
          onChanged: (val) => controller.textInput.value = val,
          style: const TextStyle(color: AppTheme.textPrimary),
          decoration: InputDecoration(
            hintText: 'Type reactive text...',
            hintStyle: const TextStyle(color: AppTheme.textMuted),
            filled: true,
            fillColor: Colors.black.withOpacity(0.03),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.06)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: const BorderSide(color: AppTheme.googleBlue),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 14.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPlaygroundRight(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.02),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.black.withOpacity(0.04)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '🟢 LIVE STATE',
                style: TextStyle(
                  fontFamily: 'Google Sans Mono',
                  fontSize: 12.0,
                  color: AppTheme.googleGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(
                () => Text(
                  'Mutations: ${controller.clicks.value}',
                  style: const TextStyle(
                    fontFamily: 'Google Sans Mono',
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),

          // Count Display
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'controller.count:',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontFamily: 'Google Sans Mono',
                ),
              ),
              Obx(
                () => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Text(
                    '${controller.counter.value}',
                    key: ValueKey(controller.counter.value),
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                      fontFamily: 'Google Sans Mono',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24.0, color: Color(0xFFDADCE0)),

          // Text Display
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'controller.textInput.value:',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontFamily: 'Google Sans Mono',
                ),
              ),
              const SizedBox(height: 6.0),
              Obx(
                () => Text(
                  controller.textInput.value,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.googleBlue,
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24.0, color: Color(0xFFDADCE0)),

          // List Display
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'controller.items (RxList):',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontFamily: 'Google Sans Mono',
                ),
              ),
              const SizedBox(height: 8.0),
              Obx(
                () => controller.demoItems.isEmpty
                    ? const Text(
                        'List is empty.',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 13.0,
                        ),
                      )
                    : Wrap(
                        spacing: 6.0,
                        runSpacing: 6.0,
                        children: controller.demoItems.map((item) {
                          return Chip(
                            label: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 11.0,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                            backgroundColor: Colors.black.withOpacity(0.04),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 4,
                              vertical: 0,
                            ),
                          );
                        }).toList(),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Features Grid Section
  Widget _buildFeatures(BuildContext context, bool isMobile) {
    final List<Map<String, dynamic>> features = [
      {
        'title': 'Reactive State (Rx & Obx)',
        'description':
            'Declare states with simple .obs and build lightweight reactive widgets that listen only to target properties.',
        'icon': Icons.track_changes_rounded,
        'color': AppTheme.googleBlue,
        'path': 'reactive-state',
      },
      {
        'title': 'Global & Scoped DI',
        'description':
            'Access components anywhere without contexts. Fallback pipelines search for scoped instances before searching global registries.',
        'icon': Icons.settings_input_component_rounded,
        'color': AppTheme.googleGreen,
        'path': 'global-di',
      },
      {
        'title': 'Tree-Scoped Lifecycle',
        'description':
            'Isolate views and controller instances cleanly. Bind controllers directly to screens and let them Auto-GC upon unmounting.',
        'icon': Icons.account_tree_rounded,
        'color': AppTheme.googleRed,
        'path': 'binding-widget',
      },
      {
        'title': 'Global Persistent Services',
        'description':
            'Keep vital background resources (like databases or APIs) permanently in memory as Immortal Singletons.',
        'icon': Icons.cloud_done_rounded,
        'color': AppTheme.googleYellow,
        'path': 'getx-service',
      },
      {
        'title': 'Background Workers',
        'description':
            'Configure reactive pipelines with debouncing and throttling algorithms that trigger background procedures safely.',
        'icon': Icons.alarm_on_rounded,
        'color': AppTheme.googleBlue,
        'path': 'worker',
      },
      {
        'title': 'StateMixin Framework',
        'description':
            'Handle async payloads with high-level builders that structure loading, success, empty, and failure layout branches cleanly.',
        'icon': Icons.swap_horiz_rounded,
        'color': AppTheme.googleGreen,
        'path': 'state-mixin',
      },
      {
        'title': 'Reactive Internationalization',
        'description':
            'Swap languages instantly without triggering complex rebuild processes. Translates values on-the-fly dynamically.',
        'icon': Icons.translate_rounded,
        'color': AppTheme.googleYellow,
        'path': 'i18n',
      },
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: 1100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'DESIGN SYSTEM FEATURES',
            style: TextStyle(
              fontFamily: 'Google Sans Flex',
              color: AppTheme.googleGreen,
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Refined Micro-Architectures',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Google Sans Flex',
              color: AppTheme.textPrimary,
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              letterSpacing: -1.0,
            ),
          ),
          const SizedBox(height: 48.0),

          // Grid/List View Layout
          if (isMobile)
            Column(
              children: features.map((item) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: GlassCard(
                    glowColor: item['color'],
                    onTap: () => context.go('/api/${item['path']}'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(item['icon'], color: item['color'], size: 36.0),
                        const SizedBox(height: 16.0),
                        Text(
                          item['title'],
                          style: const TextStyle(
                            fontFamily: 'Google Sans Flex',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          item['description'],
                          style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 13.5,
                            height: 1.5,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Learn More',
                              style: TextStyle(
                                color: AppTheme.textSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            SizedBox(width: 4.0),
                            Icon(
                              Icons.arrow_forward_rounded,
                              size: 14.0,
                              color: AppTheme.textSecondary,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20.0,
                childAspectRatio: 1.1,
              ),
              itemCount: features.length,
              itemBuilder: (context, index) {
                final item = features[index];
                return GlassCard(
                  glowColor: item['color'],
                  onTap: () => context.go('/api/${item['path']}'),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(item['icon'], color: item['color'], size: 36.0),
                          const SizedBox(height: 16.0),
                          Text(
                            item['title'],
                            style: const TextStyle(
                              fontFamily: 'Google Sans Flex',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            item['description'],
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 13.5,
                              height: 1.5,
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Learn More',
                            style: TextStyle(
                              color: AppTheme.textSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                          SizedBox(width: 4.0),
                          Icon(
                            Icons.arrow_forward_rounded,
                            size: 14.0,
                            color: AppTheme.textSecondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  // Architecture Callout Section
  Widget _buildArchitectureCallout(BuildContext context, bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: 1100,
      child: GlassCard(
        glowColor: AppTheme.googleRed,
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 48.0),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _buildArchitectureContent(context, isMobile),
              )
            : Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildArchitectureContent(context, isMobile),
                    ),
                  ),
                  const SizedBox(width: 48.0),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.01),
                        borderRadius: BorderRadius.circular(16.0),
                        border: Border.all(
                          color: Colors.black.withOpacity(0.05),
                        ),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ArchitectureBadge(
                            text: 'GetMaterialApp',
                            color: AppTheme.googleBlue,
                          ),
                          SizedBox(height: 10),
                          _ArchitectureBadge(
                            text: 'GoRouter Config',
                            color: AppTheme.googleGreen,
                          ),
                          SizedBox(height: 10),
                          _ArchitectureBadge(
                            text: 'BindingWidget Scopes',
                            color: AppTheme.googleRed,
                          ),
                          SizedBox(height: 10),
                          _ArchitectureBadge(
                            text: 'GetView Page',
                            color: AppTheme.googleYellow,
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

  List<Widget> _buildArchitectureContent(BuildContext context, bool isMobile) {
    return [
      const Text(
        'ARCHITECTURE PATTERN',
        style: TextStyle(
          fontFamily: 'Google Sans Flex',
          color: AppTheme.googleRed,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
      ),
      const SizedBox(height: 12.0),
      const Text(
        'Aligned with Declarative Flutter',
        style: TextStyle(
          fontFamily: 'Google Sans Flex',
          color: AppTheme.textPrimary,
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16.0),
      const Text(
        'Incorporating GetX DX patterns into standard declarative routers (like GoRouter) is simplified with getx_distil. Bind controllers and views cleanly to widget tree life cycles without global route engine overheads.',
        style: TextStyle(
          color: AppTheme.textSecondary,
          height: 1.5,
          fontSize: 14.5,
        ),
      ),
      const SizedBox(height: 24.0),
      ElevatedButton(
        onPressed: () => context.go('/guide'),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppTheme.googleRed.withOpacity(0.08),
          foregroundColor: AppTheme.googleRed,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        ),
        child: const Text('Read Architecture Guide'),
      ),
    ];
  }

  // Footer Section
  Widget _buildFooter(BuildContext context, bool isMobile) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F4),
        border: Border(
          top: BorderSide(color: Colors.black.withOpacity(0.06), width: 1.0),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 24.0),
      child: Center(
        child: SizedBox(
          width: 1100,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (bounds) =>
                            AppTheme.primaryGradient.createShader(bounds),
                        child: const Icon(
                          Icons.bolt_rounded,
                          size: 24.0,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Text(
                        'getx_distil',
                        style: TextStyle(
                          fontFamily: 'Google Sans Flex',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w800,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.code_rounded,
                          color: AppTheme.textSecondary,
                          size: 20,
                        ),
                        onPressed: _launchGitHub,
                        tooltip: 'GitHub Repository',
                      ),
                      const SizedBox(width: 12.0),
                      IconButton(
                        icon: const Icon(
                          Icons.person_outline_rounded,
                          color: AppTheme.textSecondary,
                          size: 20,
                        ),
                        onPressed: () => context.go('/about'),
                        tooltip: 'About Developer',
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(height: 32.0, color: Color(0xFFDADCE0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '© 2026 getx_distil. Open source under MIT License.',
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 12.0),
                  ),
                  const Text(
                    'v1.2.4+6',
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 12.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ArchitectureBadge extends StatelessWidget {
  final String text;
  final Color color;

  const _ArchitectureBadge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: color.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Google Sans Flex',
                fontWeight: FontWeight.w600,
                fontSize: 14.0,
                color: AppTheme.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

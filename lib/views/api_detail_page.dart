import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';

import '../controllers/docs_controller.dart';
import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/sidebar_toc.dart';
import '../core/widgets/code_block.dart';
import '../core/widgets/glass_card.dart';
import '../core/widgets/particle_field.dart';

class ApiDetailPage extends GetView<DocsController> {
  final String section;

  const ApiDetailPage({
    super.key,
    required this.section,
  });

  // Section metadata mapping
  static final Map<String, Map<String, dynamic>> sectionMeta = {
    'reactive-state': {
      'title': 'Reactive State (Rx & Obx)',
      'codeKey': 'reactive_state',
      'description': 'Pinpoint reactive updates without boilerplate. Bind view leaf widgets to target properties and let getx_distil handle efficient rebuilds automatically.',
      'points': [
        'Self-Healing Updates: Defers layout-phase updates post-frame to prevent setState() crashes.',
        'Strict Validation: Detects unsafe async await loops inside Obx and triggers helpful debugging exceptions.',
        'Fast-Path Evaluation: Bypasses proxy overhead lookup when tracking is idle, maximizing computation speed.',
        'Batched Mutations: Groups updates dynamically inside loops, triggering single-microtask UI updates.'
      ],
      'next': 'global-di',
      'nextTitle': 'Global Dependency Injection',
      'color': AppTheme.googleBlue,
    },
    'global-di': {
      'title': 'Global Dependency Injection',
      'codeKey': 'global_di',
      'description': 'Instantiate or lazily register controllers globally. Retrieve singletons securely from anywhere in your business logic without needing contexts.',
      'points': [
        'Context-less Access: Fetch controllers easily using Get.find<T>() inside static logic threads.',
        'Tag Namespace support: Tag classes to register multiple parallel class instances.',
        'Hybrid Resolver pipeline: Prioritizes local BindingWidget scopes before searching global registry maps.',
      ],
      'next': 'binding-widget',
      'nextTitle': 'Widget Tree Scoped DI',
      'color': AppTheme.googleGreen,
    },
    'binding-widget': {
      'title': 'Widget Tree Scoped DI',
      'codeKey': 'binding_widget',
      'description': 'Scope controller lifecycles directly to widget subtrees. Automates garbage collection and prevents instances from leaking across multi-page configurations.',
      'points': [
        '100% Tree-Scoped DI: Binds controller instances to widget elements.',
        'Automatic GC: Unregisters and disposes controllers automatically when the view unmounts.',
        'Declarative Routes alignment: Ideal for GoRouter or navigator subtrees to ensure isolation.'
      ],
      'next': 'getx-service',
      'nextTitle': 'Global Persistent Services',
      'color': AppTheme.googleRed,
    },
    'getx-service': {
      'title': 'Global Persistent Services',
      'codeKey': 'getx_service',
      'description': 'Define permanent singletons (GetxService) that must remain active across the entire application lifecycle (Databases, Auth Managers, etc.).',
      'points': [
        'Immortal Singletons: Remains resident in memory and ignores standard controller garbage-collection.',
        'Infrastructure Layers: Designed specifically for configurations, storage wrappers, and network layers.',
        'Sequential Init: Allows bootstrapping setup routines synchronously during application start.'
      ],
      'next': 'worker',
      'nextTitle': 'Background Side-Effects',
      'color': AppTheme.googleYellow,
    },
    'worker': {
      'title': 'Background Side-Effects',
      'codeKey': 'worker',
      'description': 'Monitor reactive variables and trigger callbacks. Perfect for rate-limiting, background sync processes, and input searches.',
      'points': [
        'Debounce Workers: Throttle rapid user typing interactions before querying API controllers.',
        'Safe Auto-Disposal: Enforces explicit Worker.dispose() routines to avoid background memory leaks.',
        'Clean Lifecycle hooks: Declare inside onInit() and unregister inside onClose() triggers.'
      ],
      'next': 'state-mixin',
      'nextTitle': 'Declarative Async Branching',
      'color': AppTheme.googleBlue,
    },
    'state-mixin': {
      'title': 'Declarative Async Branching',
      'codeKey': 'state_mixin',
      'description': 'Eradicate nested conditional checks. Map typical loading, success, empty, and network error layout screens cleanly.',
      'points': [
        'Declarative UI branch parsing: obx() builder matches typical request lifecycle states.',
        'Built-in Status tags: loading, success, empty, error (with parameters support).',
        'Minimal boilerplate: Eliminates nested if-else checks inside build routines.'
      ],
      'next': 'i18n',
      'nextTitle': 'Reactive Internationalization',
      'color': AppTheme.googleGreen,
    },
    'i18n': {
      'title': 'Reactive Internationalization',
      'codeKey': 'i18n',
      'description': 'Swap languages on-the-fly reactively. Distilled translation dictionary structures allow seamless localization updates.',
      'points': [
        'Dynamic runtime swap: Switch Locale maps dynamically and let target labels translate instantly.',
        'tr and trParams extension support: Dynamic parameter string injection directly in translations.',
        'Clean dictionary mapping: Structure locale keys inside a simple Translations subclass.'
      ],
      'next': 'guide',
      'nextTitle': 'Back to Guide',
      'color': AppTheme.googleYellow,
    },
  };

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 1000;
    
    // Retrieve metadata for current section
    final meta = sectionMeta[section] ?? sectionMeta['reactive-state']!;
    final String title = meta['title'];
    final String codeKey = meta['codeKey'];
    final String description = meta['description'];
    final List<String> points = List<String>.from(meta['points']);
    final String nextSection = meta['next'];
    final String nextTitle = meta['nextTitle'];
    final Color color = meta['color'];

    Widget contentBody = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category Label
        Row(
          children: [
            const Text(
              'API REFERENCE',
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
            Text(
              section.toUpperCase(),
              style: const TextStyle(
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

        // Section Title
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: AppTheme.textPrimary,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 16.0),

        // Description
        Text(
          description,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 15.5,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32.0),

        // Key Enhancements (Glow panel)
        const Text(
          'KEY ENHANCEMENTS',
          style: TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: AppTheme.textSecondary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 12.0),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.offline_bolt_rounded, color: color, size: 18.0),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Text(
                      point,
                      style: const TextStyle(color: AppTheme.textSecondary, fontSize: 14.0, height: 1.4),
                    ),
                  ),
                ],
              ),
            )),
        
        const SizedBox(height: 40.0),

        // Code block
        const Text(
          'IMPLEMENTATION EXAMPLE',
          style: TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: AppTheme.textSecondary,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16.0),
        
        controller.obx(
          (state) => CodeBlock(
            code: state?[codeKey] ?? '// Sample code loading failed.',
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
          glowColor: color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Next Topic',
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 13.0, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    nextTitle,
                    style: const TextStyle(color: AppTheme.textPrimary, fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_rounded, color: color),
                onPressed: () {
                  if (nextSection == 'guide') {
                    context.go('/guide');
                  } else {
                    context.go('/api/$nextSection');
                  }
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 80.0),
      ],
    );

    return Scaffold(
      backgroundColor: AppTheme.bg,
      endDrawer: isMobile ? const _ApiMobileDrawer() : null,
      body: Stack(
        children: [
          // Background particles
          const ParticleField(),

          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 70.0), // Space for NavBar
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Desktop Sidebar
                      if (!isMobile) SidebarToc(activePath: section),
                      
                      // Content Area
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 24.0 : 48.0,
                            vertical: 32.0,
                          ),
                          child: Center(
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 800),
                              child: contentBody,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
}

// Mobile End Drawer for API pages (links to sections)
class _ApiMobileDrawer extends StatelessWidget {
  const _ApiMobileDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.bg,
      child: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.bolt_rounded, color: AppTheme.googleBlue),
              title: const Text('getx_distil API', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
              trailing: IconButton(
                icon: const Icon(Icons.close_rounded, color: AppTheme.textSecondary),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            const Divider(color: Color(0xFF1E1E2F)),
            ListTile(
              leading: const Icon(Icons.home_outlined, color: AppTheme.textSecondary),
              title: const Text('Home', style: TextStyle(color: AppTheme.textPrimary)),
              onTap: () {
                Navigator.of(context).pop();
                context.go('/');
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_outlined, color: AppTheme.textSecondary),
              title: const Text('Guide', style: TextStyle(color: AppTheme.textPrimary)),
              onTap: () {
                Navigator.of(context).pop();
                context.go('/guide');
              },
            ),
            const Divider(color: Color(0xFF1E1E2F)),
            
            // Section list for quick swap
            Expanded(
              child: ListView.builder(
                itemCount: SidebarToc.sections.length,
                itemBuilder: (context, index) {
                  final sec = SidebarToc.sections[index];
                  return ListTile(
                    leading: Text(sec['icon']!),
                    title: Text(sec['title']!, style: const TextStyle(color: AppTheme.textPrimary, fontSize: 13.5)),
                    onTap: () {
                      Navigator.of(context).pop();
                      context.go('/api/${sec['path']}');
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

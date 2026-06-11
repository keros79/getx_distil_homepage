import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';

import '../controllers/docs_controller.dart';
import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/sidebar_toc.dart';
import '../core/widgets/code_block.dart';
import '../core/widgets/glass_card.dart';
import '../core/widgets/next_nav_card.dart';
import '../core/widgets/app_drawer.dart';

class ApiDetailPage extends StatefulWidget {
  final String section;

  const ApiDetailPage({super.key, required this.section});

  @override
  State<ApiDetailPage> createState() => _ApiDetailPageState();
}

class _ApiDetailPageState extends State<ApiDetailPage> {
  late final ScrollController _scrollController;
  late final DocsController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.find<DocsController>();
    _scrollController = ScrollController();
  }

  @override
  void didUpdateWidget(ApiDetailPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.section != oldWidget.section) {
      _scrollController.jumpTo(0.0);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Section metadata mapping
  static final Map<String, Map<String, dynamic>> sectionMeta = {
    'reactive-state': {
      'title': 'Reactive State (Rx & Obx)',
      'codeKey': 'reactive_state',
      'description':
          'Pinpoint reactive updates without boilerplate. Bind view leaf widgets to target properties and let getx_distil handle efficient rebuilds automatically.',
      'points': [
        'Self-Healing Updates: Defers layout-phase updates post-frame to prevent setState() crashes.',
        'Strict Validation: Detects unsafe async await loops inside Obx and triggers helpful debugging exceptions.',
        'Fast-Path Evaluation: Bypasses proxy overhead lookup when tracking is idle, maximizing computation speed.',
        'Batched Mutations: Groups updates dynamically inside loops, triggering single-microtask UI updates.',
      ],
      'next': 'rxs',
      'nextTitle': 'Status-Aware Observables',
      'color': AppTheme.googleBlue,
    },
    'rxs': {
      'title': 'Status-Aware Observables (RxSList & RxS)',
      'codeKey': 'rxs',
      'description':
          'Simplify async state lifecycle handling. RxSList and RxS bundle loading, loaded, empty, and error states directly with state mutations, eliminating extra boilerplate flags.',
      'points': [
        '1. RxSList (Reactive List): Extends RxList to auto-sync status (loading, loaded, empty) with mutations like add, assignAll, and clear.',
        '2. RxS (Reactive Value): Extends Rxn to carry async status (loading, loaded, error) for single-object models like user profiles.',
        'Declarative UI Binding: Use the on() builder inside Obx to write clean layout branches for different async states.',
        'Resilient Data Retention: Assigning error preserves existing data underneath, allowing retry options without visual flickers.',
      ],
      'next': 'global-di',
      'nextTitle': 'Global Dependency Injection',
      'color': AppTheme.googleBlue,
    },
    'global-di': {
      'title': 'Global Dependency Injection',
      'codeKey': 'global_di',
      'description':
          'Instantiate or lazily register controllers globally. Retrieve singletons securely from anywhere in your business logic without needing contexts.',
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
      'description':
          'Scope controller lifecycles directly to widget subtrees. Automates garbage collection and prevents instances from leaking across multi-page configurations.',
      'points': [
        '100% Tree-Scoped DI: Binds controller instances to widget elements.',
        'Automatic GC: Unregisters and disposes controllers automatically when the view unmounts.',
        'Declarative Routes alignment: Ideal for GoRouter or navigator subtrees to ensure isolation.',
      ],
      'next': 'getx-service',
      'nextTitle': 'Global Persistent Services',
      'color': AppTheme.googleRed,
    },
    'getx-service': {
      'title': 'Global Persistent Services',
      'codeKey': 'getx_service',
      'description':
          'Define permanent singletons (GetxService) that must remain active across the entire application lifecycle (Databases, Auth Managers, etc.).',
      'points': [
        'Immortal Singletons: Remains resident in memory and ignores standard controller garbage-collection.',
        'Infrastructure Layers: Designed specifically for configurations, storage wrappers, and network layers.',
        'Sequential Init: Allows bootstrapping setup routines synchronously during application start.',
      ],
      'next': 'worker',
      'nextTitle': 'Background Side-Effects',
      'color': AppTheme.googleYellow,
    },
    'worker': {
      'title': 'Background Side-Effects',
      'codeKey': 'worker',
      'description':
          'Monitor reactive variables and trigger callbacks. Perfect for rate-limiting, background sync processes, and input searches.',
      'points': [
        'Debounce Workers: Throttle rapid user typing interactions before querying API controllers.',
        'Safe Auto-Disposal: Enforces explicit Worker.dispose() routines to avoid background memory leaks.',
        'Clean Lifecycle hooks: Declare inside onInit() and unregister inside onClose() triggers.',
      ],
      'next': 'state-mixin',
      'nextTitle': 'Declarative Async Branching',
      'color': AppTheme.googleBlue,
    },
    'state-mixin': {
      'title': 'Declarative Async Branching',
      'codeKey': 'state_mixin',
      'description':
          'Eradicate nested conditional checks. Map typical loading, success, empty, and network error layout screens cleanly.',
      'points': [
        'Declarative UI branch parsing: obx() builder matches typical request lifecycle states.',
        'Built-in Status tags: loading, success, empty, error (with parameters support).',
        'Minimal boilerplate: Eliminates nested if-else checks inside build routines.',
      ],
      'next': 'i18n',
      'nextTitle': 'Reactive Localization',
      'color': AppTheme.googleGreen,
    },
    'i18n': {
      'title': 'Reactive Localization',
      'codeKey': 'i18n',
      'description':
          'Swap languages on-the-fly reactively. Distilled translation dictionary structures allow seamless localization updates.',
      'points': [
        'Dynamic runtime swap: Switch Locale maps dynamically and let target labels translate instantly.',
        'tr and trParams extension support: Dynamic parameter string injection directly in translations.',
        'Clean dictionary mapping: Structure locale keys inside a simple Translations subclass.',
      ],
      'next': 'comparison',
      'nextTitle': 'Comparison Overview',
      'color': AppTheme.googleGreen,
    },
  };

  @override
  Widget build(BuildContext context) {
    final section = widget.section;
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    final meta = sectionMeta[section] ?? sectionMeta['reactive-state']!;
    final String title = meta['title'] as String;
    final String codeKey = meta['codeKey'] as String;
    final String description = meta['description'] as String;
    final List<String> points = meta['points'] as List<String>;
    final String nextSection = meta['next'] as String;
    final String nextTitle = meta['nextTitle'] as String;
    final Color color = meta['color'] as Color;

    final contentBody = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Category / Breadcrumb
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
            const Icon(
              Icons.chevron_right_rounded,
              color: AppTheme.textMuted,
              size: 16.0,
            ),
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

        // Title
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 36.0,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -1.0,
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          description,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 16.0,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 32.0),

        // Points
        const Text(
          'KEY ENHANCEMENTS',
          style: TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 12.0,
            color: AppTheme.textMuted,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16.0),
        Column(
          children: points.map((pt) {
            final parts = pt.split(':');
            final prefix = parts[0];
            final suffix = parts.length > 1 ? parts[1] : '';

            return Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.bolt_rounded, color: color, size: 20.0),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14.5,
                          height: 1.5,
                          fontFamily: 'Google Sans Flex',
                        ),
                        children: [
                          TextSpan(
                            text: '$prefix:',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                          TextSpan(text: suffix),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 32.0),

        // Live Demo Code
        const Text(
          'IMPLEMENTATION EXAMPLE',
          style: TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 12.0,
            color: AppTheme.textMuted,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 16.0),
        controller.obx(
          (state) => CodeBlock(
            code: state?[codeKey] ?? '// Failed loading code sample.',
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
          onError: (error) => Text(
            'Error loading code sample: $error',
            style: const TextStyle(color: AppTheme.googleRed),
          ),
        ),
        const SizedBox(height: 48.0),

        // Next Card
        NextNavCard(
          label: 'Next up',
          title: 'Explore $nextTitle',
          glowColor: color,
          onTap: () {
            if (nextSection == 'comparison') {
              context.go('/comparison/overview');
            } else {
              context.go('/api/$nextSection');
            }
          },
        ),
        const SizedBox(height: 80.0),
      ],
    );

    return Scaffold(
      backgroundColor: AppTheme.bg,
      endDrawer: isMobile ? const AppDrawer() : null,
      appBar: const NavBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Desktop Sidebar
          if (!isMobile) SidebarToc(activePath: section),

          // Content Area
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
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
    );
  }
}

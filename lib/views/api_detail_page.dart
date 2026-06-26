import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';

import '../controllers/api_detail_controller.dart';
import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/sidebar_toc.dart';
import '../core/widgets/code_block.dart';
import '../core/widgets/glass_card.dart';
import '../core/widgets/next_nav_card.dart';
import '../core/widgets/app_drawer.dart';
import '../core/widgets/scroll_resetter.dart';

class ApiDetailPage extends GetView<ApiDetailController> {
  final String section;

  const ApiDetailPage({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    final meta = controller.sectionMeta[section] ?? controller.sectionMeta['reactive-state']!;
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
            Text(
              'api.breadcrumb'.tr,
              style: const TextStyle(
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
        Text(
          'api.key_enhancements'.tr,
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
                    child: Text.rich(
                      TextSpan(
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
        Text(
          'api.impl_example'.tr,
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
          label: 'api.next_up'.tr,
          title: '${'api.next_explore'.tr} $nextTitle',
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
      endDrawer: isMobile ? AppDrawer() : null,
      appBar: NavBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Desktop Sidebar
          if (!isMobile) SidebarToc(activePath: section),

          // Content Area
          Expanded(
            child: ScrollResetter(
              param: section,
              scrollController: controller.scrollController,
              child: SingleChildScrollView(
                controller: controller.scrollController,
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
          ),
        ],
      ),
    );
  }
}

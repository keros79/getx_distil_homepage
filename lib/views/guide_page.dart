import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';

import '../controllers/guide_controller.dart';
import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/code_block.dart';
import '../core/widgets/glass_card.dart';
import '../core/widgets/next_nav_card.dart';
import '../core/widgets/app_drawer.dart';

class GuidePage extends GetView<GuideController> {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      backgroundColor: AppTheme.bg,
      endDrawer: isMobile ? const AppDrawer() : null,
      appBar: const NavBar(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
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
                          'guide.breadcrumb_1'.tr,
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
                          'guide.breadcrumb_2'.tr,
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

                    // Header Title
                    Text(
                      'guide.title'.tr,
                      style: const TextStyle(
                        fontFamily: 'Google Sans Flex',
                        fontSize: 38.0,
                        fontWeight: FontWeight.w800,
                        color: AppTheme.textPrimary,
                        letterSpacing: -1.0,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      'guide.description'.tr,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 16.0,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 40.0),

                    // Step 1: Installation
                    _buildSectionTitle('guide.step1_title'.tr),
                    Text(
                      'guide.step1_desc'.tr,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const CodeBlock(
                      code: 'flutter pub add getx_distil',
                      language: 'bash',
                    ),
                    const SizedBox(height: 32.0),

                    // Step 2: Main Application Config
                    _buildSectionTitle('guide.step2_title'.tr),
                    Text(
                      'guide.step2_desc'.tr,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        height: 1.5,
                      ),
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
                    _buildSectionTitle('guide.step3_title'.tr),
                    Text(
                      'guide.step3_desc'.tr,
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16.0),

                    controller.obx(
                      (state) => CodeBlock(
                        code: state?['reactive_state'] ??
                            '// Failed loading code sample.',
                        language: 'dart',
                      ),
                      onLoading: const GlassCard(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(24.0),
                            child: CircularProgressIndicator(
                              color: AppTheme.googleBlue,
                            ),
                          ),
                        ),
                      ),
                      onError: (error) => Text(
                        'Error loading code sample: $error',
                        style: const TextStyle(color: AppTheme.googleRed),
                      ),
                    ),

                    const SizedBox(height: 48.0),

                    // Bottom Navigation Card
                    NextNavCard(
                      label: 'guide.next_label'.tr,
                      title: 'guide.next_title'.tr,
                      glowColor: AppTheme.googleGreen,
                      onTap: () => context.go('/api/reactive-state'),
                    ),
                    const SizedBox(height: 80.0),
                  ],
                ),
              ),
            ),
          ],
        ),
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
            color: AppTheme.textPrimary,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}

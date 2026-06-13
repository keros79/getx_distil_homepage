import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import '../controllers/home_controller.dart';
import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
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
      appBar: const NavBar(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
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
                  ? 'home.hero_title_mobile'.tr
                  : 'home.hero_title_desktop'.tr,
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
                    'home.slogan_1'.tr,
                  ),
                  TypewriterAnimatedText('home.slogan_2'.tr),
                  TypewriterAnimatedText('home.slogan_3'.tr),
                  TypewriterAnimatedText('home.slogan_4'.tr),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24.0),

          // Description Paragraph
          SizedBox(
            width: 700.0,
            child: Text(
              'home.hero_desc'.tr,
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
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'home.btn_get_started'.tr,
                        style: const TextStyle(
                          fontFamily: 'Google Sans Flex',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Icon(Icons.arrow_forward_rounded, size: 18.0),
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
    const String classicRxCode = '''
// === 1. Classic Rx States & Obx ===
final counter = 0.obs;
final textInput = 'Hello'.obs;

Obx(() => Text('Count: \${controller.counter.value}'));
Obx(() => Text('Input: \${controller.textInput.value}'));''';

    const String rxsCode = '''
// === 2. Status-Aware Rx States (RxSList, RxS) ===
// You can declare via constructor or .ops extension on Lists
final demoItems = RxSList<String>(); // Auto-syncs idle/loading/loaded/empty/error
// Or: final demoItems = <String>[].ops; // converts List to RxSList

final rxUser = RxS<String?>(null);   // Auto-syncs idle/loading/loaded/error

// Mutating status-aware states automatically syncs status
void loadDemoList() {
  demoItems.assignAll(['Apple 🍎', 'Banana 🍌']); // status -> loaded
}

// Bind UI with .on() inside Obx
Obx(() => demoItems.on(
  idle: () => const Text('Idle'),
  loading: () => const CircularProgressIndicator(),
  loaded: (data) => Wrap(children: data.map((item) => Text(item)).toList()),
  empty: () => const Text('Empty'),
  error: (err) => Text('Error: \${err ?? "Unknown"}'),
));

Obx(() => rxUser.on(
  idle: () => const Text('Idle'),
  loading: () => const CircularProgressIndicator(),
  loaded: (name) => Text('User: \$name'),
  error: (err) => Text('Error: \${err ?? "Unknown"}'),
));''';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      width: 1000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              'home.playground_label'.tr,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Google Sans Flex',
                color: AppTheme.googleBlue,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.0,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.center,
            child: Text(
              'home.playground_title'.tr,
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
          const SizedBox(height: 32.0),

          // Main Header Info text moved above the Card
          Text(
            'home.demo_title'.tr,
            style: const TextStyle(
              fontFamily: 'Google Sans Flex',
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            'home.demo_desc'.tr,
            style: const TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 14.5,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 32.0),

          // --- SECTION 1: Classic Rx State ---
          GlassCard(
            glowColor: AppTheme.googleBlue,
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildClassicRxLeft(context),
                      const SizedBox(height: 32.0),
                      _buildClassicRxRight(context),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildClassicRxLeft(context)),
                      const SizedBox(width: 48.0),
                      Expanded(child: _buildClassicRxRight(context)),
                    ],
                  ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(
            width: double.infinity,
            child: CodeBlock(code: classicRxCode, language: 'dart'),
          ),

          const SizedBox(height: 48.0),

          // --- SECTION 2: Status-Aware Rx States (RxSList/RxS) ---
          GlassCard(
            glowColor: AppTheme.googleGreen,
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRxSLeft(context),
                      const SizedBox(height: 32.0),
                      _buildRxSRight(context),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _buildRxSLeft(context)),
                      const SizedBox(width: 48.0),
                      Expanded(child: _buildRxSRight(context)),
                    ],
                  ),
          ),
          const SizedBox(height: 16.0),
          const SizedBox(
            width: double.infinity,
            child: CodeBlock(code: rxsCode, language: 'dart'),
          ),
        ],
      ),
    );
  }

  Widget _buildClassicRxLeft(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Classic Rx Section
        Text(
          'home.demo_rx_label'.tr,
          style: const TextStyle(
            fontFamily: 'Google Sans Mono',
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: AppTheme.googleBlue,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 12.0),
        Row(
          children: [
            ElevatedButton(
              onPressed: controller.increment,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.googleBlue.withOpacity(0.08),
                foregroundColor: AppTheme.googleBlue,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
              ),
              child: Row(
                children: [
                  const Icon(Icons.add_rounded, size: 16),
                  const SizedBox(width: 4.0),
                  Text('home.btn_count_up'.tr),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            OutlinedButton(
              onPressed: controller.decrement,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.textSecondary,
                side: BorderSide(color: Colors.black.withOpacity(0.1)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
              ),
              child: Row(
                children: [
                  const Icon(Icons.remove_rounded, size: 16),
                  const SizedBox(width: 4.0),
                  Text('home.btn_count_down'.tr),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0),
        TextField(
          onChanged: (val) => controller.textInput.value = val,
          style: const TextStyle(color: AppTheme.textPrimary, fontSize: 14.0),
          decoration: InputDecoration(
            hintText: 'home.demo_hint'.tr,
            hintStyle: const TextStyle(color: AppTheme.textMuted),
            filled: true,
            fillColor: Colors.black.withOpacity(0.03),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Colors.black.withOpacity(0.06)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: AppTheme.googleBlue),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
          ),
        ),
      ],
    );
  }

  Widget _buildClassicRxRight(BuildContext context) {
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
              Text(
                'home.live_state_label'.tr,
                style: const TextStyle(
                  fontFamily: 'Google Sans Mono',
                  fontSize: 12.0,
                  color: AppTheme.googleGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(
                () => Text(
                  'home.mutations_count'
                      .trParams({'count': '${controller.clicks.value}'}),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'counter (RxInt):',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13.0,
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
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textPrimary,
                      fontFamily: 'Google Sans Mono',
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'textInput (RxString):',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13.0,
                  fontFamily: 'Google Sans Mono',
                ),
              ),
              const SizedBox(height: 4.0),
              Obx(
                () => Text(
                  '"${controller.textInput.value}"',
                  style: const TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.googleBlue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRxSLeft(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 2. RxSList Section
        Text(
          'home.demo_rxslist_label'.tr,
          style: const TextStyle(
            fontFamily: 'Google Sans Mono',
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: AppTheme.googleGreen,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 12.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            ElevatedButton(
              onPressed: controller.loadDemoList,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.googleGreen.withOpacity(0.08),
                foregroundColor: AppTheme.googleGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
              ),
              child: Text('home.btn_load_items'.tr),
            ),
            ElevatedButton(
              onPressed: controller.addPlaygroundItem,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.googleGreen.withOpacity(0.08),
                foregroundColor: AppTheme.googleGreen,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
              ),
              child: Text('home.btn_add_item'.tr),
            ),
            OutlinedButton(
              onPressed: controller.triggerDemoListError,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.googleRed,
                side: BorderSide(color: AppTheme.googleRed.withOpacity(0.2)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
              ),
              child: Text('home.btn_simulate_error'.tr),
            ),
            OutlinedButton(
              onPressed: controller.clearDemoList,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.textSecondary,
                side: BorderSide(color: Colors.black.withOpacity(0.1)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
              ),
              child: Text('home.btn_clear_list'.tr),
            ),
          ],
        ),
        const SizedBox(height: 24.0),

        // 3. RxS Section
        Text(
          'home.demo_rxs_label'.tr,
          style: const TextStyle(
            fontFamily: 'Google Sans Mono',
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: AppTheme.googleYellow,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 12.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            ElevatedButton(
              onPressed: controller.loadUser,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.googleYellow.withOpacity(0.08),
                foregroundColor: AppTheme.googleYellow,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
              ),
              child: Text('home.btn_load_user'.tr),
            ),
            OutlinedButton(
              onPressed: controller.triggerUserError,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.googleRed,
                side: BorderSide(color: AppTheme.googleRed.withOpacity(0.2)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
              ),
              child: Text('home.btn_simulate_error'.tr),
            ),
            OutlinedButton(
              onPressed: controller.resetUser,
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.textSecondary,
                side: BorderSide(color: Colors.black.withOpacity(0.1)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                padding: const EdgeInsets.symmetric(
                    horizontal: 14.0, vertical: 12.0),
              ),
              child: Text('home.btn_reset_idle'.tr),
            ),
          ],
        ),
        const SizedBox(height: 24.0),
        const Divider(height: 1, color: Color(0xFFDADCE0)),
        const SizedBox(height: 16.0),
        TextButton.icon(
          onPressed: controller.resetDemo,
          icon: const Icon(Icons.refresh_rounded, size: 18),
          label: Text('home.btn_reset_all'.tr),
          style: TextButton.styleFrom(
            foregroundColor: AppTheme.googleRed,
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
          ),
        ),
      ],
    );
  }

  Widget _buildRxSRight(BuildContext context) {
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
              Text(
                'home.live_state_label'.tr,
                style: const TextStyle(
                  fontFamily: 'Google Sans Mono',
                  fontSize: 12.0,
                  color: AppTheme.googleGreen,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Obx(
                () => Text(
                  'home.mutations_count'
                      .trParams({'count': '${controller.clicks.value}'}),
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

          // 2. RxSList (demoItems) Display
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'demoItems (RxSList):',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13.0,
                      fontFamily: 'Google Sans Mono',
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color:
                            _getRxListStatusColor(controller.demoItems.status)
                                .withOpacity(0.08),
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                            color: _getRxListStatusColor(
                                    controller.demoItems.status)
                                .withOpacity(0.2)),
                      ),
                      child: Text(
                        controller.demoItems.status.name.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Google Sans Mono',
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color: _getRxListStatusColor(
                              controller.demoItems.status),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Obx(
                () => controller.demoItems.on(
                  idle: () => Container(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline_rounded,
                            color: AppTheme.textMuted, size: 16),
                        const SizedBox(width: 8.0),
                        Text(
                          'home.list_idle'.tr,
                          style: const TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 13.0,
                              fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  loading: () => Container(
                    height: 48,
                    alignment: Alignment.center,
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppTheme.googleGreen),
                    ),
                  ),
                  loaded: (data) => Wrap(
                    spacing: 6.0,
                    runSpacing: 6.0,
                    children: data.map((item) {
                      return Chip(
                        label: Text(
                          item,
                          style: const TextStyle(
                              fontSize: 11.0, color: AppTheme.textPrimary),
                        ),
                        backgroundColor: Colors.black.withOpacity(0.04),
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 0),
                      );
                    }).toList(),
                  ),
                  empty: () => Text(
                    'home.list_empty'.tr,
                    style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 13.0,
                        fontStyle: FontStyle.italic),
                  ),
                  error: (error) => Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppTheme.googleRed.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline_rounded,
                            color: AppTheme.googleRed, size: 16),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            error ?? 'Unknown Error',
                            style: const TextStyle(
                                color: AppTheme.googleRed, fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 24.0, color: Color(0xFFDADCE0)),

          // 3. RxS (rxUser) Display
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'rxUser (RxS):',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13.0,
                      fontFamily: 'Google Sans Mono',
                    ),
                  ),
                  Obx(
                    () => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: _getRxDataStatusColor(controller.rxUser.status)
                            .withOpacity(0.08),
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                            color:
                                _getRxDataStatusColor(controller.rxUser.status)
                                    .withOpacity(0.2)),
                      ),
                      child: Text(
                        controller.rxUser.status.name.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Google Sans Mono',
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                          color:
                              _getRxDataStatusColor(controller.rxUser.status),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Obx(
                () => controller.rxUser.on(
                  idle: () => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.02),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Colors.black.withOpacity(0.05)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline_rounded,
                            color: AppTheme.textMuted, size: 20),
                        const SizedBox(width: 8.0),
                        Text(
                          'home.user_idle'.tr,
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  loading: () => Container(
                    height: 48,
                    alignment: Alignment.center,
                    child: const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          strokeWidth: 2, color: AppTheme.googleYellow),
                    ),
                  ),
                  loaded: (data) => Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: AppTheme.googleYellow.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                          color: AppTheme.googleYellow.withOpacity(0.1)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.person_rounded,
                            color: AppTheme.googleYellow, size: 20),
                        const SizedBox(width: 8.0),
                        Text(
                          data ?? 'Null / Guest User',
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  error: (error) => Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppTheme.googleRed.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.error_outline_rounded,
                            color: AppTheme.googleRed, size: 16),
                        const SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            error ?? 'Unknown Error',
                            style: const TextStyle(
                                color: AppTheme.googleRed, fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color _getRxListStatusColor(RxListStatus status) {
    switch (status) {
      case RxListStatus.idle:
        return AppTheme.textMuted;
      case RxListStatus.loading:
        return AppTheme.googleBlue;
      case RxListStatus.loaded:
        return AppTheme.googleGreen;
      case RxListStatus.empty:
        return AppTheme.textMuted;
      case RxListStatus.error:
        return AppTheme.googleRed;
    }
  }

  Color _getRxDataStatusColor(RxDataStatus status) {
    switch (status) {
      case RxDataStatus.idle:
        return AppTheme.textMuted;
      case RxDataStatus.loading:
        return AppTheme.googleYellow;
      case RxDataStatus.loaded:
        return AppTheme.googleGreen;
      case RxDataStatus.error:
        return AppTheme.googleRed;
    }
  }

  // Features Grid Section
  Widget _buildFeatures(BuildContext context, bool isMobile) {
    final List<Map<String, dynamic>> features = [
      {
        'title': 'home.feat.reactive_state.title'.tr,
        'description': 'home.feat.reactive_state.desc'.tr,
        'icon': Icons.track_changes_rounded,
        'color': AppTheme.googleBlue,
        'path': 'reactive-state',
      },
      {
        'title': 'home.feat.rxs.title'.tr,
        'description': 'home.feat.rxs.desc'.tr,
        'icon': Icons.playlist_add_check_rounded,
        'color': AppTheme.googleBlue,
        'path': 'rxs',
      },
      {
        'title': 'home.feat.global_di.title'.tr,
        'description': 'home.feat.global_di.desc'.tr,
        'icon': Icons.settings_input_component_rounded,
        'color': AppTheme.googleGreen,
        'path': 'global-di',
      },
      {
        'title': 'home.feat.binding_widget.title'.tr,
        'description': 'home.feat.binding_widget.desc'.tr,
        'icon': Icons.account_tree_rounded,
        'color': AppTheme.googleRed,
        'path': 'binding-widget',
      },
      {
        'title': 'home.feat.getx_service.title'.tr,
        'description': 'home.feat.getx_service.desc'.tr,
        'icon': Icons.cloud_done_rounded,
        'color': AppTheme.googleYellow,
        'path': 'getx-service',
      },
      {
        'title': 'home.feat.worker.title'.tr,
        'description': 'home.feat.worker.desc'.tr,
        'icon': Icons.alarm_on_rounded,
        'color': AppTheme.googleBlue,
        'path': 'worker',
      },
      {
        'title': 'home.feat.state_mixin.title'.tr,
        'description': 'home.feat.state_mixin.desc'.tr,
        'icon': Icons.swap_horiz_rounded,
        'color': AppTheme.googleGreen,
        'path': 'state-mixin',
      },
      {
        'title': 'home.feat.i18n.title'.tr,
        'description': 'home.feat.i18n.desc'.tr,
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
          Text(
            'home.features_label'.tr,
            style: const TextStyle(
              fontFamily: 'Google Sans Flex',
              color: AppTheme.googleGreen,
              fontSize: 13.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            'home.features_title'.tr,
            textAlign: TextAlign.center,
            style: const TextStyle(
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'home.btn_learn_more'.tr,
                              style: const TextStyle(
                                color: AppTheme.textSecondary,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                            const SizedBox(width: 4.0),
                            const Icon(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'home.btn_learn_more'.tr,
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12.0,
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          const Icon(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _ArchitectureBadge(
                            text: 'GetMaterialApp',
                            color: AppTheme.googleBlue,
                          ),
                          const SizedBox(height: 10),
                          _ArchitectureBadge(
                            text: 'GoRouter Config',
                            color: AppTheme.googleGreen,
                          ),
                          const SizedBox(height: 10),
                          _ArchitectureBadge(
                            text: 'BindingWidget Scopes',
                            color: AppTheme.googleRed,
                          ),
                          const SizedBox(height: 10),
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
      Text(
        'home.arch_label'.tr,
        style: const TextStyle(
          fontFamily: 'Google Sans Flex',
          color: AppTheme.googleRed,
          fontSize: 12.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 2.0,
        ),
      ),
      const SizedBox(height: 12.0),
      Text(
        'home.arch_title'.tr,
        style: const TextStyle(
          fontFamily: 'Google Sans Flex',
          color: AppTheme.textPrimary,
          fontSize: 26.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 16.0),
      Text(
        'home.arch_desc'.tr,
        style: const TextStyle(
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
        child: Text('home.btn_arch_guide'.tr),
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
                  Text(
                    '© 2026 getx_distil. Open source under MIT License.',
                    style: const TextStyle(
                        color: AppTheme.textMuted, fontSize: 12.0),
                  ),
                  Text(
                    'v1.6.0+16',
                    style: const TextStyle(
                        color: AppTheme.textMuted, fontSize: 12.0),
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

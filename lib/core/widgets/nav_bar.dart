import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  const NavBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70.0);

  void _launchPubDev() async {
    final Uri url = Uri.parse('https://pub.dev/packages/getx_distil');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 800;

    return AppBar(
      backgroundColor: AppTheme.bg,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 70.0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      title: InkWell(
        onTap: () => context.go('/'),
        borderRadius: BorderRadius.circular(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ShaderMask(
              shaderCallback: (bounds) =>
                  AppTheme.primaryGradient.createShader(bounds),
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
                color: AppTheme.textPrimary,
              ),
            ),
          ],
        ),
      ),
      actions: [
        if (!isMobile) ...[
          _NavLink(
            label: 'nav.home'.tr,
            onPressed: () => context.go('/'),
            isActive: GoRouterState.of(context).uri.path == '/',
          ),
          _NavLink(
            label: 'nav.guide'.tr,
            onPressed: () => context.go('/guide'),
            isActive: GoRouterState.of(context).uri.path == '/guide',
          ),
          _NavLink(
            label: 'nav.api_ref'.tr,
            onPressed: () => context.go('/api/reactive-state'),
            isActive: GoRouterState.of(context).uri.path.startsWith('/api'),
          ),
          _NavLink(
            label: 'nav.comparison'.tr,
            onPressed: () => context.go('/comparison'),
            isActive: GoRouterState.of(context).uri.path == '/comparison' ||
                GoRouterState.of(context).uri.path.startsWith('/comparison/'),
          ),
          _NavLink(
            label: 'nav.about'.tr,
            onPressed: () => context.go('/about'),
            isActive: GoRouterState.of(context).uri.path == '/about',
          ),
          _NavLink(
            label: 'nav.pub_dev'.tr,
            onPressed: _launchPubDev,
            isActive: false,
          ),
          const _LanguageSwitcher(),
          const SizedBox(width: 8.0),
        ] else ...[
          const _LanguageSwitcher(),
          IconButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: AppTheme.textPrimary,
            ),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          ),
        ],
      ],
    );
  }
}

class _LanguageSwitcher extends StatelessWidget {
  const _LanguageSwitcher();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final locale = Get.locale ?? const Locale('en', 'US');
      final isKorean = locale.languageCode == 'ko';

      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppTheme.textMuted.withOpacity(0.15)),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: InkWell(
          onTap: () {
            if (isKorean) {
              Get.locale = const Locale('en', 'US');
            } else {
              Get.locale = const Locale('ko', 'KR');
            }
          },
          borderRadius: BorderRadius.circular(20.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.language_rounded,
                  size: 14.0,
                  color: isKorean ? AppTheme.googleGreen : AppTheme.googleBlue,
                ),
                const SizedBox(width: 4.0),
                Text(
                  isKorean ? 'EN' : 'KO',
                  style: const TextStyle(
                    fontFamily: 'Google Sans Flex',
                    fontSize: 11.5,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
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
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.onPressed,
      style: TextButton.styleFrom(
        foregroundColor:
            widget.isActive ? AppTheme.textPrimary : AppTheme.textSecondary,
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
        overlayColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
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
    );
  }
}

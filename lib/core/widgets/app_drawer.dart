import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  final ExpansionTileController _apiController = ExpansionTileController();
  final ExpansionTileController _comparisonController = ExpansionTileController();

  void _launchPubDev() async {
    final Uri url = Uri.parse('https://pub.dev/packages/getx_distil');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  static const List<Map<String, String>> _apiSections = [
    {'title': 'Reactive State (Rx & Obx)', 'path': 'reactive-state'},
    {'title': 'Status-Aware (RxSList & RxS)', 'path': 'rxs'},
    {'title': 'Global Dependency Injection', 'path': 'global-di'},
    {'title': 'Widget Tree Scoped DI', 'path': 'binding-widget'},
    {'title': 'Global Persistent Services', 'path': 'getx-service'},
    {'title': 'Background Side-Effects', 'path': 'worker'},
    {'title': 'Declarative Async Branching', 'path': 'state-mixin'},
    {'title': 'Reactive Localization', 'path': 'i18n'},
  ];

  static const List<Map<String, String>> _comparisonSections = [
    {'title': '1. Overview', 'path': 'overview'},
    {'title': '2. Key Improvements', 'path': 'improvements'},
    {'title': '3. Features Sacrificed', 'path': 'sacrificed'},
    {'title': '4. Code Quality Assessment', 'path': 'quality'},
    {'title': '5. vs Riverpod 3.0', 'path': 'riverpod'},
    {'title': '6. Conclusion', 'path': 'conclusion'},
  ];

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();
    final screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: AppTheme.bg,
      width: screenWidth,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: SafeArea(
        child: Theme(
          data: Theme.of(context).copyWith(
            // 모든 ListTile/InkWell hover/click/focus ripple 제거
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            // ExpansionTile divider 제거 & arrow 항상 검정색
            dividerColor: Colors.transparent,
            expansionTileTheme: const ExpansionTileThemeData(
              iconColor: Colors.black,
            ),
          ),
          child: Column(
            children: [
              // Close button bar
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      color: Colors.black87,
                      iconSize: 28.0,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
              ),
              // Menu items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  children: [
                    // Home
                    ListTile(
                      title: Text(
                        'nav.home'.tr,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: currentLocation == '/'
                          ? null
                          : () {
                              Navigator.of(context).pop();
                              context.go('/');
                            },
                      contentPadding: EdgeInsets.zero,
                    ),

                    // Guide
                    ListTile(
                      title: Text(
                        'nav.guide'.tr,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: currentLocation == '/guide'
                          ? null
                          : () {
                              Navigator.of(context).pop();
                              context.go('/guide');
                            },
                      contentPadding: EdgeInsets.zero,
                    ),

                    // Api detail ExpansionTile
                    Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: ExpansionTile(
                        controller: _apiController,
                        title: Text(
                          'nav.api_ref'.tr,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: const EdgeInsets.only(left: 16.0),
                        initiallyExpanded: currentLocation.startsWith('/api/'),
                        iconColor: Colors.black,
                        collapsedIconColor: Colors.black,
                        onExpansionChanged: (expanded) {
                          if (expanded) {
                            _comparisonController.collapse();
                          }
                        },
                        children: _apiSections.map((section) {
                          final targetPath = '/api/${section['path']}';
                          return ListTile(
                            title: Text(
                              section['title']!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            onTap: currentLocation == targetPath
                                ? null
                                : () {
                                    Navigator.of(context).pop();
                                    context.go(targetPath);
                                  },
                          );
                        }).toList(),
                      ),
                    ),

                    // Comparison ExpansionTile
                    Theme(
                      data: Theme.of(context).copyWith(
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        splashFactory: NoSplash.splashFactory,
                      ),
                      child: ExpansionTile(
                        controller: _comparisonController,
                        title: Text(
                          'nav.comparison'.tr,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        tilePadding: EdgeInsets.zero,
                        childrenPadding: const EdgeInsets.only(left: 16.0),
                        initiallyExpanded:
                            currentLocation.startsWith('/comparison/'),
                        iconColor: Colors.black,
                        collapsedIconColor: Colors.black,
                        onExpansionChanged: (expanded) {
                          if (expanded) {
                            _apiController.collapse();
                          }
                        },
                        children: _comparisonSections.map((section) {
                          final targetPath = '/comparison/${section['path']}';
                          return ListTile(
                            title: Text(
                              section['title']!,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black87,
                              ),
                            ),
                            onTap: currentLocation == targetPath
                                ? null
                                : () {
                                    Navigator.of(context).pop();
                                    context.go(targetPath);
                                  },
                          );
                        }).toList(),
                      ),
                    ),

                    // About Developer
                    ListTile(
                      title: Text(
                        'nav.about_dev'.tr,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: currentLocation == '/about'
                          ? null
                          : () {
                              Navigator.of(context).pop();
                              context.go('/about');
                            },
                      contentPadding: EdgeInsets.zero,
                    ),

                    // pub.dev
                    ListTile(
                      title: Text(
                        'nav.pub_dev'.tr,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        _launchPubDev();
                      },
                      contentPadding: EdgeInsets.zero,
                    ),
                    const Divider(height: 32, color: Color(0xFFDADCE0)),
                    ListTile(
                      title: Obx(() {
                        final locale = Get.locale ?? const Locale('en', 'US');
                        final isKorean = locale.languageCode == 'ko';
                        return Row(
                          children: [
                            Icon(
                              Icons.language_rounded,
                              size: 24,
                              color: isKorean ? AppTheme.googleGreen : AppTheme.googleBlue,
                            ),
                            const SizedBox(width: 12.0),
                            Text(
                              isKorean ? 'Switch to English (EN)' : '한국어로 변경 (KO)',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: AppTheme.textPrimary,
                              ),
                            ),
                          ],
                        );
                      }),
                      onTap: () {
                        final locale = Get.locale ?? const Locale('en', 'US');
                        final isKorean = locale.languageCode == 'ko';
                        if (isKorean) {
                          Get.locale = const Locale('en', 'US');
                        } else {
                          Get.locale = const Locale('ko', 'KR');
                        }
                        Navigator.of(context).pop();
                      },
                      contentPadding: EdgeInsets.zero,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

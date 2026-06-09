import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../app_theme.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  void _launchPubDev() async {
    final Uri url = Uri.parse('https://pub.dev/packages/getx_distil');
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  static const List<Map<String, String>> _apiSections = [
    {'title': 'Reactive State (Rx & Obx)', 'path': 'reactive-state'},
    {'title': 'Global Dependency Injection', 'path': 'global-di'},
    {'title': 'Widget Tree Scoped DI', 'path': 'binding-widget'},
    {'title': 'Global Persistent Services', 'path': 'getx-service'},
    {'title': 'Background Side-Effects', 'path': 'worker'},
    {'title': 'Declarative Async Branching', 'path': 'state-mixin'},
    {'title': 'Internationalization (i18n)', 'path': 'i18n'},
  ];

  @override
  Widget build(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.toString();

    return Drawer(
      backgroundColor: AppTheme.bg,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          children: [
            // Home
            ListTile(
              title: const Text(
                'Home',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
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
              title: const Text(
                'Guide',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
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
              data: Theme.of(
                context,
              ).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                title: const Text(
                  'Api detail',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.only(left: 16.0),
                initiallyExpanded: currentLocation.startsWith('/api/'),
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

            // About Developer
            ListTile(
              title: const Text(
                'About Developer',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
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
              title: const Text(
                'pub.dev',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.of(context).pop();
                _launchPubDev();
              },
              contentPadding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:getx_distil/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import 'firebase_options.dart';
import 'core/app_router.dart';
import 'core/app_theme.dart';
import 'core/app_translations.dart';

Future<void> main() async {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final analytics = FirebaseAnalytics.instance;
  router.routerDelegate.addListener(() {
    final String currentPath =
        router.routerDelegate.currentConfiguration.uri.toString();

    final String fullUrl = '${Uri.base.origin}$currentPath';

    analytics.logEvent(
      name: 'page_view',
      parameters: {
        'page_path': currentPath,
        'page_title': currentPath,
        'page_location': fullUrl,
      },
    );

    analytics.logScreenView(screenName: currentPath);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routerConfig: router,
      theme: AppTheme.lightTheme,
      translations: AppTranslations(),
      locale: Get.locale ?? const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:getx_distil/get.dart';
import 'core/app_router.dart';
import 'core/app_theme.dart';
import 'core/app_translations.dart';

void main() {
  usePathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize default locale before running the app
  Get.locale = const Locale('en', 'US');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final locale = Get.locale;
      return GetMaterialApp(
        key: ValueKey(locale),
        routerConfig: router,
        theme: AppTheme.lightTheme,
        translations: AppTranslations(),
        locale: locale,
        fallbackLocale: const Locale('en', 'US'),
      );
    });
  }
}

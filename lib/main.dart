import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'core/app_router.dart';
import 'core/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      routerConfig: router,
      theme: AppTheme.darkTheme,
    );
  }
}

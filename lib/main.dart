import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'dart:html' as html;
import 'core/app_router.dart';
import 'core/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 브라우저가 백그라운드에서 돌아올 때 화면 재렌더링 (MyApp 수정 없음)
  html.document.addEventListener('visibilitychange', (_) {
    if (html.document.hidden == false) {
      WidgetsBinding.instance.handleAppLifecycleStateChanged(
        AppLifecycleState.resumed,
      );
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(routerConfig: router, theme: AppTheme.lightTheme);
  }
}

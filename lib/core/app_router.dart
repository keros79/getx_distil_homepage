import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';

import '../controllers/home_controller.dart';
import '../controllers/docs_controller.dart';
import '../views/home_page.dart';
import '../views/guide_page.dart';
import '../views/api_detail_page.dart';
import '../views/about_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BindingWidget(
        bindings: [
          Bind<HomeController>(() => HomeController()),
        ],
        child: const HomePage(),
      ),
    ),
    GoRoute(
      path: '/guide',
      builder: (context, state) => BindingWidget(
        bindings: [
          Bind<DocsController>(() => DocsController()),
        ],
        child: const GuidePage(),
      ),
    ),
    GoRoute(
      path: '/api/:section',
      builder: (context, state) {
        final section = state.pathParameters['section'] ?? 'reactive-state';
        return BindingWidget(
          bindings: [
            Bind<DocsController>(() => DocsController()),
          ],
          child: ApiDetailPage(section: section),
        );
      },
    ),
    GoRoute(
      path: '/about',
      builder: (context, state) => const AboutPage(),
    ),
  ],
);

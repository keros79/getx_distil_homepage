import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';

import '../controllers/home_controller.dart';
import '../controllers/docs_controller.dart';
import '../views/home_page.dart';
import '../views/guide_page.dart';
import '../views/api_detail_page.dart';
import '../views/about_page.dart';
import '../views/comparison_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BindingWidget(
          bindings: [
            Bind<HomeController>(() => HomeController()),
          ],
          child: const HomePage(),
        ),
      ),
    ),
    GoRoute(
      path: '/guide',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BindingWidget(
          bindings: [
            Bind<DocsController>(() => DocsController()),
          ],
          child: const GuidePage(),
        ),
      ),
    ),
    GoRoute(
      path: '/api/:section',
      pageBuilder: (context, state) {
        final section = state.pathParameters['section'] ?? 'reactive-state';
        return NoTransitionPage(
          child: BindingWidget(
            bindings: [
              Bind<DocsController>(() => DocsController()),
            ],
            child: ApiDetailPage(section: section),
          ),
        );
      },
    ),
    GoRoute(
      path: '/about',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: AboutPage(),
      ),
    ),
    GoRoute(
      path: '/comparison',
      pageBuilder: (context, state) => const NoTransitionPage(
        child: ComparisonPage(),
      ),
    ),
    GoRoute(
      path: '/comparison/:section',
      pageBuilder: (context, state) {
        final section = state.pathParameters['section'] ?? 'overview';
        return NoTransitionPage(
          child: ComparisonPage(section: section),
        );
      },
    ),
  ],
);

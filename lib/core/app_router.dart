import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

import '../controllers/home_controller.dart';
import '../controllers/api_detail_controller.dart';
import '../controllers/guide_controller.dart';
import '../controllers/comparison_controller.dart';
import '../controllers/about_controller.dart';
import '../views/home_page.dart';
import '../views/guide_page.dart';
import '../views/api_detail_page.dart';
import '../views/about_page.dart';
import '../views/comparison_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  observers: [
    FirebaseAnalyticsObserver(analytics: FirebaseAnalytics.instance),
  ],
  routes: [
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BindingWidget(
          bindings: [
            Bind<HomeController>(() => HomeController()),
          ],
          child: HomePage(),
        ),
      ),
    ),
    GoRoute(
      path: '/guide',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BindingWidget(
          bindings: [
            Bind<GuideController>(() => GuideController()),
          ],
          child: GuidePage(),
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
              Bind<ApiDetailController>(() => ApiDetailController()),
            ],
            child: ApiDetailPage(section: section),
          ),
        );
      },
    ),
    GoRoute(
      path: '/about',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BindingWidget(
          bindings: [
            Bind<AboutController>(() => AboutController()),
          ],
          child: const AboutPage(),
        ),
      ),
    ),
    GoRoute(
      path: '/comparison',
      pageBuilder: (context, state) => NoTransitionPage(
        child: BindingWidget(
          bindings: [
            Bind<ComparisonController>(() => ComparisonController()),
          ],
          child: const ComparisonPage(),
        ),
      ),
    ),
    GoRoute(
      path: '/comparison/:section',
      pageBuilder: (context, state) {
        final section = state.pathParameters['section'] ?? 'overview';
        return NoTransitionPage(
          child: BindingWidget(
            bindings: [
              Bind<ComparisonController>(() => ComparisonController()),
            ],
            child: ComparisonPage(section: section),
          ),
        );
      },
    ),
  ],
);

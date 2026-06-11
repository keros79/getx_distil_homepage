import 'package:getx_distil/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // ── Nav ──
          'nav.home': 'Home',
          'nav.guide': 'Guide',
          'nav.api_ref': 'API Reference',
          'nav.comparison': 'Comparison',
          'nav.about': 'About',
          'nav.about_dev': 'About Developer',
          'nav.pub_dev': 'pub.dev',

          // ── About Page ──
          'about.name': 'Danny Kang',
          'about.role': 'Flutter Framework & Architecture Engineer',
          'about.section_title': 'ABOUT THE DEVELOPER',
          'about.intro_1':
              'Hello! I am a passionate mobile and web framework engineer interested in Flutter, state machines, reactive programming, and modular Dependency Injection (DI) system design. My goal is to build tools that maximize developer productivity and maintain high visual excellence.',
          'about.intro_2':
              'I pioneered "getx_distil" out of a practical need to integrate the reactive DX paradigms of GetX with modern declarative routers like GoRouter, completely removing unnecessary legacy global overlays and fixing concurrency issues.',
          'about.github_title': 'GitHub Profile',
          'about.github_desc':
              'Checkout repositories, open-source utilities, and contribute to getx_distil packages.',
          'about.github_link': 'Visit GitHub ->',
          'about.pub_title': 'pub.dev Packages',
          'about.pub_desc':
              'Explore published packages, benchmarks, documentation scoring, and installations.',
          'about.pub_link': 'Visit pub.dev ->',

          // ── Guide Page ──
          'guide.breadcrumb_1': 'DOCUMENTATION',
          'guide.breadcrumb_2': 'GETTING STARTED',
          'guide.title': 'Quick Start Guide',
          'guide.description':
              'Learn how to integrate getx_distil and deploy high-performance reactive architectures in under 5 minutes.',
          'guide.step1_title': '1. Add getx_distil dependency',
          'guide.step1_desc':
              'Add getx_distil to your Flutter project using command line or configure it in pubspec.yaml file.',
          'guide.step2_title': '2. Set up GetMaterialApp',
          'guide.step2_desc':
              'Configure the router and theme systems inside your core entry point using GetMaterialApp.',
          'guide.step3_title': '3. Create a Controller & View',
          'guide.step3_desc':
              'Structure your controller classes with .obs properties. Bind the view elements with Obx wrappers to catch updates reactively.',
          'guide.next_label': 'Next up',
          'guide.next_title': 'Explore Reactive State (Rx & Obx)',

          // ── Home — Hero ──
          'home.hero_title_mobile': 'Flutter State\nManagement',
          'home.hero_title_desktop':
              'Flutter State Management\nDistilled & Refined',
          'home.slogan_1': 'Same Developer Experience. Zero Overhead.',
          'home.slogan_2': 'Tree-Scoped Lifecycle & GC.',
          'home.slogan_3': 'Self-Healing Post-Frame Rebuilds.',
          'home.slogan_4': 'Fast-Path Reactive Engine.',
          'home.hero_desc':
              'A distilled, high-performance micro-state management and tree-scoped dependency injection (DI) engine for Flutter. Shed the legacy navigation overhead and build modern reactive architectures seamlessly.',
          'home.btn_get_started': 'Get Started',

          // ── Home — Playground ──
          'home.playground_label': 'EXPERIENCE THE REACTIVITY',
          'home.playground_title': 'Try the micro-state engine live',
          'home.demo_title': '🎯 Interactive Demo Controls',
          'home.demo_desc':
              'Mutate states below. Status-Aware observables automatically transition state and refresh bound Obx widgets.',
          'home.demo_rx_label': '1. CLASSIC RX STATE',
          'home.btn_count_up': 'Count++',
          'home.btn_count_down': 'Count--',
          'home.demo_hint': 'Type reactive text...',
          'home.demo_rxslist_label': '2. STATUS-AWARE LIST (RxSList)',
          'home.btn_load_items': 'Load Items',
          'home.btn_add_item': 'Add Item',
          'home.btn_simulate_error': 'Simulate Error',
          'home.btn_clear_list': 'Clear List',
          'home.demo_rxs_label': '3. STATUS-AWARE VALUE (RxS)',
          'home.btn_load_user': 'Load User',
          'home.btn_reset_loading': 'Reset Loading',
          'home.btn_reset_all': 'Reset All Controls',
          'home.live_state_label': '🟢 LIVE STATE VIEWS',
          'home.mutations_count': 'Mutations: @count',
          'home.list_empty': 'List status is Empty.',

          // ── Home — Features ──
          'home.features_label': 'DESIGN SYSTEM FEATURES',
          'home.features_title': 'Refined Micro-Architectures',
          'home.btn_learn_more': 'Learn More',

          'home.feat.reactive_state.title': 'Reactive State (Rx & Obx)',
          'home.feat.reactive_state.desc':
              'Declare states with simple .obs and build lightweight reactive widgets that listen only to target properties.',
          'home.feat.rxs.title': 'Status-Aware (RxSList & RxS)',
          'home.feat.rxs.desc':
              'Simplify async state lifecycle handling. Carry loading, loaded, empty, and error status directly inside your reactive observables.',
          'home.feat.global_di.title': 'Global & Scoped DI',
          'home.feat.global_di.desc':
              'Access components anywhere without contexts. Fallback pipelines search for scoped instances before searching global registries.',
          'home.feat.binding_widget.title': 'Tree-Scoped Lifecycle',
          'home.feat.binding_widget.desc':
              'Isolate views and controller instances cleanly. Bind controllers directly to screens and let them Auto-GC upon unmounting.',
          'home.feat.getx_service.title': 'Global Persistent Services',
          'home.feat.getx_service.desc':
              'Keep vital background resources (like databases or APIs) permanently in memory as Immortal Singletons.',
          'home.feat.worker.title': 'Background Workers',
          'home.feat.worker.desc':
              'Configure reactive pipelines with debouncing and throttling algorithms that trigger background procedures safely.',
          'home.feat.state_mixin.title': 'StateMixin Framework',
          'home.feat.state_mixin.desc':
              'Handle async payloads with high-level builders that structure loading, success, empty, and failure layout branches cleanly.',
          'home.feat.i18n.title': 'Reactive Localization',
          'home.feat.i18n.desc':
              'Swap languages instantly without triggering complex rebuild processes. Translates values on-the-fly dynamically.',

          // ── Home — Architecture Callout ──
          'home.arch_label': 'ARCHITECTURE PATTERN',
          'home.arch_title': 'Aligned with Declarative Flutter',
          'home.arch_desc':
              'Incorporating GetX DX patterns into standard declarative routers (like GoRouter) is simplified with getx_distil. Bind controllers and views cleanly to widget tree life cycles without global route engine overheads.',
          'home.btn_arch_guide': 'Read Architecture Guide',
          'home.badge_material_app': 'GetMaterialApp',
          'home.badge_go_router': 'GoRouter Config',
          'home.badge_binding_widget': 'BindingWidget Scopes',
          'home.badge_get_view': 'GetView Page',

          // ── Home — Footer ──
          'home.footer_copy':
              '© 2026 getx_distil. Open source under MIT License.',
          'home.footer_version': 'v1.4.1+12',
          'home.tooltip_github': 'GitHub Repository',
          'home.tooltip_about': 'About Developer',

          // ── API Detail Page ──
          'api.breadcrumb': 'API REFERENCE',
          'api.key_enhancements': 'KEY ENHANCEMENTS',
          'api.impl_example': 'IMPLEMENTATION EXAMPLE',
          'api.next_up': 'Next up',
          'api.next_explore': 'Explore',

          // ── Comparison Page ──
          'comparison.next_section': 'Next section',
          'comparison.explore': 'Explore',
          'comparison.selection_guide': '5.10 🎯 Selection Guide',
        },
      };
}

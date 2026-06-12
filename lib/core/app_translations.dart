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
          'home.demo_title': 'Interactive Demo Controls',
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

          // ── API Detail Page ──
          'api.breadcrumb': 'API REFERENCE',
          'api.key_enhancements': 'KEY ENHANCEMENTS',
          'api.impl_example': 'IMPLEMENTATION EXAMPLE',
          'api.next_up': 'Next up',
          'api.next_explore': 'Explore',

          // ── API Section Meta — Reactive State ──
          'api.meta.reactive_state.title': 'Reactive State (Rx & Obx)',
          'api.meta.reactive_state.desc':
              'Pinpoint reactive updates without boilerplate. Bind view leaf widgets to target properties and let getx_distil handle efficient rebuilds automatically.',
          'api.meta.reactive_state.pt0':
              'Self-Healing Updates: Defers layout-phase updates post-frame to prevent setState() crashes.',
          'api.meta.reactive_state.pt1':
              'Strict Validation: Detects unsafe async await loops inside Obx and triggers helpful debugging exceptions.',
          'api.meta.reactive_state.pt2':
              'Fast-Path Evaluation: Bypasses proxy overhead lookup when tracking is idle, maximizing computation speed.',
          'api.meta.reactive_state.pt3':
              'Batched Mutations: Groups updates dynamically inside loops, triggering single-microtask UI updates.',
          'api.meta.reactive_state.next_title': 'Status-Aware Observables',

          // ── API Section Meta — RxS ──
          'api.meta.rxs.title': 'Status-Aware Observables (RxSList & RxS)',
          'api.meta.rxs.desc':
              'Simplify async state lifecycle handling. RxSList and RxS bundle loading, loaded, empty, and error states directly with state mutations, eliminating extra boilerplate flags.',
          'api.meta.rxs.pt0':
              '1. RxSList (Reactive List): Extends RxList to auto-sync status (loading, loaded, empty) with mutations like add, assignAll, and clear.',
          'api.meta.rxs.pt1':
              '2. RxS (Reactive Value): Extends Rxn to carry async status (loading, loaded, error) for single-object models like user profiles.',
          'api.meta.rxs.pt2':
              'Declarative UI Binding: Use the on() builder inside Obx to write clean layout branches for different async states.',
          'api.meta.rxs.pt3':
              'Resilient Data Retention: Assigning error preserves existing data underneath, allowing retry options without visual flickers.',
          'api.meta.rxs.next_title': 'Global Dependency Injection',

          // ── API Section Meta — Global DI ──
          'api.meta.global_di.title': 'Global Dependency Injection',
          'api.meta.global_di.desc':
              'Instantiate or lazily register controllers globally. Retrieve singletons securely from anywhere in your business logic without needing contexts.',
          'api.meta.global_di.pt0':
              'Context-less Access: Fetch controllers easily using Get.find<T>() inside static logic threads.',
          'api.meta.global_di.pt1':
              'Tag Namespace support: Tag classes to register multiple parallel class instances.',
          'api.meta.global_di.pt2':
              'Hybrid Resolver pipeline: Prioritizes local BindingWidget scopes before searching global registry maps.',
          'api.meta.global_di.next_title': 'Widget Tree Scoped DI',

          // ── API Section Meta — BindingWidget ──
          'api.meta.binding_widget.title': 'Widget Tree Scoped DI',
          'api.meta.binding_widget.desc':
              'Scope controller lifecycles directly to widget subtrees. Automates garbage collection and prevents instances from leaking across multi-page configurations.',
          'api.meta.binding_widget.pt0':
              '100% Tree-Scoped DI: Binds controller instances to widget elements.',
          'api.meta.binding_widget.pt1':
              'Automatic GC: Unregisters and disposes controllers automatically when the view unmounts.',
          'api.meta.binding_widget.pt2':
              'Declarative Routes alignment: Ideal for GoRouter or navigator subtrees to ensure isolation.',
          'api.meta.binding_widget.next_title': 'Global Persistent Services',

          // ── API Section Meta — GetX Service ──
          'api.meta.getx_service.title': 'Global Persistent Services',
          'api.meta.getx_service.desc':
              'Define permanent singletons (GetxService) that must remain active across the entire application lifecycle (Databases, Auth Managers, etc.).',
          'api.meta.getx_service.pt0':
              'Immortal Singletons: Remains resident in memory and ignores standard controller garbage-collection.',
          'api.meta.getx_service.pt1':
              'Infrastructure Layers: Designed specifically for configurations, storage wrappers, and network layers.',
          'api.meta.getx_service.pt2':
              'Sequential Init: Allows bootstrapping setup routines synchronously during application start.',
          'api.meta.getx_service.next_title': 'Background Side-Effects',

          // ── API Section Meta — Worker ──
          'api.meta.worker.title': 'Background Side-Effects',
          'api.meta.worker.desc':
              'Monitor reactive variables and trigger callbacks. Perfect for rate-limiting, background sync processes, and input searches.',
          'api.meta.worker.pt0':
              'Debounce Workers: Throttle rapid user typing interactions before querying API controllers.',
          'api.meta.worker.pt1':
              'Safe Auto-Disposal: Enforces explicit Worker.dispose() routines to avoid background memory leaks.',
          'api.meta.worker.pt2':
              'Clean Lifecycle hooks: Declare inside onInit() and unregister inside onClose() triggers.',
          'api.meta.worker.next_title': 'Declarative Async Branching',

          // ── API Section Meta — StateMixin ──
          'api.meta.state_mixin.title': 'Declarative Async Branching',
          'api.meta.state_mixin.desc':
              'Eradicate nested conditional checks. Map typical loading, success, empty, and network error layout screens cleanly.',
          'api.meta.state_mixin.pt0':
              'Declarative UI branch parsing: obx() builder matches typical request lifecycle states.',
          'api.meta.state_mixin.pt1':
              'Built-in Status tags: loading, success, empty, error (with parameters support).',
          'api.meta.state_mixin.pt2':
              'Minimal boilerplate: Eliminates nested if-else checks inside build routines.',
          'api.meta.state_mixin.next_title': 'Reactive Localization',

          // ── API Section Meta — i18n ──
          'api.meta.i18n.title': 'Reactive Localization',
          'api.meta.i18n.desc':
              'Swap languages on-the-fly reactively. Distilled translation dictionary structures allow seamless localization updates.',
          'api.meta.i18n.pt0':
              'Dynamic runtime swap: Switch Locale maps dynamically and let target labels translate instantly.',
          'api.meta.i18n.pt1':
              'tr and trParams extension support: Dynamic parameter string injection directly in translations.',
          'api.meta.i18n.pt2':
              'Clean dictionary mapping: Structure locale keys inside a simple Translations subclass.',
          'api.meta.i18n.next_title': 'Comparison Overview',

          // ── Comparison Page ──
          'comparison.next_section': 'Next section',
          'comparison.explore': 'Explore',
          'comparison.selection_guide': '5.10 Selection Guide',

          // ── Comparison — Overview ──
          'cmp.ov.title': 'Comprehensive Evaluation & Comparison',
          'cmp.ov.badge0': 'Target version: getx_distil v1.1.3',
          'cmp.ov.badge1':
              'Compared with: GetX (pub.dev/packages/get), Riverpod 3.0',
          'cmp.ov.section_title': '1. getx_distil Project Overview',
          'cmp.ov.next_title': '2. Key Improvements over GetX',
          'cmp.ov.h_category': 'Category',
          'cmp.ov.h_distil': 'getx_distil',
          'cmp.ov.h_getx': 'GetX',
          'cmp.ov.r_version': 'Version',
          'cmp.ov.r_sdk': 'SDK',
          'cmp.ov.r_deps': 'External Dependencies',
          'cmp.ov.r_deps_distil': '0 (Flutter SDK only)',
          'cmp.ov.r_deps_getx': 'Dozens (collection, web, js, etc.)',
          'cmp.ov.r_files': 'Source Files',
          'cmp.ov.r_logic': 'Core Logic',
          'cmp.ov.r_routing': 'Routing',
          'cmp.ov.r_routing_getx': '✅ Built-in (GetPageRoute, etc.)',
          'cmp.ov.r_i18n': 'Internationalization',
          'cmp.ov.r_i18n_distil': '✅ Kept (simplified)',
          'cmp.ov.r_i18n_getx': '✅ Kept',
          'cmp.ov.r_state': 'State Management',
          'cmp.ov.r_state_distil': '✅ Core enhanced',
          'cmp.ov.r_state_getx': '✅ Basic',
          'cmp.ov.r_di': 'DI',
          'cmp.ov.r_di_distil': '✅ Hybrid (tree+global)',
          'cmp.ov.r_di_getx': '✅ Global-centric',
          'cmp.ov.r_removed': '❌ Removed',

          // ── Comparison — Improvements ──
          'cmp.imp.title': 'Key Improvements over GetX',
          'cmp.imp.next_title': '3. Features Sacrificed vs GetX',
          // Item 2.1
          'cmp.imp.i1.title': 'Fast-Path Tracking (Notifier.isTracking)',
          'cmp.imp.i1.subtitle': 'Most important performance improvement',
          'cmp.imp.i1.h0': 'Category',
          'cmp.imp.i1.h1': 'GetX',
          'cmp.imp.i1.h2': 'getx_distil',
          'cmp.imp.i1.r0c0': 'Approach',
          'cmp.imp.i1.r0c1': 'Zone-based global proxy (RxInterface.proxy)',
          'cmp.imp.i1.r0c2': 'Static boolean flag (Notifier.isTracking)',
          'cmp.imp.i1.r1c0': 'Rx reads outside Obx',
          'cmp.imp.i1.r1c1': 'Proxy lookup + null check every time',
          'cmp.imp.i1.r1c2': 'Bypassed entirely (O(1) bool check)',
          'cmp.imp.i1.r2c0': 'Large data iteration',
          'cmp.imp.i1.r2c1': 'CPU overhead accumulates',
          'cmp.imp.i1.r2c2': 'Zero-cost',
          'cmp.imp.i1.eval':
              'Dramatically lighter than the Zone-based approach, with substantial CPU cycle savings during large data operations. Excellent design.',
          // Item 2.2
          'cmp.imp.i2.title': 'Self-Healing Build-Phase Updates',
          'cmp.imp.i2.subtitle': 'Prevents crashes during build/layout phase',
          'cmp.imp.i2.h0': 'Category',
          'cmp.imp.i2.h1': 'GetX',
          'cmp.imp.i2.h2': 'getx_distil',
          'cmp.imp.i2.r0c0': 'State change during build',
          'cmp.imp.i2.r0c1': 'setState() during build crash',
          'cmp.imp.i2.r0c2': 'Safely deferred via PostFrameCallback',
          'cmp.imp.i2.r1c0': 'Detection method',
          'cmp.imp.i2.r1c1': 'None',
          'cmp.imp.i2.r1c2': 'SchedulerBinding.instance.schedulerPhase check',
          'cmp.imp.i2.eval':
              'Prevents crashes that frequently occur in production. Very high practical value.',
          // Item 2.3
          'cmp.imp.i3.title': 'RxList Microtask Batching',
          'cmp.imp.i3.subtitle': 'Key performance differentiator',
          'cmp.imp.i3.h0': 'Category',
          'cmp.imp.i3.h1': 'GetX',
          'cmp.imp.i3.h2': 'getx_distil',
          'cmp.imp.i3.r0c0': '100 add() calls',
          'cmp.imp.i3.r0c1': '100 rebuilds',
          'cmp.imp.i3.r0c2': '1 rebuild',
          'cmp.imp.i3.r1c0': 'Approach',
          'cmp.imp.i3.r1c1': 'Immediate refresh() on each mutation',
          'cmp.imp.i3.r1c2': 'Dirty-Flag + Microtask pipeline',
          'cmp.imp.i3.r2c0': 'sort() / shuffle()',
          'cmp.imp.i3.r2c1': 'N notifications (ListMixin default)',
          'cmp.imp.i3.r2c2': '1 notification (overridden)',
          'cmp.imp.i3.eval':
              'When adding 10,000 items to a list, the original triggers 10,000 rebuilds → getx_distil triggers 1 rebuild. The most tangible performance difference.',
          // Item 2.4
          'cmp.imp.i4.title': '100% Tree-Scoped DI (BindingWidget)',
          'cmp.imp.i4.subtitle': 'Architecture paradigm shift',
          'cmp.imp.i4.h0': 'Category',
          'cmp.imp.i4.h1': 'GetX',
          'cmp.imp.i4.h2': 'getx_distil',
          'cmp.imp.i4.r0c0': 'DI Scope',
          'cmp.imp.i4.r0c1': 'Global singleton-centric',
          'cmp.imp.i4.r0c2': 'Widget tree scope + global hybrid',
          'cmp.imp.i4.r1c0': 'Same-type multi-instance',
          'cmp.imp.i4.r1c1': 'Collision',
          'cmp.imp.i4.r1c2': 'Complete isolation',
          'cmp.imp.i4.r2c0': 'Lifecycle management',
          'cmp.imp.i4.r2c1': 'Manual Get.delete()',
          'cmp.imp.i4.r2c2': 'Auto GC on widget dispose',
          'cmp.imp.i4.r3c0': 'GoRouter compatibility',
          'cmp.imp.i4.r3c1': 'Low',
          'cmp.imp.i4.r3c2': 'Fully compatible',
          'cmp.imp.i4.r4c0': 'Context-free access',
          'cmp.imp.i4.r4c1': 'Get.find<T>()',
          'cmp.imp.i4.r4c2': 'Get.find<T>() (WeakReference cache)',
          'cmp.imp.i4.eval':
              "A design that perfectly aligns with the GoRouter era. Solves GetX's biggest architectural flaw — a key differentiator.",
          // Item 2.5
          'cmp.imp.i5.title': 'FIFO Sequential Pipeline (updateSequential)',
          'cmp.imp.i5.subtitle':
              'Prevents race conditions in high-frequency async',
          'cmp.imp.i5.h0': 'Category',
          'cmp.imp.i5.h1': 'GetX',
          'cmp.imp.i5.h2': 'getx_distil',
          'cmp.imp.i5.r0c0': 'Async update order',
          'cmp.imp.i5.r0c1': 'Not guaranteed (race conditions)',
          'cmp.imp.i5.r0c2': 'Strict FIFO sequential execution',
          'cmp.imp.i5.r1c0': 'Approach',
          'cmp.imp.i5.r1c1': 'None',
          'cmp.imp.i5.r1c2': 'Completer chain',
          'cmp.imp.i5.eval':
              'Essential for high-frequency scenarios like real-time quotes, chat, and sensor data. High practical value.',
          // Item 2.6
          'cmp.imp.i6.title': 'RxSList / RxS — Status-Aware Reactive Types',
          'cmp.imp.i6.subtitle': 'Unique feature (not in original)',
          'cmp.imp.i6.h0': 'Category',
          'cmp.imp.i6.h1': 'GetX',
          'cmp.imp.i6.h2': 'getx_distil',
          'cmp.imp.i6.r0c0': 'List status management',
          'cmp.imp.i6.r0c1':
              'Separate isLoading/errorMessage observables needed',
          'cmp.imp.i6.r0c2': 'Built into the list itself',
          'cmp.imp.i6.r1c0': 'Single value status',
          'cmp.imp.i6.r1c1': 'StateMixin (controller level)',
          'cmp.imp.i6.r1c2': 'Built into the value (RxS)',
          'cmp.imp.i6.r2c0': 'UI branching',
          'cmp.imp.i6.r2c1': 'Manual if-else',
          'cmp.imp.i6.r2c2': 'Declarative via .on() builder',
          'cmp.imp.i6.eval':
              'A DX innovation that eliminates the need for separate isLoading/errorMessage observables. An original contribution not found in the original.',
          // Item 2.7
          'cmp.imp.i7.title': 'Strict Async Obx Validation',
          'cmp.imp.i7.subtitle': 'Blocks async Obx anti-patterns',
          'cmp.imp.i7.h0': 'Category',
          'cmp.imp.i7.h1': 'GetX',
          'cmp.imp.i7.h2': 'getx_distil',
          'cmp.imp.i7.r0c0': 'async/await inside Obx',
          'cmp.imp.i7.r0c1': 'Silent misbehavior',
          'cmp.imp.i7.r0c2': 'Immediate FlutterError throw',
          'cmp.imp.i7.r1c0': 'Rx not detected',
          'cmp.imp.i7.r1c1': 'Exception thrown',
          'cmp.imp.i7.r1c2': 'debugPrint warning (v1.0.3+)',
          'cmp.imp.i7.eval':
              'A safety net that significantly reduces debugging time. Also ensures production stability.',
          // Item 2.8
          'cmp.imp.i8.title': 'High-Visibility DI Debugging',
          'cmp.imp.i8.subtitle': 'Detailed debug info on DI lookup failure',
          'cmp.imp.i8.h0': 'Category',
          'cmp.imp.i8.h1': 'GetX',
          'cmp.imp.i8.h2': 'getx_distil',
          'cmp.imp.i8.r0c0': 'Error message',
          'cmp.imp.i8.r0c1': '"Controller not found"',
          'cmp.imp.i8.r0c2':
              'Requested widget name + ancestor path + global/immortal service list',
          'cmp.imp.i8.eval':
              'Dramatically reduces time to diagnose DI issues. A decisive DX improvement.',

          // ── Comparison — Sacrificed ──
          'cmp.sac.title': 'Features Sacrificed vs GetX',
          'cmp.sac.h_feature': 'Feature',
          'cmp.sac.h_getx': 'GetX',
          'cmp.sac.h_distil': 'getx_distil',
          'cmp.sac.h_impact': 'Impact',
          'cmp.sac.r0c0': 'Routing Engine',
          'cmp.sac.r0c1': 'GetPageRoute, Get.to(), Get.off(), etc.',
          'cmp.sac.r0c3': 'Use GoRouter/Navigator',
          'cmp.sac.r1c0': 'GetDialog/BottomSheet',
          'cmp.sac.r1c1': 'Global overlay management',
          'cmp.sac.r1c3': 'Use Flutter default APIs',
          'cmp.sac.r2c0': 'GetConnect',
          'cmp.sac.r2c1': 'Built-in HTTP client',
          'cmp.sac.r2c3': 'Use dio/http package',
          'cmp.sac.r3c0': 'GetStorage',
          'cmp.sac.r3c1': 'Local storage',
          'cmp.sac.r3c3': 'Use shared_preferences, etc.',
          'cmp.sac.r4c0': 'GetUtils',
          'cmp.sac.r4c1': 'Utility functions',
          'cmp.sac.r4c3': 'Use standard Dart/Flutter APIs',
          'cmp.sac.r5c0': 'GetX Binding (class)',
          'cmp.sac.r5c1': 'GetPage + Binding pattern',
          'cmp.sac.r5c3': 'Replaced by BindingWidget',
          'cmp.sac.r6c0': 'interval Worker',
          'cmp.sac.r6c1': 'Periodic execution worker',
          'cmp.sac.r6c3': 'Use Timer',
          'cmp.sac.r7c0': 'SmartManagement',
          'cmp.sac.r7c1': 'Memory management policy',
          'cmp.sac.r7c3': 'Replaced by BindingWidget Auto-GC',
          'cmp.sac.info_card':
              'Removing routing/dialogs/network/storage is an intentional design decision that aligns well with the modern Flutter ecosystem. Delegating each responsibility to specialized packages results in better architecture.',
          'cmp.sac.next_title': '4. Code Quality Assessment',
          'cmp.sac.removed': '❌ Removed',

          // ── Comparison — Quality ──
          'cmp.qa.title': 'Code Quality Assessment',
          'cmp.qa.good0':
              'Extreme conciseness — core logic at ~1,200 lines, less than 10% of the original. Overwhelming maintainability.',
          'cmp.qa.good1':
              'Zero External Dependency — depends only on Flutter SDK. Zero supply chain risk.',
          'cmp.qa.good2':
              'Thorough testing — 1,594 lines of test code. Covers edge cases like RxList batching, WeakReference zombie prevention, sibling controller onClose cross-references.',
          'cmp.qa.good3':
              'Consistent architecture — all Rx types follow GetListenable → RxInterface hierarchy. Excellent extensibility.',
          'cmp.qa.good4':
              'Memory safety — WeakReference cache, guaranteed dispose order (onDelete first → weakRegistry removal), Expando-based GetView context management.',
          'cmp.qa.good5':
              'Documentation quality — English/Korean README perfectly synchronized. Example app covers all features.',
          'cmp.qa.bad0':
              'GetxController.update() + ID-based rebuild not supported — ID-based partial rebuild used with GetBuilder in the original is weakened.',
          'cmp.qa.bad1':
              'RxSList initial status ambiguity — even with data in the constructor, initial status is loading. An option to start as loaded would be nice.',
          'cmp.qa.bad2':
              'interval Worker not supported — no periodic execution worker, must use Timer instead.',
          'cmp.qa.bad3':
              'Get.find tag + context combination not possible — when context is provided, tag is ignored.',
          'cmp.qa.bad4':
              'RxList operator []= override — custom list operations may trigger notifications without batching.',
          'cmp.qa.s0_item': 'Architecture Design',
          'cmp.qa.s0_note': 'Tree-scoped DI + hybrid fallback is best practice',
          'cmp.qa.s1_item': 'Performance Optimization',
          'cmp.qa.s1_note': 'Fast-Path + Batching + FIFO pipeline triple combo',
          'cmp.qa.s2_item': 'Memory Safety',
          'cmp.qa.s2_note':
              'WeakReference, guaranteed dispose order, Expando cleanup',
          'cmp.qa.s3_item': 'DX (Developer Experience)',
          'cmp.qa.s3_note':
              'RxSList/RxS .on() pattern is excellent. Great debug messages',
          'cmp.qa.s4_item': 'API Compatibility',
          'cmp.qa.s4_note': 'Core APIs like .obs, Obx, Get.find are identical',
          'cmp.qa.s5_item': 'Test Coverage',
          'cmp.qa.s5_note':
              'Core features well covered. Some edge cases could be improved',
          'cmp.qa.s6_item': 'Documentation/Examples',
          'cmp.qa.s6_note':
              'English/Korean README + GoRouter-based example app is perfect',
          'cmp.qa.s7_item': 'Ecosystem Compatibility',
          'cmp.qa.s7_note':
              'GoRouter-friendly. Existing GetX projects need routing migration',

          // ── Comparison — Riverpod ──
          'cmp.rp.title': 'getx_distil vs Riverpod 3.0',
          'cmp.rp.next_title': '6. Conclusion',

          // 5.1 Philosophical Differences
          'cmp.rp.s1.title': 'Philosophical Differences',
          'cmp.rp.s1.h0': 'Dimension',
          'cmp.rp.s1.h1': 'getx_distil',
          'cmp.rp.s1.h2': 'Riverpod 3.0',
          'cmp.rp.s1.r0c0': 'Paradigm',
          'cmp.rp.s1.r0c1': 'Imperative',
          'cmp.rp.s1.r0c2': 'Declarative',
          'cmp.rp.s1.r1c0': 'State Creation',
          'cmp.rp.s1.r1c1': 'Runtime new + .obs',
          'cmp.rp.s1.r1c2': 'Compile-time code generation',
          'cmp.rp.s1.r2c0': 'DI Approach',
          'cmp.rp.s1.r2c1': 'Manual registration (Get.put, BindingWidget)',
          'cmp.rp.s1.r2c2': 'Auto registration (@riverpod annotation)',
          'cmp.rp.s1.r3c0': 'Learning Curve',
          'cmp.rp.s1.r3c1': 'Low (same as GetX)',
          'cmp.rp.s1.r3c2': 'High (Provider, Notifier, AsyncNotifier, etc.)',
          'cmp.rp.s1.r4c0': 'Boilerplate',
          'cmp.rp.s1.r4c1': 'Minimal (.obs one-liner)',
          'cmp.rp.s1.r4c2': 'Medium~High (annotation + generated code)',
          'cmp.rp.s1.r5c0': 'Build Dependency',
          'cmp.rp.s1.r5c1': 'None',
          'cmp.rp.s1.r5c2': 'build_runner required',
          'cmp.rp.s1.eval':
              "getx_distil's imperative paradigm offers a low learning curve and minimal boilerplate for rapid development. Riverpod 3.0's declarative approach is systematic but requires more learning and setup.",

          // 5.2 State Management Approach
          'cmp.rp.s2.title': 'State Management Approach',
          'cmp.rp.s2.desc1': 'getx_distil — Imperative Observable',
          'cmp.rp.s2.desc2': 'Riverpod 3.0 — Declarative Notifier',
          'cmp.rp.s2.h0': 'Comparison',
          'cmp.rp.s2.h1': 'getx_distil',
          'cmp.rp.s2.h2': 'Riverpod 3.0',
          'cmp.rp.s2.r0c0': 'State Declaration',
          'cmp.rp.s2.r0c1': '.obs one-liner',
          'cmp.rp.s2.r0c2': 'Class + annotation + build()',
          'cmp.rp.s2.r1c0': 'State Mutation',
          'cmp.rp.s2.r1c1': '.value = direct assignment',
          'cmp.rp.s2.r1c2': 'Method call to change state',
          'cmp.rp.s2.r2c0': 'Reactive Registration',
          'cmp.rp.s2.r2c1': 'Automatic (tracked on read)',
          'cmp.rp.s2.r2c2': 'Automatic (tracked via ref.watch)',
          'cmp.rp.s2.r3c0': 'Nullable State',
          'cmp.rp.s2.r4c0': 'Code Volume',
          'cmp.rp.s2.r4c1': '~3 lines',
          'cmp.rp.s2.r4c2': '~8 lines',
          'cmp.rp.s2.eval':
              "For simple state management, getx_distil's DX is overwhelmingly concise. Riverpod requires explicit state mutation methods, which is an advantage for traceability of state change paths.",

          // 5.3 Async State Management
          'cmp.rp.s3.title': 'Async State Management',
          'cmp.rp.s3.desc1': 'getx_distil — RxSList / RxS',
          'cmp.rp.s3.desc2': 'Riverpod 3.0 — AsyncNotifier + AsyncValue',
          'cmp.rp.s3.h0': 'Comparison',
          'cmp.rp.s3.h1': 'getx_distil',
          'cmp.rp.s3.h2': 'Riverpod 3.0',
          'cmp.rp.s3.r0c0': 'Async State Expression',
          'cmp.rp.s3.r0c1': 'RxSList / RxS (manual state transition)',
          'cmp.rp.s3.r0c2': 'AsyncValue<T> (automatic state management)',
          'cmp.rp.s3.r1c0': 'Loading→Data Transition',
          'cmp.rp.s3.r1c1': 'Manual assignAll()',
          'cmp.rp.s3.r1c2': 'Automatic (on Future completion)',
          'cmp.rp.s3.r2c0': 'Error Handling',
          'cmp.rp.s3.r2c1': 'Manual error + status',
          'cmp.rp.s3.r2c2': 'Automatic (AsyncValue.guard)',
          'cmp.rp.s3.r3c0': 'Caching/Retry',
          'cmp.rp.s3.r3c1': 'Manual implementation',
          'cmp.rp.s3.r3c2': 'Built-in (keepAlive, retry, invalidate)',
          'cmp.rp.s3.r4c0': 'DX',
          'cmp.rp.s3.r4c1': 'Intuitive but manual',
          'cmp.rp.s3.r4c2': 'Automated but requires learning',
          'cmp.rp.s3.eval':
              "For pure async API call scenarios, Riverpod 3.0's AsyncNotifier is safer and more automated. getx_distil requires manual state transition control, but offers greater flexibility.",

          // 5.4 DI
          'cmp.rp.s4.title': 'DI (Dependency Injection)',
          'cmp.rp.s4.desc1': 'getx_distil — Hybrid DI',
          'cmp.rp.s4.desc2': 'Riverpod 3.0 — Provider Scope',
          'cmp.rp.s4.h0': 'Comparison',
          'cmp.rp.s4.r0c0': 'Registration',
          'cmp.rp.s4.r0c1': 'Manual (Get.put, BindingWidget)',
          'cmp.rp.s4.r0c2': 'Automatic (annotation + code generation)',
          'cmp.rp.s4.r1c0': 'Scope',
          'cmp.rp.s4.r1c1': 'Widget tree scope + global',
          'cmp.rp.s4.r1c2': 'Provider scope (overridable)',
          'cmp.rp.s4.r2c0': 'Dynamic Multi-instance',
          'cmp.rp.s4.r2c1': 'Natural via BindingWidget nesting',
          'cmp.rp.s4.r2c2': 'family modifier (compile-time)',
          'cmp.rp.s4.r3c0': 'Context-free Access',
          'cmp.rp.s4.r3c1': '✅ Get.find<T>()',
          'cmp.rp.s4.r3c2': '❌ ref required (only inside widgets/functions)',
          'cmp.rp.s4.r4c0': 'Lifecycle Management',
          'cmp.rp.s4.r4c1': 'Auto GC on widget dispose',
          'cmp.rp.s4.r4c2': 'ref.onDispose() callback',
          'cmp.rp.s4.r5c0': 'Multi-instance Isolation',
          'cmp.rp.s4.r5c1': 'Intuitive (BindingWidget nesting)',
          'cmp.rp.s4.r5c2': 'Strict (family + override)',
          'cmp.rp.s4.eval':
              "Context-free access is a clear advantage of getx_distil. No ref needed when referencing other controllers inside a controller. Riverpod's family is type-safe at compile-time, but getx_distil's BindingWidget is more flexible for patterns that dynamically create N instances at runtime.",

          // 5.5 Performance
          'cmp.rp.s5.title': 'Performance',
          'cmp.rp.s5.subtitle': 'RxList bulk mutation',
          'cmp.rp.s5.h0': 'Scenario',
          'cmp.rp.s5.r0c0': '10,000 add() calls',
          'cmp.rp.s5.r0c1': '1 rebuild (Microtask Batching)',
          'cmp.rp.s5.r0c2': 'N rebuilds (per state change)',
          'cmp.rp.s5.r1c0': 'for loop mutations',
          'cmp.rp.s5.r1c1': 'Automatic batching',
          'cmp.rp.s5.r1c2':
              'Manual batching needed or single state = [...] assignment',
          'cmp.rp.s5.r2c0': 'Rx reads outside Obx',
          'cmp.rp.s5.r2c1': 'Zero-cost (isTracking flag)',
          'cmp.rp.s5.r2c2': 'N/A (Provider reads always need ref)',
          'cmp.rp.s5.eval':
              "In high-frequency list mutation scenarios, getx_distil's Microtask Batching has a clear performance advantage over Riverpod. To achieve the same effect in Riverpod, developers must implement batching logic manually or use single state = newList assignment.",

          // 5.6 Safety Features
          'cmp.rp.s6.title': 'Safety Features',
          'cmp.rp.s6.h0': 'Safety Feature',
          'cmp.rp.s6.r0c0': 'Build-phase state mutation',
          'cmp.rp.s6.r0c1': 'Self-healing (PostFrameCallback deferral)',
          'cmp.rp.s6.r0c2': 'N/A (only ref.watch allowed during build)',
          'cmp.rp.s6.r1c0': 'Ref.watch during build',
          'cmp.rp.s6.r1c1': 'N/A',
          'cmp.rp.s6.r1c2': 'Strict runtime check',
          'cmp.rp.s6.r2c0': 'Async Obx validation',
          'cmp.rp.s6.r2c1': 'Strict blocking (FlutterError)',
          'cmp.rp.s6.r2c2': 'N/A (AsyncNotifier is separate)',
          'cmp.rp.s6.r3c0': 'DI lookup failure message',
          'cmp.rp.s6.r3c1': 'Detailed debug report',
          'cmp.rp.s6.r3c2': 'ProviderNotFoundException',
          'cmp.rp.s6.r4c0': 'Race condition prevention',
          'cmp.rp.s6.r4c1': 'FIFO pipeline (updateSequential)',
          'cmp.rp.s6.r4c2': 'N/A (no sequential execution guarantee)',
          'cmp.rp.s6.r5c0': 'Type Safety',
          'cmp.rp.s6.r5c1': 'Runtime (dynamic Get.find<T>())',
          'cmp.rp.s6.r5c2': 'Compile-time (code generation)',
          'cmp.rp.s6.eval':
              "getx_distil has richer runtime safety nets. Compile-time type safety is Riverpod 3.0's overwhelming advantage.",

          // 5.7 Code Generation vs Zero Dependency
          'cmp.rp.s7.title': 'Code Generation vs Zero Dependency',
          'cmp.rp.s7.h0': 'Category',
          'cmp.rp.s7.r0c0': 'build_runner needed',
          'cmp.rp.s7.r1c0': 'Generated code (.g.dart)',
          'cmp.rp.s7.r1c1': 'None',
          'cmp.rp.s7.r1c2': 'Yes',
          'cmp.rp.s7.r2c0': 'Build time impact',
          'cmp.rp.s7.r2c1': 'None',
          'cmp.rp.s7.r2c2': 'Increases (code generation overhead)',
          'cmp.rp.s7.r3c0': 'IDE Support',
          'cmp.rp.s7.r3c1': 'Standard Dart analysis',
          'cmp.rp.s7.r3c2': 'Generated code exploration needed',
          'cmp.rp.s7.r4c0': 'CI/CD Complexity',
          'cmp.rp.s7.r4c1': 'Low',
          'cmp.rp.s7.r4c2': 'High (build_runner step added)',
          'cmp.rp.s7.r5c0': 'External Dependencies',
          'cmp.rp.s7.r5c1': '0',
          'cmp.rp.s7.r5c2':
              'Multiple (riverpod, riverpod_annotation, build_runner, etc.)',
          'cmp.rp.s7.eval':
              "For small/personal projects, getx_distil's zero dependency is a strong advantage. For large team projects, Riverpod's code generation provides refactoring safety.",

          // 5.8 Testability
          'cmp.rp.s8.title': 'Testability',
          'cmp.rp.s8.h0': 'Category',
          'cmp.rp.s8.r0c0': 'Unit Testing',
          'cmp.rp.s8.r0c1': 'Get.put(mock) → Get.find()',
          'cmp.rp.s8.r0c2': 'ProviderContainer(overrides: [...])',
          'cmp.rp.s8.r1c0': 'Widget Testing',
          'cmp.rp.s8.r1c1': 'Scope control via BindingWidget',
          'cmp.rp.s8.r1c2': 'ProviderScope(overrides: [...])',
          'cmp.rp.s8.r2c0': 'Mocking Convenience',
          'cmp.rp.s8.r2c1': 'Moderate (manual registration/replacement)',
          'cmp.rp.s8.r2c2': 'Excellent (systematic override system)',
          'cmp.rp.s8.r3c0': 'Test Isolation',
          'cmp.rp.s8.r3c1': 'Manual Get.reset() call',
          'cmp.rp.s8.r3c2': 'Automatic ProviderContainer isolation',
          'cmp.rp.s8.eval':
              "Riverpod 3.0's override system is more systematic for test mocking. getx_distil is intuitive but has potential for global state pollution.",

          // Matrix items
          'cmp.rp.mx.learning_curve': 'Learning Curve',
          'cmp.rp.mx.boilerplate': 'Boilerplate',
          'cmp.rp.mx.compile_safety': 'Compile-time Safety',
          'cmp.rp.mx.async_auto': 'Async State Automation',
          'cmp.rp.mx.list_perf': 'List Bulk Mutation Performance',
          'cmp.rp.mx.di_flex': 'DI Flexibility',
          'cmp.rp.mx.ctx_free': 'Context-free Access',
          'cmp.rp.mx.test_mock': 'Test/Mocking System',
          'cmp.rp.mx.build_complex': 'Build Complexity',
          'cmp.rp.mx.refactor': 'Refactoring Safety',
          'cmp.rp.mx.mem_mgmt': 'Memory Management Precision',
          'cmp.rp.mx.runtime_safety': 'Runtime Safety Nets',
          'cmp.rp.mx.ext_deps': 'External Dependencies',
          'cmp.rp.mx.i18n': 'Localization',

          // Guide
          'cmp.rp.guide.winner_title': 'When to choose getx_distil',
          'cmp.rp.guide.loser_title': 'When to choose Riverpod 3.0',
          'cmp.rp.guide.winner0':
              '🚀 Rapid Prototyping / MVP — minimal boilerplate, start immediately',
          'cmp.rp.guide.winner1':
              '📱 Small~Medium Apps — no complex architecture overhead needed',
          'cmp.rp.guide.winner2':
              '🔄 GoRouter-based Routing — fully compatible with BindingWidget',
          'cmp.rp.guide.winner3':
              '📊 Heavy List Manipulation — RxList batching is essential for data-heavy apps',
          'cmp.rp.guide.winner4':
              '🧑‍💻 GetX Users — same DX, minimal migration cost',
          'cmp.rp.guide.winner5':
              '⚡ Build Time Sensitive — develop immediately without build_runner',
          'cmp.rp.guide.loser0':
              '🏢 Large Team Projects — compile-time safety protects refactoring',
          'cmp.rp.guide.loser1':
              '🧪 Test-Driven Development (TDD) — override system is optimal for mocking',
          'cmp.rp.guide.loser2':
              '📡 Async-centric Apps — API calls/caching/retry are core features',
          'cmp.rp.guide.loser3':
              '🔒 Strict State Management — explicitly control state mutation paths',
          'cmp.rp.guide.loser4':
              '🏗️ Long-term Maintenance — code generation provides refactoring safety net',

          // ── Comparison — Conclusion ──
          'cmp.con.title': 'Conclusion',
          'cmp.con.card0.title': 'getx_distil vs GetX',
          'cmp.con.card0.quote':
              'getx_distil succeeds in precisely removing GetX\'s "excess" while refining its "core."',
          'cmp.con.card0.p0':
              'If GetX is a "framework," getx_distil is a "micro-engine." The design decision to boldly remove routing, dialogs, networking, and storage — focusing solely on state management and DI — perfectly aligns with the modern Flutter ecosystem (GoRouter, dio, shared_preferences, etc.).',
          'cmp.con.card0.p1':
              'In particular, Fast-Path Tracking, RxList Microtask Batching, and Tree-Scoped DI provide clear, measurable performance/stability advantages over the original, while RxSList/RxS are original contributions not found in the original.',
          'cmp.con.card0.p2':
              'For existing GetX users, it provides the same DX (.obs → Obx → Get.find) while fundamentally solving memory leak and scope collision issues in GoRouter environments. For new projects, it has a clear advantage over the original GetX.',
          'cmp.con.card1.p2':
              "On the other hand, Riverpod 3.0's compile-time type safety and systematic async state management shine in large-scale projects. Choose based on project scale, team maturity, and data manipulation patterns.",
          'cmp.con.footer':
              'Written: 2026-06-10\nTarget version: getx_distil v1.1.3',
        },
        'ko_KR': {
          // ── Nav ──
          'nav.home': '홈',
          'nav.guide': '가이드',
          'nav.api_ref': 'API 레퍼런스',
          'nav.comparison': '비교 분석',
          'nav.about': '개발자 정보',
          'nav.about_dev': '개발자 소개',
          'nav.pub_dev': 'pub.dev',

          // ── About Page ──
          'about.name': 'Danny Kang',
          'about.role': 'Flutter 프레임워크 & 아키텍처 엔지니어',
          'about.section_title': '개발자 소개',
          'about.intro_1':
              '안녕하세요! Flutter, 상태 머신, 반응형 프로그래밍, 모듈형 의존성 주입(DI) 시스템 디자인에 관심이 깊은 모바일 및 웹 프레임워크 엔지니어입니다. 제 목표는 개발자 생산성을 극대화하는 툴을 구축하고 높은 시각적 완성도를 유지하는 것입니다.',
          'about.intro_2':
              'getx_distil은 GetX의 반응형 DX 패러다임을 GoRouter와 같은 현대적인 선언형 라우터와 통합하여, 불필요한 레거시 글로벌 오버레이를 제거하고 동시성 이슈를 해결하고자 실무적인 필요에 의해 개발하게 되었습니다.',
          'about.github_title': 'GitHub 프로필',
          'about.github_desc':
              'GitHub 리포지토리와 오픈소스 유틸리티들을 확인하고 getx_distil 패키지에 기여해보세요.',
          'about.github_link': 'GitHub 방문하기 ->',
          'about.pub_title': 'pub.dev 패키지',
          'about.pub_desc': '배포된 패키지, 벤치마크, 문서화 점수 및 설치 방법을 확인해보세요.',
          'about.pub_link': 'pub.dev 방문하기 ->',

          // ── Guide Page ──
          'guide.breadcrumb_1': '문서',
          'guide.breadcrumb_2': '시작하기',
          'guide.title': '빠른 시작 가이드',
          'guide.description':
              '5분 안에 getx_distil을 통합하고 고성능 반응형 아키텍처를 배포하는 방법을 알아보세요.',
          'guide.step1_title': '1. getx_distil 의존성 추가',
          'guide.step1_desc':
              '터미널 명령어를 사용하거나 pubspec.yaml 파일에 getx_distil을 추가하여 의존성을 구성합니다.',
          'guide.step2_title': '2. GetMaterialApp 설정',
          'guide.step2_desc':
              'GetMaterialApp을 사용하여 앱 진입점에서 라우터와 테마 시스템을 구성합니다.',
          'guide.step3_title': '3. Controller 및 View 생성',
          'guide.step3_desc':
              'Controller 클래스에 .obs 속성을 정의하고, View 엘리먼트를 Obx 래퍼로 감싸서 반응형으로 업데이트를 감지하도록 구성합니다.',
          'guide.next_label': '다음으로',
          'guide.next_title': '반응형 상태(Rx 및 Obx) 알아보기',

          // ── Home — Hero ──
          'home.hero_title_mobile': 'Flutter 상태 관리',
          'home.hero_title_desktop': 'Flutter 상태 관리\n더 가볍고 정교하게',
          'home.slogan_1': '동일한 개발자 경험(DX). 제로 오버헤드.',
          'home.slogan_2': '위젯 트리 범위의 생명주기 및 가비지 컬렉션(GC).',
          'home.slogan_3': '렌더링 프레임 후 자동 복구되는 리빌드.',
          'home.slogan_4': '빠른 경로(Fast-Path) 반응형 엔진.',
          'home.hero_desc':
              'Flutter를 위한 정제된 고성능 마이크로 상태 관리 및 위젯 트리 범위의 의존성 주입(DI) 엔진입니다. 레거시 네비게이션 오버헤드를 걷어내고 현대적인 반응형 아키텍처를 원활하게 구축하세요.',
          'home.btn_get_started': '시작하기',

          // ── Home — Playground ──
          'home.playground_label': '반응형 엔진 체험',
          'home.playground_title': '실시간 마이크로 상태 엔진 테스트',
          'home.demo_title': '인터랙티브 데모 컨트롤',
          'home.demo_desc':
              '아래에서 상태를 변경해보세요. 상태 인지형(Status-Aware) 옵저버블이 자동으로 상태를 전환하고 연결된 Obx 위젯을 새로고침합니다.',
          'home.demo_rx_label': '1. 기본 RX 상태',
          'home.btn_count_up': '증가++',
          'home.btn_count_down': '감소--',
          'home.demo_hint': '반응형 텍스트 입력...',
          'home.demo_rxslist_label': '2. 상태 인지형 리스트 (RxSList)',
          'home.btn_load_items': '아이템 로드',
          'home.btn_add_item': '아이템 추가',
          'home.btn_simulate_error': '에러 시뮬레이션',
          'home.btn_clear_list': '리스트 비우기',
          'home.demo_rxs_label': '3. 상태 인지형 단일 값 (RxS)',
          'home.btn_load_user': '유저 로드',
          'home.btn_reset_loading': '로딩 리셋',
          'home.btn_reset_all': '모든 컨트롤 초기화',
          'home.live_state_label': '🟢 실시간 상태 뷰',
          'home.mutations_count': '변경 횟수: @count',
          'home.list_empty': '리스트가 비어 있습니다.',

          // ── Home — Features ──
          'home.features_label': '디자인 시스템 특징',
          'home.features_title': '정교한 마이크로 아키텍처',
          'home.btn_learn_more': '더 알아보기',

          'home.feat.reactive_state.title': '반응형 상태 (Rx 및 Obx)',
          'home.feat.reactive_state.desc':
              '단순히 .obs를 추가하여 상태를 선언하고, 타겟 속성만을 구독하는 경량 반응형 위젯을 구축하세요.',
          'home.feat.rxs.title': '상태 인지형 (RxSList 및 RxS)',
          'home.feat.rxs.desc':
              '비동기 상태의 생명주기 처리를 단순화합니다. 반응형 옵저버블 내부에서 로딩, 완료, 빈 상태, 에러 상태를 직접 관리할 수 있습니다.',
          'home.feat.global_di.title': '글로벌 및 스코프 DI',
          'home.feat.global_di.desc':
              '컨텍스트 없이 어디서나 컴포넌트에 접근하세요. 로컬 위젯 트리 스코프를 먼저 탐색한 후 글로벌 등록 정보를 조회하는 하이브리드 탐색 체인을 갖추고 있습니다.',
          'home.feat.binding_widget.title': '위젯 트리 범위 생명주기',
          'home.feat.binding_widget.desc':
              '뷰와 컨트롤러 인스턴스를 깔끔하게 격리합니다. 컨트롤러를 화면에 직접 바인딩하고, 화면이 해제(Unmount)될 때 자동으로 메모리에서 해제(Auto-GC)되도록 합니다.',
          'home.feat.getx_service.title': '글로벌 영구 서비스',
          'home.feat.getx_service.desc':
              '데이터베이스나 API 클라이언트와 같이 영구적으로 유지되어야 하는 중요 백그라운드 리소스를 불사(Immortal) 싱글톤 서비스로 메모리에 유지합니다.',
          'home.feat.worker.title': '백그라운드 워커',
          'home.feat.worker.desc':
              '반응형 변수를 모니터링하여 디바운싱 및 쓰로틀링 알고리즘이 내장된 백그라운드 파이프라인을 안전하게 실행합니다.',
          'home.feat.state_mixin.title': 'StateMixin 프레임워크',
          'home.feat.state_mixin.desc':
              '로딩, 성공, 빈 상태, 실패 상태의 뷰 분기를 선언형 빌더로 구조화하여 비동기 데이터 처리를 간소화합니다.',
          'home.feat.i18n.title': '반응형 다국어 지원',
          'home.feat.i18n.desc':
              '복잡한 리빌드 프로세스 없이 실시간으로 즉시 언어를 전환합니다. 번역된 값을 동적으로 빠르게 적용합니다.',

          // ── Home — Architecture Callout ──
          'home.arch_label': '아키텍처 패턴',
          'home.arch_title': 'Flutter 선언형 패러다임과의 조화',
          'home.arch_desc':
              'getx_distil을 활용하면 GetX의 우수한 DX를 GoRouter와 같은 표준 선언형 라우터에 쉽게 녹여낼 수 있습니다. 글로벌 라우팅 오버헤드 없이 위젯 트리 생명주기에 컨트롤러와 뷰를 깔끔하게 연동하세요.',
          'home.btn_arch_guide': '아키텍처 가이드 읽기',

          // ── API Detail Page ──
          'api.breadcrumb': 'API 레퍼런스',
          'api.key_enhancements': '주요 개선 사항',
          'api.impl_example': '구현 예시',
          'api.next_up': '다음 주제',
          'api.next_explore': '자세히 보기:',

          // ── API Section Meta — Reactive State ──
          'api.meta.reactive_state.title': '반응형 상태 (Rx 및 Obx)',
          'api.meta.reactive_state.desc':
              '상용구 코드 없이 정교하게 상태 변화를 감지합니다. 말단 뷰 위젯을 대상 속성에 바인딩하면 getx_distil이 효율적인 리빌드를 자동으로 처리합니다.',
          'api.meta.reactive_state.pt0':
              '자동 오류 치료: 레이아웃 단계 중의 상태 변경 처리를 프레임 종료 후로 지연하여 setState() 크래시를 방지합니다.',
          'api.meta.reactive_state.pt1':
              '엄격한 유효성 검증: Obx 내부에서 잘못 작성된 비동기(async await) 루프를 감지하고 문제 해결을 돕는 디버깅 예외를 발생시킵니다.',
          'api.meta.reactive_state.pt2':
              '빠른 경로 평가: 데이터 구독이 감지되지 않을 때는 프록시 오버헤드 조회를 건너뛰어 계산 성능을 극대화합니다.',
          'api.meta.reactive_state.pt3':
              '일괄 변경 처리: 루프 내부의 여러 업데이트들을 동적으로 그룹화하여 하나의 마이크로태스크 단위로 UI를 갱신합니다.',
          'api.meta.reactive_state.next_title': '상태 인지형 옵저버블',

          // ── API Section Meta — RxS ──
          'api.meta.rxs.title': '상태 인지형 옵저버블 (RxSList 및 RxS)',
          'api.meta.rxs.desc':
              '비동기 상태 생명주기 관리를 극적으로 단순화합니다. RxSList 및 RxS는 상태 변경 작업과 로딩, 완료, 빈 상태, 에러 상태를 결합하여 불필요한 플래그 선언을 없애줍니다.',
          'api.meta.rxs.pt0':
              '1. RxSList (반응형 리스트): RxList를 확장하여 add, assignAll, clear 등 리스트 조작 시 상태(로딩, 완료, 비어있음)를 자동으로 연동합니다.',
          'api.meta.rxs.pt1':
              '2. RxS (반응형 단일값): Rxn을 확장하여 유저 프로필과 같은 단일 객체 모델의 비동기 상태(로딩, 완료, 에러)를 제공합니다.',
          'api.meta.rxs.pt2':
              '선언형 UI 바인딩: Obx 내부에서 .on() 빌더를 사용하여 비동기 상태 변화에 따른 깔끔한 레이아웃 분기를 작성할 수 있습니다.',
          'api.meta.rxs.pt3':
              '회복력 있는 데이터 유지: 에러 상태로 전이되더라도 내부의 기존 데이터를 유실하지 않으므로, 화면 깜빡임 없이 재시도 UI를 보여줄 수 있습니다.',
          'api.meta.rxs.next_title': '글로벌 의존성 주입',

          // ── API Section Meta — Global DI ──
          'api.meta.global_di.title': '글로벌 의존성 주입',
          'api.meta.global_di.desc':
              '컨트롤러를 인스턴스화하거나 글로벌 영역에 지연(Lazy) 등록합니다. BuildContext 없이도 비즈니스 로직 어디서나 싱글톤 인스턴스를 안전하게 참조할 수 있습니다.',
          'api.meta.global_di.pt0':
              '컨텍스트 무관 접근: 스태틱 로직 및 백그라운드 스레드에서 Get.find<T>()를 통해 컨트롤러를 간편히 획득합니다.',
          'api.meta.global_di.pt1':
              '태그 네임스페이스 지원: 고유 태그를 등록하여 동일한 타입의 인스턴스를 병렬로 여러 개 구성하고 관리할 수 있습니다.',
          'api.meta.global_di.pt2':
              '하이브리드 리졸버 파이프라인: 글로벌 탐색 전, 로컬 BindingWidget 스코프를 우선 탐색하여 독립성을 보장합니다.',
          'api.meta.global_di.next_title': '위젯 트리 범위의 스코프 DI',

          // ── API Section Meta — BindingWidget ──
          'api.meta.binding_widget.title': '위젯 트리 범위의 스코프 DI',
          'api.meta.binding_widget.desc':
              '컨트롤러의 생명주기를 특정 위젯 서브트리에 종속시킵니다. 가비지 컬렉션을 자동화하여 멀티 페이지 구성 시 발생하기 쉬운 메모리 누수를 원천 차단합니다.',
          'api.meta.binding_widget.pt0':
              '100% 위젯 트리 스코프 DI: 컨트롤러 인스턴스를 위젯 엘리먼트 수명에 밀접하게 동기화합니다.',
          'api.meta.binding_widget.pt1':
              '자동 가비지 컬렉션: 해당 뷰 위젯이 트리에서 해제(Unmount)될 때 컨트롤러 인스턴스를 자동으로 해제(dispose)합니다.',
          'api.meta.binding_widget.pt2':
              '선언형 라우터 조화: GoRouter 혹은 내비게이터 서브트리에 적용 시 완전한 컴포넌트 격리를 보장하여 오류를 예방합니다.',
          'api.meta.binding_widget.next_title': '글로벌 영구 서비스',

          // ── API Section Meta — GetX Service ──
          'api.meta.getx_service.title': '글로벌 영구 서비스',
          'api.meta.getx_service.desc':
              '애플리케이션 전체 라이프사이클에 걸쳐 활성 상태를 유지해야 하는 싱글톤 객체(로컬 DB, 인증 관리자 등)를 정의할 수 있습니다.',
          'api.meta.getx_service.pt0':
              '불사의 싱글톤: 메모리에 상주하며 일반적인 컨트롤러 가비지 컬렉션 정책에서 제외됩니다.',
          'api.meta.getx_service.pt1':
              '인프라스트럭처 레이어: 환경 설정 정보, 로컬 저장소 래퍼 및 네트워크 통신 모듈 관리에 최적화되어 있습니다.',
          'api.meta.getx_service.pt2':
              '순차적 초기화: 앱 시작 단계에서 초기화가 보장되어야 하는 다양한 설정 및 셋업 작업을 동기식으로 진행할 수 있습니다.',
          'api.meta.getx_service.next_title': '백그라운드 사이드 이펙트',

          // ── API Section Meta — Worker ──
          'api.meta.worker.title': '백그라운드 사이드 이펙트',
          'api.meta.worker.desc':
              '반응형 변수의 상태 변경을 모니터링하고 그에 대한 이벤트를 트리거합니다. 입력 검색어 추천 처리, 데이터 실시간 백그라운드 동기화 등에 적합합니다.',
          'api.meta.worker.pt0':
              '디바운스 워커: 사용자가 빠른 타이핑을 마칠 때까지 기다렸다가 비로소 API 컨트롤러에 쿼리를 실행하도록 제어합니다.',
          'api.meta.worker.pt1':
              '안전한 자동 정리: 리소스 손실을 방지하기 위해 명시적으로 Worker.dispose()를 실행하는 구조를 지원합니다.',
          'api.meta.worker.pt2':
              '명확한 라이프사이클 훅: onInit()에서 백그라운드 작업을 실행하고 onClose()를 통해 종료되도록 통제합니다.',
          'api.meta.worker.next_title': '선언형 비동기 분기 처리',

          // ── API Section Meta — StateMixin ──
          'api.meta.state_mixin.title': '선언형 비동기 분기 처리',
          'api.meta.state_mixin.desc':
              '중첩된 조건부 분기 코드를 말끔히 걷어냅니다. 로딩 중, 데이터 획득 성공, 빈 상태, 네트워크 오류 상태 등의 기본 화면을 쉽고 정갈하게 매핑해줍니다.',
          'api.meta.state_mixin.pt0':
              '선언형 UI 분기 파싱: obx() 빌더가 요청 진행 상황에 맞는 빌드 화면 상태를 정밀하게 분배합니다.',
          'api.meta.state_mixin.pt1':
              '자체 상태 내장: 로딩, 성공, 비어있음, 에러 상태(에러 메시지 매개변수 동시 전달) 관리를 기본 지원합니다.',
          'api.meta.state_mixin.pt2':
              '보일러플레이트 극소화: 빌드 함수 내부에 복잡한 if-else 처리를 대폭 정리해 줍니다.',
          'api.meta.state_mixin.next_title': '반응형 다국어 지원',

          // ── API Section Meta — i18n ──
          'api.meta.i18n.title': '반응형 다국어 지원',
          'api.meta.i18n.desc':
              '런타임 환경에서 언어를 즉각 반응형으로 교체합니다. 정밀하게 조율된 번역 딕셔너리 구조가 심리스한 다국어 갱신을 가능하게 해 줍니다.',
          'api.meta.i18n.pt0':
              '동적 런타임 전환: 로케일 맵을 동적으로 교체하는 즉시 바인딩된 텍스트 위젯들이 업데이트됩니다.',
          'api.meta.i18n.pt1':
              'tr 및 trParams 지원: 번역 템플릿 문자열에 유동 인자를 바로 주입할 수 있어 유연합니다.',
          'api.meta.i18n.pt2':
              '깔끔한 사전식 매핑: Translations 서브클래스를 사용하여 단 하나의 파일에서 직관적으로 번역 사전을 정의합니다.',
          'api.meta.i18n.next_title': '비교 분석 시작하기',

          // ── Comparison Page ──
          'comparison.next_section': '다음 섹션',
          'comparison.explore': '자세히 보기:',
          'comparison.selection_guide': '5.10 프레임워크 선택 가이드',

          // ── Comparison — Overview ──
          'cmp.ov.title': '상세 비교 분석 및 평가',
          'cmp.ov.badge0': '대상 버전: getx_distil v1.1.3',
          'cmp.ov.badge1': '비교 대상: GetX (pub.dev/packages/get), Riverpod 3.0',
          'cmp.ov.section_title': '1. getx_distil 프로젝트 개요',
          'cmp.ov.next_title': '2. 기존 GetX 대비 주요 개선점',
          'cmp.ov.h_category': '구분',
          'cmp.ov.h_distil': 'getx_distil',
          'cmp.ov.h_getx': 'GetX (기존)',
          'cmp.ov.r_version': '버전',
          'cmp.ov.r_sdk': 'SDK',
          'cmp.ov.r_deps': '외부 의존성',
          'cmp.ov.r_deps_distil': '0 (Flutter SDK만 사용)',
          'cmp.ov.r_deps_getx': '수십 개 (collection, web, js 등)',
          'cmp.ov.r_files': '소스 파일 수',
          'cmp.ov.r_logic': '핵심 코드 라인 수',
          'cmp.ov.r_routing': '자체 라우팅',
          'cmp.ov.r_routing_getx': '✅ 내장됨 (GetPageRoute 등)',
          'cmp.ov.r_i18n': '다국어 지원',
          'cmp.ov.r_i18n_distil': '✅ 유지 (경량화)',
          'cmp.ov.r_i18n_getx': '✅ 내장됨',
          'cmp.ov.r_state': '상태 관리 기능',
          'cmp.ov.r_state_distil': '✅ 핵심 엔진 성능 강화',
          'cmp.ov.r_state_getx': '✅ 제공 (기본)',
          'cmp.ov.r_di': '의존성 주입 (DI)',
          'cmp.ov.r_di_distil': '✅ 하이브리드 DI (위젯트리 + 글로벌)',
          'cmp.ov.r_di_getx': '✅ 글로벌 중심',
          'cmp.ov.r_removed': '❌ 제거됨',

          // ── Comparison — Improvements ──
          'cmp.imp.title': 'GetX 대비 개선 사항',
          'cmp.imp.next_title': '3. 미지원 기능 (제거 항목)',
          // Item 2.1
          'cmp.imp.i1.title': '빠른 경로 추적 (Notifier.isTracking)',
          'cmp.imp.i1.subtitle': '가장 핵심적인 성능 최적화 부분',
          'cmp.imp.i1.h0': '비교 항목',
          'cmp.imp.i1.h1': 'GetX',
          'cmp.imp.i1.h2': 'getx_distil',
          'cmp.imp.i1.r0c0': '동작 메커니즘',
          'cmp.imp.i1.r0c1': 'Zone 기반 글로벌 프록시 방식 (RxInterface.proxy)',
          'cmp.imp.i1.r0c2': '정적 불리언 플래그 기반 방식 (Notifier.isTracking)',
          'cmp.imp.i1.r1c0': 'Obx 외부에서 Rx 읽기',
          'cmp.imp.i1.r1c1': '조회할 때마다 매번 프록시 탐색 및 널 검사 발생',
          'cmp.imp.i1.r1c2': '완전 생략 가능 (O(1) 단순 불리언 조회)',
          'cmp.imp.i1.r2c0': '대용량 데이터 반복 조회',
          'cmp.imp.i1.r2c1': 'CPU 오버헤드 지속적 누적',
          'cmp.imp.i1.r2c2': '오버헤드 거의 없음',
          'cmp.imp.i1.eval':
              'Zone 기반 방식에 비해 매우 가벼우며 대규모 루프 처리를 수행할 때 CPU 자원을 획기적으로 절약할 수 있습니다. 뛰어난 성능 설계입니다.',
          // Item 2.2
          'cmp.imp.i2.title': '자동 오류 치료형 렌더링 지연 업데이트',
          'cmp.imp.i2.subtitle': '빌드 및 레이아웃 단계 중 크래시 발생 방지',
          'cmp.imp.i2.h0': '비교 항목',
          'cmp.imp.i2.h1': 'GetX',
          'cmp.imp.i2.h2': 'getx_distil',
          'cmp.imp.i2.r0c0': '빌드 중 상태 변경',
          'cmp.imp.i2.r0c1': 'setState() 호출 오류로 앱 크래시 발생',
          'cmp.imp.i2.r0c2': 'PostFrameCallback을 통하여 안전하게 지연 처리',
          'cmp.imp.i2.r1c0': '감지 기법',
          'cmp.imp.i2.r1c1': '없음',
          'cmp.imp.i2.r1c2':
              'SchedulerBinding.instance.schedulerPhase 상태 정밀 분석',
          'cmp.imp.i2.eval':
              '실제 프로덕션 환경에서 드물게 발생하는 위젯 빌드 크래시 문제를 안전하게 해결해 주는 탁월한 실무형 기능입니다.',
          // Item 2.3
          'cmp.imp.i3.title': 'RxList 마이크로태스크 배치 업데이트',
          'cmp.imp.i3.subtitle': '가장 체감되는 주요 성능 최적화 요소',
          'cmp.imp.i3.h0': '비교 항목',
          'cmp.imp.i3.h1': 'GetX',
          'cmp.imp.i3.h2': 'getx_distil',
          'cmp.imp.i3.r0c0': 'add() 100회 호출',
          'cmp.imp.i3.r0c1': 'UI 리빌드 100회 실행',
          'cmp.imp.i3.r0c2': 'UI 리빌드 단 1회 실행',
          'cmp.imp.i3.r1c0': '구현 메커니즘',
          'cmp.imp.i3.r1c1': '동작이 발생할 때마다 즉시 리프레시 진행',
          'cmp.imp.i3.r1c2': '더티 플래그(Dirty-Flag) 및 마이크로태스크 스케줄러 결합',
          'cmp.imp.i3.r2c0': 'sort() / shuffle() 수행',
          'cmp.imp.i3.r2c1': '각 원소 변경에 따라 N번 노티파이 전송',
          'cmp.imp.i3.r2c2': '작업 완료 후 단 1번 노티파이 전송',
          'cmp.imp.i3.eval':
              '리스트에 1만 개의 항목을 순차 추가하는 시나리오에서 GetX은 1만 번의 빌드 요청을 보내는 반면 getx_distil은 단 1번으로 배치 통합시킵니다. 체감 성능이 대폭 상승합니다.',
          // Item 2.4
          'cmp.imp.i4.title': '100% 위젯 트리 스코프 DI (BindingWidget)',
          'cmp.imp.i4.subtitle': '아키텍처 설계 패러다임의 중대한 변화',
          'cmp.imp.i4.h0': '비교 항목',
          'cmp.imp.i4.h1': 'GetX',
          'cmp.imp.i4.h2': 'getx_distil',
          'cmp.imp.i4.r0c0': '의존성 주입 범위',
          'cmp.imp.i4.r0c1': '글로벌 싱글톤 중심 구조',
          'cmp.imp.i4.r0c2': '위젯 트리 스코프와 글로벌 폴백이 융합된 하이브리드형',
          'cmp.imp.i4.r1c0': '동일 타입 중복 인스턴스',
          'cmp.imp.i4.r1c1': '키 충돌 발생 또는 찾기 실패',
          'cmp.imp.i4.r1c2': '상호 스코프 격리를 통한 충돌 방지',
          'cmp.imp.i4.r2c0': '생명주기 제어',
          'cmp.imp.i4.r2c1': 'Get.delete()를 수동으로 지정해서 제거해야 함',
          'cmp.imp.i4.r2c2': '해당 위젯 트리 제거 시 자동으로 가비지 컬렉션 가동',
          'cmp.imp.i4.r3c0': 'GoRouter 연동성',
          'cmp.imp.i4.r3c1': '낮음 (글로벌 맵 충돌 빈발)',
          'cmp.imp.i4.r3c2': '완전 호환 및 연동 가능',
          'cmp.imp.i4.r4c0': '컨텍스트 없는 탐색',
          'cmp.imp.i4.r4c1': 'Get.find<T>() 호출',
          'cmp.imp.i4.r4c2': 'Get.find<T>() 지원 (WeakReference 캐시 활용)',
          'cmp.imp.i4.eval':
              '현대의 GoRouter 시대를 완벽하게 지원하는 디자인입니다. GetX 최대의 약점이던 글로벌 상태 누수 문제를 깔끔하게 해소합니다.',
          // Item 2.5
          'cmp.imp.i5.title': 'FIFO 순차 실행 파이프라인 (updateSequential)',
          'cmp.imp.i5.subtitle': '빈번한 비동기 작업 시 경쟁 상태(Race Condition) 방지',
          'cmp.imp.i5.h0': '비교 항목',
          'cmp.imp.i5.h1': 'GetX',
          'cmp.imp.i5.h2': 'getx_distil',
          'cmp.imp.i5.r0c0': '비동기 갱신 순서',
          'cmp.imp.i5.r0c1': '비보장 (통신 속도 차이로 상태 꼬임 가능)',
          'cmp.imp.i5.r0c2': '철저한 선입선출(FIFO) 순차 실행 보장',
          'cmp.imp.i5.r1c0': '제어 방식',
          'cmp.imp.i5.r1c1': '없음',
          'cmp.imp.i5.r1c2': 'Completer 체이닝 파이프라인 탑재',
          'cmp.imp.i5.eval':
              '실시간 시세 알림, 채팅 기능 또는 센서 모니터링 시스템과 같이 찰나의 순간에 다량의 데이터 요청이 들어오는 환경에 꼭 필요한 안전장치입니다.',
          // Item 2.6
          'cmp.imp.i6.title': 'RxSList / RxS — 상태 인지형 반응형 타입',
          'cmp.imp.i6.subtitle': 'GetX 패키지에는 없는 오리지널 신기능',
          'cmp.imp.i6.h0': '비교 항목',
          'cmp.imp.i6.h1': 'GetX',
          'cmp.imp.i6.h2': 'getx_distil',
          'cmp.imp.i6.r0c0': '리스트 상태 관리',
          'cmp.imp.i6.r0c1': '별도의 isLoading, errorMessage 등의 변수 선언 필요',
          'cmp.imp.i6.r0c2': '리스트 내부에 비동기 진행 상태가 자동 탑재됨',
          'cmp.imp.i6.r1c0': '단일 인스턴스 상태',
          'cmp.imp.i6.r1c1': '컨트롤러 레벨의 StateMixin을 통해서만 제어 가능',
          'cmp.imp.i6.r1c2': '개별 변수 단위로 상태 관리가 내장됨 (RxS)',
          'cmp.imp.i6.r2c0': 'UI 분기 작성',
          'cmp.imp.i6.r2c1': '조건부(if-else) 뷰 조각 수동 구성',
          'cmp.imp.i6.r2c2': '.on() 선언형 빌더를 활용한 깔끔한 바인딩',
          'cmp.imp.i6.eval':
              '개발자가 직접 로딩 변수나 에러 필드를 일일이 정의하지 않아도 되어 상용구 코드가 엄청나게 단축됩니다. 획기적인 아이디어입니다.',
          // Item 2.7
          'cmp.imp.i7.title': '엄격한 비동기 Obx 코드 검증 체계',
          'cmp.imp.i7.subtitle': '비동기 Obx 작성 안티패턴 사전 차단',
          'cmp.imp.i7.h0': '비교 항목',
          'cmp.imp.i7.h1': 'GetX',
          'cmp.imp.i7.h2': 'getx_distil',
          'cmp.imp.i7.r0c0': 'Obx 내부의 async/await',
          'cmp.imp.i7.r0c1': '오류 경고 없이 비정상 동작 유발',
          'cmp.imp.i7.r0c2': '감지 즉시 명시적 FlutterError 발생시켜 개발자에게 알림',
          'cmp.imp.i7.r1c0': '반응형 데이터 누락',
          'cmp.imp.i7.r1c1': '단순 런타임 익셉션 오류 유발',
          'cmp.imp.i7.r1c2': '콘솔에 도움 정보를 담은 경고 메시지 출력 (v1.0.3+)',
          'cmp.imp.i7.eval':
              '잘못 설계된 비동기 반응형 코드로 인해 서비스 중 화면 갱신이 멈추거나 꼬이는 현상을 디자인 시점에 바로 잡을 수 있게 돕습니다.',
          // Item 2.8
          'cmp.imp.i8.title': '고가시성 의존성 주입(DI) 실패 디버깅 리포트',
          'cmp.imp.i8.subtitle': '찾기 실패한 컨트롤러 추적을 돕는 가이드 제공',
          'cmp.imp.i8.h0': '비교 항목',
          'cmp.imp.i8.h1': 'GetX',
          'cmp.imp.i8.h2': 'getx_distil',
          'cmp.imp.i8.r0c0': '오류 안내 메시지',
          'cmp.imp.i8.r0c1': '"Controller not found"라는 아주 불친절한 문자열 출력',
          'cmp.imp.i8.r0c2': '요청 위젯 정보 + 부모 탐색 구조(위젯 트리) + 현재 등록 정보 전체 출력',
          'cmp.imp.i8.eval':
              '의존성 탐색 오류가 일어났을 때 어디서 누락이 일어났는지 위젯 조상 추적 및 글로벌 인벤토리 정보를 모아 한눈에 시각화해 줍니다.',

          // ── Comparison — Sacrificed ──
          'cmp.sac.title': '미지원 및 제거된 기능 목록',
          'cmp.sac.h_feature': '기능군',
          'cmp.sac.h_getx': 'GetX',
          'cmp.sac.h_distil': 'getx_distil',
          'cmp.sac.h_impact': '영향 및 대체제',
          'cmp.sac.r0c0': '자체 라우팅 엔진',
          'cmp.sac.r0c1': 'GetPageRoute, Get.to(), Get.off() 등',
          'cmp.sac.r0c3': 'GoRouter 또는 Flutter 표준 네비게이터 활용 권장',
          'cmp.sac.r1c0': '다이얼로그/바텀시트',
          'cmp.sac.r1c1': 'BuildContext가 없는 글로벌 오버레이 처리',
          'cmp.sac.r1c3': 'Flutter 기본 다이얼로그 API 사용 권장',
          'cmp.sac.r2c0': 'GetConnect',
          'cmp.sac.r2c1': '자체 HTTP 통신 모듈',
          'cmp.sac.r2c3': 'dio 또는 http 패키지 사용 권장',
          'cmp.sac.r3c0': 'GetStorage',
          'cmp.sac.r3c1': '자체 키-값 데이터 로컬 저장소',
          'cmp.sac.r3c3': 'shared_preferences 등 전문 패키지 사용 권장',
          'cmp.sac.r4c0': 'GetUtils',
          'cmp.sac.r4c1': '이메일, 휴대폰 형식 검증 등 다양한 유틸리티 함수',
          'cmp.sac.r4c3': '표준 Dart API 또는 정규식을 직접 정의해 사용',
          'cmp.sac.r5c0': 'GetX Binding 클래스',
          'cmp.sac.r5c1': 'GetPage 선언에 묶어 쓰던 라우트 바인딩 클래스',
          'cmp.sac.r5c3': 'BindingWidget을 사용하여 선언형 위젯 단위로 바인딩',
          'cmp.sac.r6c0': 'interval 백그라운드 워커',
          'cmp.sac.r6c1': '일정 시간 간격으로 실행되는 워커',
          'cmp.sac.r6c3': 'Dart 내장 Timer 클래스를 사용해 동일하게 구현 가능',
          'cmp.sac.r7c0': 'SmartManagement 기능',
          'cmp.sac.r7c1': '메모리 인스턴스 자동 파기 및 유지 정책 제어',
          'cmp.sac.r7c3': 'BindingWidget의 생명주기 자동 가비지 컬렉션(GC)으로 완전 일원화',
          'cmp.sac.info_card':
              '라우팅, 다이얼로그, 통신, 저장소 등을 제거한 것은 현대 Flutter 생태계에 부합하기 위한 의도적인 다운사이징입니다. 각 역할에 집중된 전문 패키지를 결합하여 사용하면 더욱 견고하고 확장성 있는 구조를 완성할 수 있습니다.',
          'cmp.sac.next_title': '4. 코드 품질 종합 진단',
          'cmp.sac.removed': '❌ 제거됨',

          // ── Comparison — Quality ──
          'cmp.qa.title': '코드 품질 종합 평가',
          'cmp.qa.good0':
              '초정밀 경량화 — 핵심 코드가 약 1,200줄에 불과해 GetX 대비 10% 이하입니다. 압도적인 관리 편의성을 자랑합니다.',
          'cmp.qa.good1': '제로 의존성 — Flutter SDK에만 의존하여 공급망 보안 위험이 완전히 제로입니다.',
          'cmp.qa.good2':
              '철저한 테스트 커버리지 — 핵심 기능 테스트 코드가 약 1,594줄에 달하며 좀비 메모리 감지, RxList 일괄 갱신 등 엣지 케이스까지 안전히 커버합니다.',
          'cmp.qa.good3':
              '단일 구조 체계 — 모든 반응형 타입이 GetListenable -> RxInterface 계층을 완벽히 따라 확장성이 좋습니다.',
          'cmp.qa.good4':
              '안정성 극대화 — 약한 참조(WeakReference) 캐시, 라이프사이클 역순 파괴 정책, Expando 기반 GetView 관리 등이 정교히 짜여 있습니다.',
          'cmp.qa.good5':
              '문서 퀄리티 — 영문 및 국문 한글 문서가 일치화되어 있으며 최신 GoRouter 연동 샘플까지 모범적으로 수록되어 있습니다.',
          'cmp.qa.bad0':
              'GetxController.update() 및 ID 기반 리빌드 미지원 — 기존 GetBuilder와 엮어 쓰던 ID 기반 부분 리빌드 기능은 지원되지 않습니다.',
          'cmp.qa.bad1':
              'RxSList 초기 데이터 로딩 처리 애매함 — 생성 시점에 데이터를 넘겨주어도 로딩 상태로 시작됩니다. 로드 상태로 즉시 시작할 수 있는 초기 인자 선택지가 추가되면 더 좋을 것입니다.',
          'cmp.qa.bad2':
              'interval 백그라운드 워커 미탑재 — 주기적 처리를 제어하는 헬퍼 클래스가 없어 Timer 등을 수동 구현해야 합니다.',
          'cmp.qa.bad3':
              'Get.find 태그와 Context 중복 사용 불가 — BuildContext를 직접 지정하여 찾을 때는 네임스페이스 태그를 조합해 찾을 수 없습니다.',
          'cmp.qa.bad4':
              'RxList []= 대입 연산 오버라이딩 미흡 — 커스텀 인덱스 강제 쓰기 시 스케줄러 일괄 적용을 타지 않고 즉시 이벤트가 날아갈 수 있습니다.',
          'cmp.qa.s0_item': '아키텍처 설계 품질',
          'cmp.qa.s0_note': '위젯 트리 기반 스코프 주입과 하이브리드 탐색 연동은 최고 수준',
          'cmp.qa.s1_item': '성능 최적화 역량',
          'cmp.qa.s1_note': 'Fast-Path boolean 체크 및 리스트 일괄 갱신의 강력한 시너지',
          'cmp.qa.s2_item': '메모리 관리 안전성',
          'cmp.qa.s2_note': 'WeakReference 활용과 Expando 바인딩을 통한 강력한 누수 제거',
          'cmp.qa.s3_item': 'DX (개발자 경험)',
          'cmp.qa.s3_note': '상태 인지형 RxSList와 .on() 분기 처리 가독성은 최고 수준',
          'cmp.qa.s4_item': 'GetX 호환성',
          'cmp.qa.s4_note':
              '.obs, Obx, Get.find 등 핵심 패러다임이 100% 같아 손쉬운 마이그레이션 가능',
          'cmp.qa.s5_item': '테스트 신뢰성',
          'cmp.qa.s5_note': '핵심 동작들이 잘 검증되어 있으나 일부 엣지 케이스는 확장 여지 있음',
          'cmp.qa.s6_item': '문서화 수준',
          'cmp.qa.s6_note': '한글/영문 가이드라인과 정교한 완성형 데모의 품질이 훌륭함',
          'cmp.qa.s7_item': '생태계 친화성',
          'cmp.qa.s7_note':
              'GoRouter 연동이 매끄러운 대신 기존 GetX 프로젝트 마이그레이션 시 수동 작업 요소 발생',

          // ── Comparison — Riverpod ──
          'cmp.rp.title': 'getx_distil vs Riverpod 3.0',
          'cmp.rp.next_title': '종합 결론',

          // 5.1 Philosophical Differences
          'cmp.rp.s1.title': '기본 철학 및 지향점의 차이',
          'cmp.rp.s1.h0': '비교 요소',
          'cmp.rp.s1.h1': 'getx_distil',
          'cmp.rp.s1.h2': 'Riverpod 3.0',
          'cmp.rp.s1.r0c0': '지향 패러다임',
          'cmp.rp.s1.r0c1': '명령형(Imperative)에 친화적인 반응형',
          'cmp.rp.s1.r0c2': '선언형(Declarative)에 철저히 입각한 상태 전달',
          'cmp.rp.s1.r1c0': '상태 데이터 선언',
          'cmp.rp.s1.r1c1': '런타임 도중 동적 선언 + .obs 지정',
          'cmp.rp.s1.r1c2': '컴파일 타임 정적 코드 생성(Code Gen)',
          'cmp.rp.s1.r2c0': '의존성 주입 방식',
          'cmp.rp.s1.r2c1': '수동 등록 체계 (Get.put, BindingWidget)',
          'cmp.rp.s1.r2c2': '자동 등록 체계 (@riverpod 어노테이션 분석)',
          'cmp.rp.s1.r3c0': '학습 장벽',
          'cmp.rp.s1.r3c1': '낮음 (GetX의 핵심 DX와 완벽 동등)',
          'cmp.rp.s1.r3c2': '높음 (Provider, Notifier, AsyncNotifier 등 복잡)',
          'cmp.rp.s1.r4c0': '기본 코드 작성량',
          'cmp.rp.s1.r4c1': '매우 적음 (.obs를 붙인 단 한 줄로 반응형 구축 완료)',
          'cmp.rp.s1.r4c2': '많음 (어노테이션 작성 및 자동 빌드 파일 생성 수반)',
          'cmp.rp.s1.r5c0': '빌드 의존성',
          'cmp.rp.s1.r5c1': '의존성 제로',
          'cmp.rp.s1.r5c2': 'build_runner 가동 필수',
          'cmp.rp.s1.eval':
              'getx_distil의 명료한 명령형 패러다임은 극히 낮은 학습 곡선과 상용구 제로 수준의 속도를 보장합니다. 반면 Riverpod 3.0은 체계적이지만 사전 설정과 공부할 개념이 많습니다.',

          // 5.2 State Management Approach
          'cmp.rp.s2.title': '상태 관리 접근 방식의 차이',
          'cmp.rp.s2.desc1': 'getx_distil — 명령형 옵저버블 방식',
          'cmp.rp.s2.desc2': 'Riverpod 3.0 — 선언형 노티파이어 방식',
          'cmp.rp.s2.h0': '비교 특징',
          'cmp.rp.s2.h1': 'getx_distil',
          'cmp.rp.s2.h2': 'Riverpod 3.0',
          'cmp.rp.s2.r0c0': '상태 변수 선언',
          'cmp.rp.s2.r0c1': '.obs 한 줄로 간단히 해결',
          'cmp.rp.s2.r0c2': '클래스 정의 + 어노테이션 + build() 구현',
          'cmp.rp.s2.r1c0': '상태 변경 작업',
          'cmp.rp.s2.r1c1': '.value = 새로운 데이터 대입 식',
          'cmp.rp.s2.r1c2': '특화 메소드 호출을 통한 상태 제어 유도',
          'cmp.rp.s2.r2c0': '반응형 바인딩 감지',
          'cmp.rp.s2.r2c1': '자동 감지 (Obx 내부에서 호출할 때 감지됨)',
          'cmp.rp.s2.r2c2': '자동 감지 (Widget 내부에서 ref.watch 처리)',
          'cmp.rp.s2.r3c0': 'Null 허용 상태',
          'cmp.rp.s2.r4c0': '코드 양',
          'cmp.rp.s2.r4c1': '~3줄',
          'cmp.rp.s2.r4c2': '~8줄',
          'cmp.rp.s2.eval':
              '단순 상태 관리 측면에서 getx_distil의 DX는 압도적으로 간결합니다. Riverpod은 명시적인 상태 변경 메서드를 정의해야 하므로 상태 변화 경로의 추적성 면에서 장점이 있습니다.',
          'cmp.rp.s3.r0c0': '비동기 상태 제어',
          'cmp.rp.s3.r0c1': 'RxSList / RxS 타입 활용 (수동 상태 전환)',
          'cmp.rp.s3.r0c2': 'AsyncValue<T> 상태 타입 (스케줄러 자동 관리)',
          'cmp.rp.s3.r1c0': '로딩 → 완료 전환',
          'cmp.rp.s3.r1c1': '수동 assignAll() 또는 value 대입',
          'cmp.rp.s3.r1c2': 'Future 리턴 시 프레임워크가 자동 전환',
          'cmp.rp.s3.r2c0': '예외(에러) 제어',
          'cmp.rp.s3.r2c1': '수동으로 error 변수에 메시지 세팅',
          'cmp.rp.s3.r2c2': 'AsyncValue.guard()가 예외 자동 수집',
          'cmp.rp.s3.r3c0': '캐싱 및 재시도',
          'cmp.rp.s3.r3c1': '개발자가 직접 수동 로직 구성',
          'cmp.rp.s3.r3c2': '기본 내장 (keepAlive, retry, invalidate 등)',
          'cmp.rp.s3.r4c0': '사용자 개발 경험(DX)',
          'cmp.rp.s3.r4c1': '직관적이나 손이 더 많이 감',
          'cmp.rp.s3.r4c2': '자동화되어 있으나 개념 학습 장벽 존재',
          'cmp.rp.s3.eval':
              '단순 API 연동 영역에 있어서는 Riverpod의 AsyncNotifier가 훨씬 정교하고 견고합니다. getx_distil은 수동 처리가 다소 있지만 동작 흐름 제어 자유도가 높습니다.',

          // 5.4 DI
          'cmp.rp.s4.title': '의존성 주입(DI) 아키텍처 비교',
          'cmp.rp.s4.desc1': 'getx_distil — 하이브리드 탐색 체인',
          'cmp.rp.s4.desc2': 'Riverpod 3.0 — 프로바이더 범위(Scope) 지향',
          'cmp.rp.s4.h0': '비교 특징',
          'cmp.rp.s4.r0c0': '의존성 등록',
          'cmp.rp.s4.r0c1': '수동 등록 지향 (Get.put, BindingWidget 활용)',
          'cmp.rp.s4.r0c2': '어노테이션 정보 분석을 통해 빌드 타임 자동 연동',
          'cmp.rp.s4.r1c0': '주입 유효 스코프',
          'cmp.rp.s4.r1c1': '위젯 트리 단위 로컬 영역 + 글로벌 영역 복합 방식',
          'cmp.rp.s4.r1c2': '프로바이더 범위 (특정 노드 오버라이드 가능)',
          'cmp.rp.s4.r2c0': '동적 다중 인스턴스',
          'cmp.rp.s4.r2c1': 'BindingWidget의 위젯 트리 중첩을 통해 직관적 대응',
          'cmp.rp.s4.r2c2': 'family 제어 모디파이어 활용 (컴파일 타임 규격 필요)',
          'cmp.rp.s4.r3c0': '컨텍스트 독립 탐색',
          'cmp.rp.s4.r3c1': '✅ 완전 지원 (어디서나 Get.find<T>() 호출 가능)',
          'cmp.rp.s4.r3c2': '❌ 불가능 (반드시 ref 매개 객체가 전달되어야 함)',
          'cmp.rp.s4.r4c0': '의존성 생명주기 관리',
          'cmp.rp.s4.r4c1': '해당 위젯 트리 제거 시 컨트롤러 자동 GC 작동',
          'cmp.rp.s4.r4c2': 'ref.onDispose() 콜백을 수동 트리거하여 제어',
          'cmp.rp.s4.r5c0': '인스턴스 상호 격리',
          'cmp.rp.s4.r5c1': '위젯 트리 조상 경로 격리로 쉽고 편리함',
          'cmp.rp.s4.r5c2': 'family 및 오버라이드 조합으로 철저한 격리 규칙 준수',
          'cmp.rp.s4.eval':
              'BuildContext나 ref 인자 없이 어디서나 필요한 컨트롤러를 바로 얻어낼 수 있는 것은 getx_distil 최고의 무기입니다. 컨트롤러 상호 간 참조 시 상용구가 완전히 제거되는 효과를 누릴 수 있습니다.',

          // 5.5 Performance
          'cmp.rp.s5.title': '대량 연산 성능 비교',
          'cmp.rp.s5.subtitle': '대규모 리스트 데이터 일괄 조작 시나리오',
          'cmp.rp.s5.h0': '비교 상황',
          'cmp.rp.s5.r0c0': 'add() 10,000회 연속 처리',
          'cmp.rp.s5.r0c1': '마이크로태스크 배치 최적화로 UI 리빌드 단 1회 실행',
          'cmp.rp.s5.r0c2': '각 데이터 변경 사항이 순차 전달되어 과부하 가능성 존재',
          'cmp.rp.s5.r1c0': '루프 내부 변경',
          'cmp.rp.s5.r1c1': '배치 최적화로 자동 병합 제어',
          'cmp.rp.s5.r1c2': '루프 외부에서 새로운 리스트 통대입 형태로 구성해야 과부하를 막음',
          'cmp.rp.s5.r2c0': 'Obx 미사용 읽기',
          'cmp.rp.s5.r2c1': 'isTracking 플래그 O(1) 초고속 패스 패스',
          'cmp.rp.s5.r2c2': '해당 없음 (프로바이더 값을 얻으려면 상시 ref 전달이 필요)',
          'cmp.rp.s5.eval':
              '실시간 다량의 메시지 처리, 센서 신호 처리와 같이 데이터가 요동치는 화면에 있어서는 getx_distil의 배치 엔진이 압도적인 성능 강점을 제공합니다. Riverpod에서는 이를 막기 위해 데이터를 통째로 새로 만들어 덮어써야 합니다.',

          // 5.6 Safety Features
          'cmp.rp.s6.title': '안정성 및 검증 장치 비교',
          'cmp.rp.s6.h0': '검증 및 안전 장치',
          'cmp.rp.s6.r0c0': '빌드 단계 상태 갱신',
          'cmp.rp.s6.r0c1': '프레임 종료 후로 안전하게 자동 스케줄 지연 (오류 복구)',
          'cmp.rp.s6.r0c2': '에러 발생 (빌드 타임 중에는 ref.watch만 허용됨)',
          'cmp.rp.s6.r1c0': '빌드 중 ref.watch 검사',
          'cmp.rp.s6.r1c1': '해당 없음',
          'cmp.rp.s6.r1c2': '런타임 도중 강력한 위반 검증 및 방지',
          'cmp.rp.s6.r2c0': '비동기 Obx 코드 검출',
          'cmp.rp.s6.r2c1': '강력히 차단하고 명시적인 크래시 발생시켜 디버깅 지원',
          'cmp.rp.s6.r2c2': '해당 없음 (AsyncNotifier가 분리되어 안티패턴 가능성 낮음)',
          'cmp.rp.s6.r3c0': '의존성 찾기 실패 오류 리포트',
          'cmp.rp.s6.r3c1': '위젯 조상 경로 및 활성 인벤토리 정보를 모아 정밀 분석 리포트 출력',
          'cmp.rp.s6.r3c2': '단순 ProviderNotFoundException 계열 예외 송출',
          'cmp.rp.s6.r4c0': '경쟁 상태 제어 장치',
          'cmp.rp.s6.r4c1': 'updateSequential FIFO 파이프라인 내장',
          'cmp.rp.s6.r4c2': '없음 (경쟁 상태 방지는 개발자가 수동 제어해야 함)',
          'cmp.rp.s6.r5c0': '정적 타입 안전성',
          'cmp.rp.s6.r5c1': '런타임 위젯 트리 조회 기반 (오동작 시 런타임 익셉션 발생)',
          'cmp.rp.s6.r5c2': '컴파일 단계 정적 안전성 (Code Gen을 통해 컴파일 타임 오류 검출 가능)',
          'cmp.rp.s6.eval':
              'getx_distil은 유연한 런타임 구조 위에 다양한 다중 안전 그물을 덧댄 형태입니다. 반면 Riverpod은 컴파일 수준에서 실수를 사전 봉쇄하는 것에 초점이 맞추어져 있습니다.',

          // 5.7 Code Generation vs Zero Dependency
          'cmp.rp.s7.title': '코드 생성 방식 vs 제로 의존성 순수 방식',
          'cmp.rp.s7.h0': '비교 항목',
          'cmp.rp.s7.r0c0': '빌드 러너 가동 여부',
          'cmp.rp.s7.r1c0': '자동 생성 코드 파일 (.g.dart)',
          'cmp.rp.s7.r1c1': '없음 (순수 코드로 개발 완료)',
          'cmp.rp.s7.r1c2': '있음 (모든 파일 생성 필요)',
          'cmp.rp.s7.r2c0': '전체 빌드 소요 시간',
          'cmp.rp.s7.r2c1': '차이 없음 (순수 Flutter 빌드 시간만 소요)',
          'cmp.rp.s7.r2c2': '늘어남 (코드 생성 엔진 작동 오버헤드 추가)',
          'cmp.rp.s7.r3c0': 'IDE 지연 감지',
          'cmp.rp.s7.r3c1': '표준 분석기 작동으로 지연 없음',
          'cmp.rp.s7.r3c2': '생성물 연동에 따른 자동 완성 렉 유발 가능성 존재',
          'cmp.rp.s7.r4c0': 'CI/CD 빌드 프로세스',
          'cmp.rp.s7.r4c1': '단순하고 빠른 셋업',
          'cmp.rp.s7.r4c2': '빌드 단계 이전 코드 생성 단계 주입 필수',
          'cmp.rp.s7.r5c0': '패키지 총 의존성',
          'cmp.rp.s7.r5c1': '0 (Flutter SDK 내장)',
          'cmp.rp.s7.r5c2':
              '다수 (riverpod, riverpod_annotation, build_runner 등 다량)',
          'cmp.rp.s7.eval':
              '소규모 1인 개발 또는 빠른 MVP 개발 단계에서는 코드 생성이 필요 없는 getx_distil이 속도전에서 월등히 강합니다. 반면 대규모 대기업 프로젝트에서는 컴파일 안전장치가 코드 유지보수에 기여합니다.',

          // 5.8 Testability
          'cmp.rp.s8.title': '단위 테스트 및 모킹(Mocking)',
          'cmp.rp.s8.h0': '구분',
          'cmp.rp.s8.r0c0': '단위 테스트 수행',
          'cmp.rp.s8.r0c1': 'Get.put(mock)을 통해 수동 교환 후 Get.find 호출',
          'cmp.rp.s8.r0c2': 'ProviderContainer의 overrides 속성에 모킹 전달',
          'cmp.rp.s8.r1c0': '위젯 테스트 수행',
          'cmp.rp.s8.r1c1': 'BindingWidget의 스코프 트리를 수동 통제하여 제어',
          'cmp.rp.s8.r1c2': 'ProviderScope 내부 overrides 목록 교체 방식으로 간편함',
          'cmp.rp.s8.r2c0': '모킹 처리 난이도',
          'cmp.rp.s8.r2c1': '보통 (글로벌 맵 등록 정보를 임의 교체하는 수동 작업 필요)',
          'cmp.rp.s8.r2c2': '매우 편리함 (프로바이더 단위 오버라이드 시스템 완벽 지원)',
          'cmp.rp.s8.r3c0': '각 테스트 간 독립 격리',
          'cmp.rp.s8.r3c1': '새로운 테스트 실행 시 수동 Get.reset() 클리어 처리 필요',
          'cmp.rp.s8.r3c2': '새 컨테이너 객체 생성 방식으로 테스트 간 간섭 자동 차단',
          'cmp.rp.s8.eval':
              '테스트 모킹에 있어서는 Riverpod의 선언적 컨테이너 독립 시스템이 훨씬 모던하고 강력합니다. getx_distil은 글로벌 상태를 완전히 클리어해 주지 않으면 테스트 간 데이터 간섭이 유발될 여지가 있습니다.',

          // Matrix items
          'cmp.rp.mx.learning_curve': '학습 장벽 (장벽이 낮을수록 고득점)',
          'cmp.rp.mx.boilerplate': '보일러플레이트 극소화',
          'cmp.rp.mx.compile_safety': '컴파일 타임 안전성',
          'cmp.rp.mx.async_auto': '비동기 상태 관리 자동화',
          'cmp.rp.mx.list_perf': '대량 리스트 연산 및 일괄 갱신 성능',
          'cmp.rp.mx.di_flex': '의존성 주입(DI) 자유도',
          'cmp.rp.mx.ctx_free': 'BuildContext 없는 자유로운 인스턴스 탐색',
          'cmp.rp.mx.test_mock': '테스트 격리 및 모킹 편리성',
          'cmp.rp.mx.build_complex': '프로젝트 빌드 복잡성 (의존성 제로)',
          'cmp.rp.mx.refactor': '대규모 리팩토링 안정성',
          'cmp.rp.mx.mem_mgmt': '미사용 리소스 정밀 메모리 관리',
          'cmp.rp.mx.runtime_safety': '런타임 오작동 사전 감지 안전망',
          'cmp.rp.mx.ext_deps': '외부 라이브러리 의존성 개수',
          'cmp.rp.mx.i18n': '다국어 (Localization)',

          // Guide
          'cmp.rp.guide.winner_title': '이런 상황이라면 getx_distil을 선택하세요!',
          'cmp.rp.guide.loser_title': '이런 상황이라면 Riverpod 3.0을 선택하세요!',
          'cmp.rp.guide.winner0':
              '🚀 초고속 프로토타이핑 및 MVP 개발 — 상용구 코드가 없어 개발 속도가 제일 빠릅니다',
          'cmp.rp.guide.winner1':
              '📱 소~중규모 서비스 구현 — 거창한 구조 설계에 낭비되는 시간 및 리소스를 없애고 싶을 때',
          'cmp.rp.guide.winner2':
              '🔄 GoRouter 등 선언형 라우터 중심 통합 — BindingWidget의 로컬 스코프 생명주기가 최적으로 조화됩니다',
          'cmp.rp.guide.winner3':
              '📊 대량 데이터 리스트 뷰 구축 — 마이크로태스크 배치 가동이 필수인 무거운 실시간 연동 앱',
          'cmp.rp.guide.winner4':
              '🧑‍💻 기존 GetX 숙련 개발자 구성 — 이미 친숙한 .obs -> Obx 형태의 DX를 고성능으로 이어받아 비용 제로',
          'cmp.rp.guide.winner5':
              '⚡ 빌드 엔진 지연에 민감한 환경 — 빌드 러너 동작에 걸리는 시간과 스트레스를 완전히 없애고 싶을 때',
          'cmp.rp.guide.loser0':
              '🏢 대기업의 대규모 협업 프로젝트 — 수십 명 규모의 동시 작업 시 컴파일 안전장치가 리팩토링 버그를 확실히 예방',
          'cmp.rp.guide.loser1':
              '🧪 철저한 테스트 주도 개발(TDD) 지향 — 프레임워크가 제공하는 프로바이더 overrides 기능이 안전한 목 주입을 도움',
          'cmp.rp.guide.loser2':
              '📡 고도화된 비동기 데이터 쿼리 시스템 — 서버 데이터 캐싱, 리프레시 갱신 및 백그라운드 재호출이 아키텍처의 절대 다수인 경우',
          'cmp.rp.guide.loser3':
              '🔒 극도로 엄격한 상태 변화 제약 — 상태 변경을 정해진 비즈니스 메서드로만 일괄 제약하고 감시하려는 구조',
          'cmp.rp.guide.loser4':
              '🏗️ 5년 이상의 장기 유지보수 서비스 — 자동 코드 생성이 주는 강력한 정적 리스크 최소화 역량의 이점이 장벽보다 커지는 프로젝트',

          // ── Comparison — Conclusion ──
          'cmp.con.title': '비교 분석 종합 결론',
          'cmp.con.card0.title': 'getx_distil vs GetX',
          'cmp.con.card0.quote':
              'getx_distil은 기존 GetX의 불필요한 "군더더기"를 정교하게 도려내고 핵심 "원석"만을 강화하는 데 완벽하게 성공했습니다.',
          'cmp.con.card0.p0':
              'GetX가 모든 기능이 종합된 "종합 프레임워크"였다면 getx_distil은 날렵하게 튜닝된 "마이크로 엔진"입니다. 라우팅, 오버레이, 네트워크 및 로컬 스토리지를 미련 없이 제거하고 오직 상태 관리와 의존성 주입에 초점을 맞춰 현대 Flutter 생태계(GoRouter, dio, shared_preferences 등)와의 결합도를 완벽한 수준으로 끌어올렸습니다.',
          'cmp.con.card0.p1':
              '특히 Fast-Path Tracking, RxList Microtask Batching, 위젯 트리 스코프 DI인 BindingWidget 등은 기존 GetX의 한계를 보완하는 획기적 성능 개선 장치이며, 독창적인 RxSList/RxS 체계는 다른 패키지에서 맛볼 수 없는 훌륭한 신규 아이디어입니다.',
          'cmp.con.card0.p2':
              '기존 GetX 유저에게는 친숙한 문법 그대로 제공하며 의존성 누수를 잡고, 신규 프로젝트에는 GoRouter 시대를 여는 고효율 엔진을 공급한다는 측면에서 원조 패키지보다 압도적인 경쟁 우위를 점합니다.',
          'cmp.con.card1.quote':
              'getx_distil과 Riverpod 3.0은 경쟁 관계라기보다 상호보완 관계에 가깝습니다.',
          'cmp.con.card1.p0':
              'getx_distil은 "최소한의 코드로 가장 빠르고 자유롭게"를 추구하는 라이트웨이트 엔진이며, Riverpod 3.0은 "정적 타입을 통해 엄격하게 실수를 방지하는" 구조 지향형 프레임워크입니다.',
          'cmp.con.card1.p1':
              'getx_distil이 제공하는 RxList의 마이크로태스크 배치 최적화나 빌드 단계 자동 보정, Fast-Path 기술 등은 Riverpod에 존재하지 않는 성능 튜닝 장치로, 실시간 데이터 변동이 매우 심한 페이지일수록 getx_distil이 더 유리합니다.',
          'cmp.con.card1.p2':
              '반면 Riverpod 3.0은 코드 생성이 주는 컴파일 타임 검증성과 탄탄한 비동기 프로바이더가 거대한 엔터프라이즈 프로젝트에서 진가를 발휘하게 돕습니다. 프로젝트 예산 규모, 구성원의 기술적 성숙도, 처리해야 할 실시간 연산량 등에 맞춰 최적의 솔루션을 선택하는 것이 현명합니다.',
          'cmp.con.footer': '작성일자: 2026-06-10\n적용 엔진 버전: getx_distil v1.1.3',
        },
      };
}

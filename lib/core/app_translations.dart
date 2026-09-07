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

          // ── About Page ──
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
          'home.slogan_2': 'Tree-Scoped Lifecycle.',
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
          'home.btn_reset_idle': 'Reset to Idle',
          'home.btn_reset_all': 'Reset All Controls',
          'home.live_state_label': '🟢 LIVE STATE VIEWS',
          'home.mutations_count': 'Mutations: @count',
          'home.list_empty': 'List status is Empty.',
          'home.list_idle': 'List status is Idle.',
          'home.user_idle': 'User status is Idle.',

          // ── Home — Features ──
          'home.features_label': 'DESIGN SYSTEM FEATURES',
          'home.features_title': 'Refined Micro-Architectures',
          'home.btn_learn_more': 'Learn More',

          'home.feat.reactive_state.title': 'Reactive State (Rx & Obx)',
          'home.feat.reactive_state.desc':
              'Declare states with simple .obs and build lightweight reactive widgets that listen only to target properties.',
          'home.feat.rxs.title': 'Status-Aware (RxSList & RxS)',
          'home.feat.rxs.desc':
              'Simplify async state lifecycle handling. Carry idle, loading, loaded, empty, and error status directly inside your reactive observables.',
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
              '1. RxSList (Reactive List): Extends RxList to auto-sync status (idle, loading, loaded, empty, error) with mutations like add, assignAll, and clear.',
          'api.meta.rxs.pt1':
              '2. RxS (Reactive Value): Extends Rxn to carry async status (idle, loading, loaded, error) for single-object models like user profiles.',
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
          'api.meta.i18n.next_title': 'TDD & Testability',

          // ── API Section Meta — TDD & Testability ──
          'api.meta.tdd.title': 'TDD & Testability',
          'api.meta.tdd.desc':
              'getx_distil\'s BindingWidget shines when it comes to TDD (Test-Driven Development) and unit/widget testing. Since BindingWidget provides a strictly tree-scoped, isolated DI lifecycle, you can write mock-driven widget and logic tests without polluting global namespaces or worrying about test order execution.',
          'api.meta.tdd.pt0':
              'Zero State Pollution: Each test instantiates and disposes its own BindingWidget, ensuring no residues leak into other tests.',
          'api.meta.tdd.pt1':
              'No Production Code Modifications: You don\'t need to put isTesting flags or custom conditional injection logic inside your Controllers or Views. Just declare your mock bindings inside the test\'s BindingWidget.',
          'api.meta.tdd.pt2':
              'Declarative Overrides: Overriding real services with mock implementations is done in a clear, declarative list of bindings.',
          'api.meta.tdd.next_title': 'GoRouter & Route Guard',

          // ── API Section Meta — GoRouter & Route Guard ──
          'api.meta.route_guard.title': 'GoRouter & Reactive Route Guard',
          'api.meta.route_guard.desc':
              'getx_distil is designed to work seamlessly with GoRouter, Flutter\'s standard routing package, rather than using its own routing system. Since all Rx observables in getx_distil (e.g., RxBool, Rxn, etc.) implement Flutter\'s standard ValueListenable, you can directly bind them to GoRouter\'s refreshListenable to implement reactive route guards (auth/permission middleware) declaratively.',
          'api.meta.route_guard.pt0':
              'Declarative Route Guard: Bind Rx variables directly to GoRouter\'s refreshListenable for automatic redirect evaluations.',
          'api.meta.route_guard.pt1':
              'Standard Interface Compatibility: Every Rx variable implements ValueListenable natively, reducing boilerplate.',
          'api.meta.route_guard.pt2':
              'Precise Lifecycle Alignment: Works perfectly with BindingWidget to clean up scoped dependencies upon unmounting.',
          'api.meta.route_guard.next_title': 'Comparison Overview',

          'api.route_guard.sub1_title': '1. Define a Global Auth Controller',
          'api.route_guard.sub1_desc':
              'A global controller that tracks the authentication session initialization (isInitialized) and login status (isLoggedIn).',
          'api.route_guard.sub2_title':
              '2. Configure main() and GoRouter (Proper Initialization Timing)',
          'api.route_guard.sub2_desc':
              'If GoRouter is declared as a global or static variable, calling Get.find<AuthController>() directly inside refreshListenable may cause timing issues before the dependency is registered. To avoid this, you must call Get.put(AuthController(), permanent: true) inside main() at startup to inject the global controller, and then link it with GoRouter.',
          'api.route_guard.sub3_title':
              '⚠️ Warning: Initialization Timing (Crash Example)',
          'api.route_guard.sub3_desc':
              'The bindings property of GetMaterialApp injects dependencies during the widget build phase. Declaring GoRouter as a global variable and calling Get.find in refreshListenable, while defining dependencies in GetMaterialApp(bindings: [...]), triggers a crash because GoRouter is evaluated before registration.',
          'api.route_guard.warn_desc':
              'Therefore, global core services needed by route guards at startup should be manually registered first using Get.put(..., permanent: true) inside the main() function.',

          // ── Comparison Page ──
          'comparison.next_section': 'Next section',
          'comparison.selection_guide': '5.10 Selection Guide',

          // ── Comparison — Overview ──
          'cmp.ov.title': 'Comprehensive Evaluation & Comparison',
          'cmp.ov.section_title': '1. getx_distil Project Overview',
          'cmp.ov.next_title': '2. Key Improvements over GetX',
          'cmp.ov.h_category': 'Category',
          'cmp.ov.r_version': 'Version',
          'cmp.ov.r_deps': 'External Dependencies',
          'cmp.ov.r_deps_distil': '0 (Flutter SDK only)',
          'cmp.ov.r_deps_getx': '1 (web)',
          'cmp.ov.r_files': 'Source Files',
          'cmp.ov.r_logic': 'Lines of Code (total / excl. blank & comments)',
          'cmp.ov.r_tests': 'Test Code',
          'cmp.ov.r_tests_getx': 'Not shipped in the pub package',
          'cmp.ov.r_collections': 'Reactive Collections',
          'cmp.ov.r_collections_distil': 'RxList only (microtask-batched)',
          'cmp.ov.r_collections_getx': 'RxList / RxMap / RxSet',
          'cmp.ov.r_routing': 'Routing',
          'cmp.ov.r_routing_getx': '✅ Built-in (GetPageRoute, etc.)',
          'cmp.ov.r_i18n': 'Internationalization',
          'cmp.ov.r_i18n_distil': '✅ Kept (simplified)',
          'cmp.ov.r_i18n_getx': '✅ Kept',
          'cmp.ov.r_state': 'State Management',
          'cmp.ov.r_state_distil': '✅ Core enhanced (RxS / RxSList / batching)',
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
          'cmp.imp.i1.subtitle': 'Cleaner tracking gate — smaller gain vs GetX 4.x than often claimed',
          'cmp.imp.i1.h0': 'Category',
          'cmp.imp.i1.r0c0': 'Approach',
          'cmp.imp.i1.r0c1': 'Static nullable proxy (RxInterface.proxy?.addListener) — not Zone-based',
          'cmp.imp.i1.r0c2': 'Static boolean flag (Notifier.isTracking)',
          'cmp.imp.i1.r1c0': 'Rx reads outside Obx',
          'cmp.imp.i1.r1c1': 'One static null check (already O(1))',
          'cmp.imp.i1.r1c2': 'One static bool check (equivalent cost)',
          'cmp.imp.i1.r2c0': 'Per-Rx notification channel',
          'cmp.imp.i1.r2c1': 'GetStream allocated eagerly for every Rx',
          'cmp.imp.i1.r2c2': 'Plain callback list; StreamController created lazily only when a Worker subscribes',
          'cmp.imp.i1.eval':
              'Correction: earlier revisions of this page called GetX "Zone-based". GetX 4.x has used a static proxy since 4.0, so an Rx read outside Obx costs about the same in both libraries. The verifiable saving is structural — getx_distil skips the per-Rx GetStream allocation and subscription plumbing. Clean design, but not a dramatic CPU win.',
          // Item 2.2
          'cmp.imp.i2.title': 'Self-Healing Build-Phase Updates',
          'cmp.imp.i2.subtitle': 'Prevents crashes during build/layout phase',
          'cmp.imp.i2.h0': 'Category',
          'cmp.imp.i2.r0c0': 'State change during build',
          'cmp.imp.i2.r0c1': 'Debug assertion: setState() or markNeedsBuild() called during build',
          'cmp.imp.i2.r0c2': 'Deferred via PostFrameCallback (renders one frame later)',
          'cmp.imp.i2.r1c0': 'Detection method',
          'cmp.imp.i2.r1c1': 'None',
          'cmp.imp.i2.r1c2': 'SchedulerBinding.instance.schedulerPhase check',
          'cmp.imp.i2.eval':
              'Removes the red-screen assertion in debug mode and makes an otherwise fragile pattern safe. To be precise: release builds do not crash on this in Flutter — the update is simply applied — and the deferral costs one frame of latency. A useful safety net, not a free lunch.',
          // Item 2.3
          'cmp.imp.i3.title': 'RxList Microtask Batching',
          'cmp.imp.i3.subtitle': 'Key performance differentiator',
          'cmp.imp.i3.h0': 'Category',
          'cmp.imp.i3.r0c0': '100 add() calls',
          'cmp.imp.i3.r0c1': '100 notifications (100 setState calls; Flutter still builds once per frame)',
          'cmp.imp.i3.r0c2': '1 notification → 1 build',
          'cmp.imp.i3.r1c0': 'Approach',
          'cmp.imp.i3.r1c1': 'Immediate refresh() on each mutation',
          'cmp.imp.i3.r1c2': 'Dirty-Flag + Microtask pipeline',
          'cmp.imp.i3.r2c0': 'sort() / shuffle()',
          'cmp.imp.i3.r2c1': 'sort: 1 (overridden) / shuffle: N (ListMixin default)',
          'cmp.imp.i3.r2c2': 'Both 1 (overridden)',
          'cmp.imp.i3.r3c0': 'Notification timing',
          'cmp.imp.i3.r3c1': 'Synchronous (listeners fire inside add())',
          'cmp.imp.i3.r3c2': 'Asynchronous (next microtask) — tests need an await/pump',
          'cmp.imp.i3.eval':
              'Adding 10,000 items fires 10,000 listener notifications (and 10,000 ever/Worker callbacks) in GetX versus exactly 1 in getx_distil. Flutter already coalesces widget builds to one per frame, so the saving is in notification dispatch and Worker side-effects, not in build() calls. The trade-off: notifications become asynchronous.',
          // Item 2.4
          'cmp.imp.i4.title': '100% Tree-Scoped DI (BindingWidget)',
          'cmp.imp.i4.subtitle': 'Architecture paradigm shift',
          'cmp.imp.i4.h0': 'Category',
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
          'cmp.imp.i4.r3c1': 'Low (Bindings need GetPage; SmartManagement relies on the GetX route observer)',
          'cmp.imp.i4.r3c2': 'Fully compatible',
          'cmp.imp.i4.r4c0': 'Context-free access',
          'cmp.imp.i4.r4c1': 'Get.find<T>()',
          'cmp.imp.i4.r4c2': 'Get.find<T>() (WeakReference cache; ambiguous when several instances of one type are alive)',
          'cmp.imp.i4.eval':
              "A design that fits the GoRouter era and fixes GetX's biggest architectural flaw. Caveat: the context-less fallback returns the most recently registered instance, so with N live instances of one type you must pass a context.",
          // Item 2.5
          'cmp.imp.i5.title': 'FIFO Sequential Pipeline (updateSequential)',
          'cmp.imp.i5.subtitle':
              'Prevents race conditions in high-frequency async',
          'cmp.imp.i5.h0': 'Category',
          'cmp.imp.i5.r0c0': 'Async update order',
          'cmp.imp.i5.r0c1': 'Not guaranteed (race conditions)',
          'cmp.imp.i5.r0c2': 'Strict FIFO sequential execution',
          'cmp.imp.i5.r1c0': 'Approach',
          'cmp.imp.i5.r1c1': 'None',
          'cmp.imp.i5.r1c2': 'Completer chain',
          'cmp.imp.i5.eval':
              'Essential for high-frequency scenarios like real-time quotes, chat, and sensor data. Caveat: exceptions thrown inside action are routed to the Rx stream via addError, so with no Worker listening they are dropped silently.',
          // Item 2.6
          'cmp.imp.i6.title': 'RxSList / RxS — Status-Aware Reactive Types',
          'cmp.imp.i6.subtitle': 'Unique feature (not in original)',
          'cmp.imp.i6.h0': 'Category',
          'cmp.imp.i6.r0c0': 'List status management',
          'cmp.imp.i6.r0c1':
              'Separate isLoading/errorMessage observables needed',
          'cmp.imp.i6.r0c2': 'Built into the list itself (idle/loading/loaded/empty/error, v1.3.0+)',
          'cmp.imp.i6.r1c0': 'Single value status',
          'cmp.imp.i6.r1c1': 'StateMixin (controller level)',
          'cmp.imp.i6.r1c2': 'Built into the value (RxS)',
          'cmp.imp.i6.r2c0': 'UI branching',
          'cmp.imp.i6.r2c1': 'Manual if-else',
          'cmp.imp.i6.r2c2': 'Declarative via .on() builder',
          'cmp.imp.i6.eval':
              'A DX innovation that eliminates separate isLoading/errorMessage observables — an original contribution not found in GetX. Two nits: .ops is an extension on every type T (it shows up in autocomplete everywhere), and a list constructed with data still starts as idle, not loaded.',
          // Item 2.7
          'cmp.imp.i7.title': 'Strict Async Obx Validation',
          'cmp.imp.i7.subtitle': 'Blocks async Obx anti-patterns',
          'cmp.imp.i7.h0': 'Category',
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
          'cmp.imp.i8.r0c0': 'Error message',
          'cmp.imp.i8.r0c1': '"CounterController" not found. You need to call "Get.put(CounterController())"',
          'cmp.imp.i8.r0c2':
              'Requested widget name + ancestor path + global/immortal service list',
          'cmp.imp.i8.eval':
              'Dramatically reduces time to diagnose DI issues. A decisive DX improvement.',

          // ── Comparison — Sacrificed ──
          'cmp.sac.title': 'Features Sacrificed vs GetX',
          'cmp.sac.h_feature': 'Feature',
          'cmp.sac.h_impact': 'Impact',
          'cmp.sac.r0c0': 'Routing Engine',
          'cmp.sac.r0c1': 'GetPageRoute, Get.to(), Get.off(), etc.',
          'cmp.sac.r0c3': 'Use GoRouter/Navigator',
          'cmp.sac.r1c0': 'Get.dialog / bottomSheet / snackbar',
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
          'cmp.sac.r6c0': 'interval / everAll Workers',
          'cmp.sac.r6c1': 'Periodic & multi-Rx workers',
          'cmp.sac.r6c3': 'Use Timer / one ever() per Rx',
          'cmp.sac.r7c0': 'SmartManagement',
          'cmp.sac.r7c1': 'Memory management policy',
          'cmp.sac.r7c3': 'Replaced by BindingWidget Auto-GC',
          'cmp.sac.r8c0': 'RxMap / RxSet',
          'cmp.sac.r8c1': 'Reactive map & set collections',
          'cmp.sac.r8c3': 'Only RxList exists; hold Map/Set in Rx<T> and reassign',
          'cmp.sac.r9c0': 'GetBuilder / update(ids)',
          'cmp.sac.r9c1': 'ID-based partial rebuild',
          'cmp.sac.r9c3': 'update() still exists but ids are ignored — use Obx granularity',
          'cmp.sac.r10c0': 'Rx.bindStream',
          'cmp.sac.r10c1': 'Bind an external Stream to an Rx',
          'cmp.sac.r10c3': 'Use stream.listen((v) => rx.value = v) and cancel in onClose',
          'cmp.sac.info_card':
              'Removing routing/dialogs/network/storage is an intentional design decision that aligns well with the modern Flutter ecosystem. Delegating each responsibility to specialized packages results in better architecture.',
          'cmp.sac.next_title': '4. Code Quality Assessment',
          'cmp.sac.removed': '❌ Removed',

          // ── Comparison — Quality ──
          'cmp.qa.title': 'Code Quality Assessment',
          'cmp.qa.good0':
              'Compact — 1,968 lines total (1,342 excluding blanks/comments) across 18 files: about 11% of GetX 4.7.3 (17,351 / 11,831). Still small enough to read in one sitting.',
          'cmp.qa.good1':
              'Zero External Dependency — depends only on Flutter SDK. Zero supply chain risk.',
          'cmp.qa.good2':
              'Solid testing — 1,689 lines / 114 test cases in the package suite plus a TDD example test (v1.3.2). Covers RxList batching, WeakReference zombie prevention, sibling onClose cross-references, idle/error transitions.',
          'cmp.qa.good3':
              'Consistent architecture — all Rx types follow GetListenable → RxInterface hierarchy. Excellent extensibility.',
          'cmp.qa.good4':
              'Memory safety — WeakReference cache, guaranteed dispose order (onDelete first → weakRegistry removal), Expando-based GetView context management.',
          'cmp.qa.good5':
              'Documentation quality — English/Korean README kept in sync, example app covers every feature, and v1.3.2 added a TDD guide with mock-service injection.',
          'cmp.qa.good6':
              'Root-service eager init — GetMaterialApp(bindings) and BindingWidget(eager: true) initialize GetxService instances at mount (v1.3.1), removing the old builder-callback workaround.',
          'cmp.qa.bad0':
              'update(ids) is accepted but ids are silently ignored and there is no GetBuilder — GetX code relying on ID-based partial rebuilds compiles but stops working as expected.',
          'cmp.qa.bad1':
              'RxSList/RxS constructed with initial data still start as idle, not loaded — [1, 2, 3].ops reports idle until the first mutation. An option to start loaded would help.',
          'cmp.qa.bad2':
              'Collections are RxList-only — no RxMap/RxSet, Workers lack interval/everAll, and Rx.bindStream is gone.',
          'cmp.qa.bad3':
              'Tag and widget-tree scope are mutually exclusive — Get.find<T>(context, tag) skips the BindingWidget lookup entirely, and the positional Get.find(null, tag) differs from GetX\'s named tag: parameter.',
          'cmp.qa.bad4':
              'updateSequential swallows errors — exceptions are forwarded via addError to a broadcast stream, so with no Worker listening they vanish silently.',
          'cmp.qa.bad5':
              'Context-less Get.find<T>() is ambiguous with multiple live instances — it returns the last registered one and may eagerly instantiate a binding inside an unrelated active BindingWidget.',
          'cmp.qa.bad6':
              'lazyPut(fenix: true) is stored but never honored — a deleted lazy dependency is not recreated on the next find().',
          'cmp.qa.s0_item': 'Architecture Design',
          'cmp.qa.s0_note': 'Tree-scoped DI + hybrid fallback is best practice',
          'cmp.qa.s1_item': 'Performance Optimization',
          'cmp.qa.s1_note': 'Batching + FIFO pipeline are real wins; Fast-Path gain vs GetX 4.x is marginal',
          'cmp.qa.s2_item': 'Memory Safety',
          'cmp.qa.s2_note':
              'WeakReference, guaranteed dispose order, Expando cleanup; static registries need Get.reset() in tests',
          'cmp.qa.s3_item': 'DX (Developer Experience)',
          'cmp.qa.s3_note':
              'RxSList/RxS .on() pattern is excellent. Great debug messages',
          'cmp.qa.s4_item': 'API Compatibility',
          'cmp.qa.s4_note': '.obs / Obx / Get.put are identical; Get.find tag signature, RxMap/RxSet, GetBuilder, bindStream differ',
          'cmp.qa.s5_item': 'Test Coverage',
          'cmp.qa.s5_note':
              '114 cases + TDD example; updateSequential error path and fenix are untested',
          'cmp.qa.s6_item': 'Documentation/Examples',
          'cmp.qa.s6_note':
              'English/Korean README + GoRouter-based example app is perfect',
          'cmp.qa.s7_item': 'Ecosystem Compatibility',
          'cmp.qa.s7_note':
              'GoRouter-friendly. Existing GetX projects need routing migration',

          // ── Comparison — Riverpod ──
          'cmp.rp.next_title': '6. Conclusion',

          // 5.1 Philosophical Differences
          'cmp.rp.s1.title': 'Philosophical Differences',
          'cmp.rp.s1.h0': 'Dimension',
          'cmp.rp.s1.r0c0': 'Paradigm',
          'cmp.rp.s1.r0c1': 'Imperative',
          'cmp.rp.s1.r0c2': 'Declarative',
          'cmp.rp.s1.r1c0': 'State Creation',
          'cmp.rp.s1.r1c1': 'Runtime new + .obs',
          'cmp.rp.s1.r1c2': 'Typed provider objects (code generation optional)',
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
          'cmp.rp.s1.r5c2': 'Optional (only with riverpod_generator)',
          'cmp.rp.s1.eval':
              "getx_distil's imperative paradigm offers a low learning curve and minimal boilerplate for rapid development. Riverpod 3.x's declarative approach is systematic but requires more learning and setup.",

          // 5.2 State Management Approach
          'cmp.rp.s2.title': 'State Management Approach',
          'cmp.rp.s2.desc1': 'getx_distil — Imperative Observable',
          'cmp.rp.s2.desc2': 'Riverpod 3.x — Declarative Notifier',
          'cmp.rp.s2.h0': 'Comparison',
          'cmp.rp.s2.r0c0': 'State Declaration',
          'cmp.rp.s2.r0c1': '.obs one-liner',
          'cmp.rp.s2.r0c2': 'Notifier class + build() (+ optional annotation)',
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
          'cmp.rp.s3.h0': 'Comparison',
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
          'cmp.rp.s3.r3c2': 'Built-in (keepAlive, automatic retry, invalidate, experimental offline persistence)',
          'cmp.rp.s3.r4c0': 'DX',
          'cmp.rp.s3.r4c1': 'Intuitive but manual',
          'cmp.rp.s3.r4c2': 'Automated but requires learning',
          'cmp.rp.s3.eval':
              "For pure async API call scenarios, Riverpod 3.x's AsyncNotifier is safer and more automated. getx_distil requires manual state transition control, but offers greater flexibility.",

          // 5.4 DI
          'cmp.rp.s4.title': 'DI (Dependency Injection)',
          'cmp.rp.s4.desc1': 'getx_distil — Hybrid DI',
          'cmp.rp.s4.desc2': 'Riverpod 3.x — Provider Scope',
          'cmp.rp.s4.h0': 'Comparison',
          'cmp.rp.s4.r0c0': 'Registration',
          'cmp.rp.s4.r0c1': 'Manual (Get.put, BindingWidget)',
          'cmp.rp.s4.r0c2': 'Declarative provider objects (codegen optional)',
          'cmp.rp.s4.r1c0': 'Scope',
          'cmp.rp.s4.r1c1': 'Widget tree scope + global',
          'cmp.rp.s4.r1c2': 'Provider scope (overridable)',
          'cmp.rp.s4.r2c0': 'Dynamic Multi-instance',
          'cmp.rp.s4.r2c1': 'Natural via BindingWidget nesting',
          'cmp.rp.s4.r2c2': 'family modifier (compile-time)',
          'cmp.rp.s4.r3c0': 'Context-free Access',
          'cmp.rp.s4.r3c1': '✅ Get.find<T>()',
          'cmp.rp.s4.r3c2': '❌ ref/container required (a global container is an anti-pattern)',
          'cmp.rp.s4.r4c0': 'Lifecycle Management',
          'cmp.rp.s4.r4c1': 'Auto GC on widget dispose',
          'cmp.rp.s4.r4c2': 'autoDispose + ref.onDispose()',
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
          'cmp.rp.s5.r0c1': '1 notification (Microtask Batching)',
          'cmp.rp.s5.r0c2': 'N notifications + N list copies (state = [...state, x]); Flutter still builds once per frame',
          'cmp.rp.s5.r1c0': 'for loop mutations',
          'cmp.rp.s5.r1c1': 'Automatic batching',
          'cmp.rp.s5.r1c2':
              'Idiom: build the list first, assign once',
          'cmp.rp.s5.r2c0': 'Rx reads outside Obx',
          'cmp.rp.s5.r2c1': 'Zero-cost (isTracking flag)',
          'cmp.rp.s5.r2c2': 'N/A (Provider reads always need ref)',
          'cmp.rp.s5.eval':
              "In naive loop-mutation code getx_distil wins clearly: one notification and no copies versus N notifications and O(N²) copying. In idiomatic Riverpod code (build the list, assign once) the gap disappears — so this is a DX advantage more than a hard performance wall.",

          // 5.6 Safety Features
          'cmp.rp.s6.title': 'Safety Features',
          'cmp.rp.s6.h0': 'Safety Feature',
          'cmp.rp.s6.r0c0': 'Build-phase state mutation',
          'cmp.rp.s6.r0c1': 'Self-healing (PostFrameCallback deferral)',
          'cmp.rp.s6.r0c2': 'Throws "Tried to modify a provider while the widget tree was building"',
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
          'cmp.rp.s6.r4c2': 'No FIFO queue; stale results handled via ref.mounted / rebuild cancellation',
          'cmp.rp.s6.r5c0': 'Type Safety',
          'cmp.rp.s6.r5c1': 'Runtime (dynamic Get.find<T>())',
          'cmp.rp.s6.r5c2': 'Compile-time (typed provider objects; no codegen needed)',
          'cmp.rp.s6.eval':
              "getx_distil has richer runtime safety nets. Compile-time type safety is Riverpod 3.x's overwhelming advantage.",

          // 5.7 Code Generation vs Zero Dependency
          'cmp.rp.s7.title': 'Code Generation vs Zero Dependency',
          'cmp.rp.s7.h0': 'Category',
          'cmp.rp.s7.r0c0': 'build_runner needed',
          'cmp.rp.s7.r0c1': 'None',
          'cmp.rp.s7.r0c2': 'Optional',
          'cmp.rp.s7.r1c0': 'Generated code (.g.dart)',
          'cmp.rp.s7.r1c1': 'None',
          'cmp.rp.s7.r1c2': 'Only with riverpod_generator',
          'cmp.rp.s7.r2c0': 'Build time impact',
          'cmp.rp.s7.r2c1': 'None',
          'cmp.rp.s7.r2c2': 'Increases only when codegen is used',
          'cmp.rp.s7.r3c0': 'IDE Support',
          'cmp.rp.s7.r3c1': 'Standard Dart analysis',
          'cmp.rp.s7.r3c2': 'Generated code exploration needed (codegen only)',
          'cmp.rp.s7.r4c0': 'CI/CD Complexity',
          'cmp.rp.s7.r4c1': 'Low',
          'cmp.rp.s7.r4c2': 'Medium (build_runner step only with codegen)',
          'cmp.rp.s7.r5c0': 'External Dependencies',
          'cmp.rp.s7.r5c1': '0',
          'cmp.rp.s7.r5c2':
              'flutter_riverpod → riverpod, meta, collection, state_notifier (codegen adds more)',
          'cmp.rp.s7.eval':
              "For small projects the zero-dependency setup is a real advantage. Note that Riverpod 3.x works without build_runner; codegen is an opt-in that buys extra refactoring safety for large teams.",

          // 5.8 Testability
          'cmp.rp.s8.title': 'Testability',
          'cmp.rp.s8.h0': 'Category',
          'cmp.rp.s8.r0c0': 'Unit Testing',
          'cmp.rp.s8.r0c1': 'Get.put(mock) → Get.find()',
          'cmp.rp.s8.r0c2': 'ProviderContainer(overrides: [...])',
          'cmp.rp.s8.r1c0': 'Widget Testing',
          'cmp.rp.s8.r1c1': 'BindingWidget with Bind<Interface>(() => Mock()) (TDD guide, v1.3.2)',
          'cmp.rp.s8.r1c2': 'ProviderScope(overrides: [...])',
          'cmp.rp.s8.r2c0': 'Mocking Convenience',
          'cmp.rp.s8.r2c1': 'Good for widget tests (declarative Bind list); manual for global Get.put',
          'cmp.rp.s8.r2c2': 'Excellent (systematic override system)',
          'cmp.rp.s8.r3c0': 'Test Isolation',
          'cmp.rp.s8.r3c1': 'BindingWidget scopes self-isolate; Get.reset() still needed for global/immortal registries',
          'cmp.rp.s8.r3c2': 'Automatic ProviderContainer isolation',
          'cmp.rp.s8.eval':
              "Riverpod's override system remains the more systematic mocking story. getx_distil closed part of the gap in 1.3.2 with the BindingWidget TDD pattern, but its static registries (global, immortal, weak) still demand Get.reset() discipline.",

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
          'cmp.rp.guide.loser_title': 'When to choose Riverpod 3.x',
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
              '🧪 Override-heavy testing — provider overrides scale better than manual bindings for large mock graphs',
          'cmp.rp.guide.loser2':
              '📡 Async-centric Apps — API calls/caching/retry are core features',
          'cmp.rp.guide.loser3':
              '🔒 Strict State Management — explicitly control state mutation paths',
          'cmp.rp.guide.loser4':
              '🏗️ Long-term Maintenance — code generation provides refactoring safety net',

          // ── Comparison — Conclusion ──
          'cmp.con.title': 'Conclusion',
          'cmp.con.card0.quote':
              'getx_distil succeeds in precisely removing GetX\'s "excess" while refining its "core."',
          'cmp.con.card0.p0':
              'If GetX is a "framework," getx_distil is a "micro-engine." The design decision to boldly remove routing, dialogs, networking, and storage — focusing solely on state management and DI — perfectly aligns with the modern Flutter ecosystem (GoRouter, dio, shared_preferences, etc.).',
          'cmp.con.card0.p1':
              'RxList Microtask Batching and Tree-Scoped DI provide clear, verifiable advantages over the original, and RxSList/RxS are original contributions. Fast-Path Tracking is sound design but, against GetX 4.x\'s static proxy, its measurable gain is small.',
          'cmp.con.card0.p2':
              'For existing GetX users, it provides the same DX (.obs → Obx → Get.find) while fundamentally solving memory leak and scope collision issues in GoRouter environments. For new projects, it has a clear advantage over the original GetX.',
          'cmp.con.card1.quote':
              'getx_distil and Riverpod 3.x are closer to a complementary relationship rather than a competitive one.',
          'cmp.con.card1.p0':
              'getx_distil is a lightweight engine pursuing "fastest and freest with minimum code," while Riverpod 3.x is a structure-oriented framework that "strictly prevents mistakes through static types."',
          'cmp.con.card1.p1':
              'RxList microtask batching and build-phase self-healing have no counterpart in Riverpod, so getx_distil is more forgiving on pages with very high-frequency mutations. Riverpod reaches similar efficiency only when written idiomatically.',
          'cmp.con.card1.p2':
              "On the other hand, Riverpod 3.x's compile-time type safety and systematic async state management shine in large-scale projects. Choose based on project scale, team maturity, and data manipulation patterns.",
          'cmp.con.footer':
              'Revised: 2026-09-07\nVersions analyzed: getx_distil 1.3.2 · GetX 4.7.3 · flutter_riverpod 3.4.3',
        },
        'ko_KR': {
          // ── Nav ──
          'nav.home': '홈',
          'nav.guide': '가이드',
          'nav.api_ref': 'API 레퍼런스',
          'nav.comparison': '비교 분석',
          'nav.about': '개발자 정보',
          'nav.about_dev': '개발자 소개',

          // ── About Page ──
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
          'home.slogan_2': '위젯 트리 범위의 생명주기 및 가비지 컬렉션.',
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
          'home.btn_count_up': '카운트++',
          'home.btn_count_down': '카운트--',
          'home.demo_hint': '반응형 텍스트 입력...',
          'home.demo_rxslist_label': '2. 상태 인지형 리스트 (RxSList)',
          'home.btn_load_items': '아이템 로드',
          'home.btn_add_item': '아이템 추가',
          'home.btn_simulate_error': '에러 시뮬레이션',
          'home.btn_clear_list': '리스트 비우기',
          'home.demo_rxs_label': '3. 상태 인지형 단일 값 (RxS)',
          'home.btn_load_user': '유저 로드',
          'home.btn_reset_idle': '대기 상태 리셋',
          'home.btn_reset_all': '모든 컨트롤 초기화',
          'home.live_state_label': '🟢 실시간 상태 뷰',
          'home.mutations_count': '변경 횟수: @count',
          'home.list_empty': '리스트가 비어 있습니다.',
          'home.list_idle': '리스트가 대기(Idle) 상태입니다.',
          'home.user_idle': '유저가 대기(Idle) 상태입니다.',

          // ── Home — Features ──
          'home.features_label': '디자인 시스템 특징',
          'home.features_title': '정교한 마이크로 아키텍처',
          'home.btn_learn_more': '더 알아보기',

          'home.feat.reactive_state.title': '반응형 상태 (Rx 및 Obx)',
          'home.feat.reactive_state.desc':
              '단순히 .obs를 추가하여 상태를 선언하고, 타겟 속성만을 구독하는 경량 반응형 위젯을 구축하세요.',
          'home.feat.rxs.title': '상태 인지형 (RxSList 및 RxS)',
          'home.feat.rxs.desc':
              '비동기 상태의 생명주기 처리를 단순화합니다. 반응형 옵저버블 내부에서 대기, 로딩, 완료, 빈 상태, 에러 상태를 직접 관리할 수 있습니다.',
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
              '1. RxSList (반응형 리스트): RxList를 확장하여 리스트 조작 시 비동기 상태(대기, 로딩, 완료, 비어있음, 에러)를 자동으로 연동합니다.',
          'api.meta.rxs.pt1':
              '2. RxS (반응형 단일값): Rxn을 확장하여 유저 프로필과 같은 단일 객체 모델의 비동기 상태(대기, 로딩, 완료, 에러)를 제공합니다.',
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
          'api.meta.i18n.next_title': 'TDD & 테스트 용이성',

          // ── API Section Meta — TDD & Testability ──
          'api.meta.tdd.title': 'TDD & 테스트 용이성',
          'api.meta.tdd.desc':
              'getx_distil의 BindingWidget은 TDD (테스트 주도 개발) 및 단위/위젯 테스트 시 그 가치가 더욱 빛납니다. 기존의 글로벌 싱글톤 DI 시스템은 다수의 테스트 케이스를 동시에 실행할 때 상태 오염 및 테스트 간 간섭 문제를 유발하곤 했습니다. BindingWidget은 엄격하게 트리 스코프를 따르는 격리된 DI 라이프사이클을 제공하므로, 전역 네임스페이스를 더럽히거나 테스트 순서 얽힘 걱정 없이 모의 객체(Mock) 중심의 독립된 위젯 및 로직 테스트를 유연하게 작성할 수 있습니다.',
          'api.meta.tdd.pt0':
              '상태 오염 제로: 각 테스트가 고유의 BindingWidget을 생성하고 해제하므로 다른 테스트에 어떠한 부작용도 유출되지 않습니다.',
          'api.meta.tdd.pt1':
              '프로덕션 코드 수정 불필요: 컨트롤러나 뷰에 isTesting 플래그나 조건부 주입 분기문이 필요 없습니다. 테스트용 BindingWidget 내부의 bindings 목록에 모의 객체만 선언하면 됩니다.',
          'api.meta.tdd.pt2':
              '선언형 오버라이드: 실제 서비스를 Mock 구현체로 대체하는 작업이 선언적인 bindings 목록 정의만으로 깔끔하게 완료됩니다.',
          'api.meta.tdd.next_title': 'GoRouter와 반응형 라우트 가드',

          // ── API Section Meta — GoRouter & Route Guard ──
          'api.meta.route_guard.title': 'GoRouter와 반응형 라우트 가드',
          'api.meta.route_guard.desc':
              'getx_distil은 자체적인 라우팅 시스템 대신 Flutter 표준 라우터 패키지인 GoRouter와의 완벽한 연동을 지향합니다. getx_distil의 모든 Rx 변수(예: RxBool, Rxn 등)는 Flutter의 표준 ValueListenable을 구현하고 있으므로, GoRouter의 refreshListenable에 직접 바인딩하여 반응형 라우트 가드(인증 및 권한 미들웨어)를 매우 선언적으로 구현할 수 있습니다.',
          'api.meta.route_guard.pt0':
              '선언형 라우트 가드: Rx 변수들을 GoRouter의 refreshListenable에 바인딩하여 데이터가 바뀔 때 자동으로 리다이렉션을 실행합니다.',
          'api.meta.route_guard.pt1':
              '표준 인터페이스 호환: 모든 Rx 변수가 ValueListenable을 직접 구현하므로, 추가적인 보일러플레이트 코드 없이 직접 연동이 가능합니다.',
          'api.meta.route_guard.pt2':
              '정밀한 생명주기 조화: BindingWidget과 완벽하게 조화되어 화면 이탈 시 해당 스코프의 리소스를 깨끗이 가비지 컬렉션합니다.',
          'api.meta.route_guard.next_title': '비교 분석 시작하기',

          'api.route_guard.sub1_title': '1. 전역 인증 컨트롤러 정의',
          'api.route_guard.sub1_desc':
              '인증 세션 체크 여부(isInitialized)와 로그인 여부(isLoggedIn)를 추적하는 전역 컨트롤러입니다.',
          'api.route_guard.sub2_title': '2. main() 및 GoRouter 설정 (올바른 초기화 타이밍)',
          'api.route_guard.sub2_desc':
              'GoRouter를 파일 최상단 전역 변수나 클래스 static 변수로 선언하고 refreshListenable에서 Get.find<AuthController>()를 바로 호출하는 경우, 의존성 등록 시점과의 타이밍 이슈가 생길 수 있습니다. 이를 방지하기 위해 앱 구동 시작점인 main()에서 Get.put(AuthController(), permanent: true)을 호출하여 최우선적으로 전역 주입한 뒤, GoRouter를 연동해야 합니다.',
          'api.route_guard.sub3_title': '⚠️ 초기화 타이밍 주의 (크래시가 발생하는 예시)',
          'api.route_guard.sub3_desc':
              'GetMaterialApp의 bindings 프로퍼티는 위젯이 빌드되는 단계에서 의존성을 주입합니다. 전역 변수로 GoRouter를 선언하고 refreshListenable에서 Get.find...을 수행하면서, GetMaterialApp(bindings: [...])에 의존성을 정의하면 의존성 등록 전에 GoRouter가 평가(Evaluation)되면서 탐색 실패 크래시가 발생합니다.',
          'api.route_guard.warn_desc':
              '따라서 인증 컨트롤러처럼 라우트 가드에 연동되어 앱 최극초기 구동 시점에 조회되어야 하는 글로벌 핵심 서비스는 main() 함수 내에서 Get.put(..., permanent: true)을 호출해 가장 먼저 수동 등록하는 것이 좋습니다.',

          // ── Comparison Page ──
          'comparison.next_section': '다음 섹션',
          'comparison.selection_guide': '5.10 프레임워크 선택 가이드',

          // ── Comparison — Overview ──
          'cmp.ov.title': '상세 비교 분석 및 평가',
          'cmp.ov.section_title': '1. getx_distil 프로젝트 개요',
          'cmp.ov.next_title': '2. 기존 GetX 대비 주요 개선점',
          'cmp.ov.h_category': '구분',
          'cmp.ov.r_version': '버전',
          'cmp.ov.r_deps': '외부 의존성',
          'cmp.ov.r_deps_distil': '0 (Flutter SDK만 사용)',
          'cmp.ov.r_deps_getx': '1개 (web)',
          'cmp.ov.r_files': '소스 파일 수',
          'cmp.ov.r_logic': '코드 라인 수 (전체 / 공백·주석 제외)',
          'cmp.ov.r_tests': '테스트 코드',
          'cmp.ov.r_tests_getx': 'pub 패키지에 미포함',
          'cmp.ov.r_collections': '반응형 컬렉션',
          'cmp.ov.r_collections_distil': 'RxList만 제공 (마이크로태스크 배치)',
          'cmp.ov.r_collections_getx': 'RxList / RxMap / RxSet',
          'cmp.ov.r_routing': '자체 라우팅',
          'cmp.ov.r_routing_getx': '✅ 내장됨 (GetPageRoute 등)',
          'cmp.ov.r_i18n': '다국어 지원',
          'cmp.ov.r_i18n_distil': '✅ 유지 (경량화)',
          'cmp.ov.r_i18n_getx': '✅ 내장됨',
          'cmp.ov.r_state': '상태 관리 기능',
          'cmp.ov.r_state_distil': '✅ 핵심 엔진 강화 (RxS / RxSList / 배치)',
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
          'cmp.imp.i1.subtitle': '추적 게이트가 더 깔끔하지만, GetX 4.x 대비 이득은 흔히 말하는 것보다 작음',
          'cmp.imp.i1.h0': '비교 항목',
          'cmp.imp.i1.r0c0': '동작 메커니즘',
          'cmp.imp.i1.r0c1': '정적 nullable 프록시 (RxInterface.proxy?.addListener) — Zone 기반이 아님',
          'cmp.imp.i1.r0c2': '정적 불리언 플래그 기반 방식 (Notifier.isTracking)',
          'cmp.imp.i1.r1c0': 'Obx 외부에서 Rx 읽기',
          'cmp.imp.i1.r1c1': '정적 필드 널 검사 1회 (이미 O(1))',
          'cmp.imp.i1.r1c2': '정적 불리언 검사 1회 (비용 사실상 동일)',
          'cmp.imp.i1.r2c0': 'Rx당 알림 채널 구조',
          'cmp.imp.i1.r2c1': '모든 Rx마다 GetStream을 즉시 할당',
          'cmp.imp.i1.r2c2': '단순 콜백 리스트, StreamController는 Worker 구독 시에만 지연 생성',
          'cmp.imp.i1.eval':
              '정정: 이 페이지의 이전 판은 GetX를 "Zone 기반"이라고 설명했으나, GetX 4.x는 4.0부터 정적 프록시를 사용합니다. 따라서 Obx 밖에서의 Rx 읽기 비용은 두 라이브러리가 사실상 같습니다. 검증 가능한 실질 이득은 구조적인 부분 — Rx마다 GetStream을 할당하고 구독을 관리하는 배관을 getx_distil이 생략한다는 점입니다. 깔끔한 설계이지만 극적인 CPU 절감은 아닙니다.',
          // Item 2.2
          'cmp.imp.i2.title': '자동 오류 치료형 렌더링 지연 업데이트',
          'cmp.imp.i2.subtitle': '빌드 및 레이아웃 단계 중 크래시 발생 방지',
          'cmp.imp.i2.h0': '비교 항목',
          'cmp.imp.i2.r0c0': '빌드 중 상태 변경',
          'cmp.imp.i2.r0c1': '디버그 assert: setState() or markNeedsBuild() called during build',
          'cmp.imp.i2.r0c2': 'PostFrameCallback으로 지연 (한 프레임 늦게 반영)',
          'cmp.imp.i2.r1c0': '감지 기법',
          'cmp.imp.i2.r1c1': '없음',
          'cmp.imp.i2.r1c2':
              'SchedulerBinding.instance.schedulerPhase 상태 정밀 분석',
          'cmp.imp.i2.eval':
              '디버그 모드의 레드 스크린 assert를 제거하고 취약한 패턴을 안전하게 만듭니다. 다만 정확히 말하면 릴리스 빌드에서는 Flutter가 이 상황에서 크래시하지 않고 갱신을 그대로 적용하며, 지연 처리에는 한 프레임의 지연 비용이 따릅니다. 유용한 안전망이지만 공짜는 아닙니다.',
          // Item 2.3
          'cmp.imp.i3.title': 'RxList 마이크로태스크 배치 업데이트',
          'cmp.imp.i3.subtitle': '가장 체감되는 주요 성능 최적화 요소',
          'cmp.imp.i3.h0': '비교 항목',
          'cmp.imp.i3.r0c0': 'add() 100회 호출',
          'cmp.imp.i3.r0c1': '알림 100회 (setState 100회 호출, 실제 build는 프레임당 1회)',
          'cmp.imp.i3.r0c2': '알림 1회 → build 1회',
          'cmp.imp.i3.r1c0': '구현 메커니즘',
          'cmp.imp.i3.r1c1': '동작이 발생할 때마다 즉시 리프레시 진행',
          'cmp.imp.i3.r1c2': '더티 플래그(Dirty-Flag) 및 마이크로태스크 스케줄러 결합',
          'cmp.imp.i3.r2c0': 'sort() / shuffle() 수행',
          'cmp.imp.i3.r2c1': 'sort: 1회 (오버라이드됨) / shuffle: N회 (ListMixin 기본)',
          'cmp.imp.i3.r2c2': '둘 다 1회 (오버라이드됨)',
          'cmp.imp.i3.r3c0': '알림 타이밍',
          'cmp.imp.i3.r3c1': '동기 (add() 내부에서 리스너 즉시 실행)',
          'cmp.imp.i3.r3c2': '비동기 (다음 마이크로태스크) — 테스트에서 await/pump 필요',
          'cmp.imp.i3.eval':
              '1만 개를 순차 추가하면 GetX는 리스너 알림 1만 회(ever/Worker 콜백도 1만 회)를 발생시키고 getx_distil은 정확히 1회입니다. 단, Flutter는 위젯 build를 프레임당 1회로 이미 병합하므로 절감되는 것은 build() 호출이 아니라 알림 디스패치와 Worker 부수효과입니다. 대가로 알림이 비동기가 됩니다.',
          // Item 2.4
          'cmp.imp.i4.title': '100% 위젯 트리 스코프 DI (BindingWidget)',
          'cmp.imp.i4.subtitle': '아키텍처 설계 패러다임의 중대한 변화',
          'cmp.imp.i4.h0': '비교 항목',
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
          'cmp.imp.i4.r3c1': '낮음 (Binding은 GetPage 필요, SmartManagement는 GetX 라우트 옵저버에 의존)',
          'cmp.imp.i4.r3c2': '완전 호환 및 연동 가능',
          'cmp.imp.i4.r4c0': '컨텍스트 없는 탐색',
          'cmp.imp.i4.r4c1': 'Get.find<T>() 호출',
          'cmp.imp.i4.r4c2': 'Get.find<T>() 지원 (WeakReference 캐시; 동일 타입 인스턴스가 여럿 살아 있으면 모호함)',
          'cmp.imp.i4.eval':
              'GoRouter 시대에 맞는 설계이며 GetX 최대의 구조적 약점을 해소합니다. 주의: 컨텍스트 없는 폴백은 가장 최근에 등록된 인스턴스를 반환하므로, 같은 타입의 인스턴스가 N개 살아 있는 상황에서는 반드시 context를 넘겨야 합니다.',
          // Item 2.5
          'cmp.imp.i5.title': 'FIFO 순차 실행 파이프라인 (updateSequential)',
          'cmp.imp.i5.subtitle': '빈번한 비동기 작업 시 경쟁 상태(Race Condition) 방지',
          'cmp.imp.i5.h0': '비교 항목',
          'cmp.imp.i5.r0c0': '비동기 갱신 순서',
          'cmp.imp.i5.r0c1': '비보장 (통신 속도 차이로 상태 꼬임 가능)',
          'cmp.imp.i5.r0c2': '철저한 선입선출(FIFO) 순차 실행 보장',
          'cmp.imp.i5.r1c0': '제어 방식',
          'cmp.imp.i5.r1c1': '없음',
          'cmp.imp.i5.r1c2': 'Completer 체이닝 파이프라인 탑재',
          'cmp.imp.i5.eval':
              '실시간 시세, 채팅, 센서 모니터링처럼 짧은 순간에 다량의 비동기 갱신이 몰리는 환경에 꼭 필요한 안전장치입니다. 주의: action 내부 예외는 addError로 Rx 스트림에 전달되므로, 구독 중인 Worker가 없으면 조용히 사라집니다.',
          // Item 2.6
          'cmp.imp.i6.title': 'RxSList / RxS — 상태 인지형 반응형 타입',
          'cmp.imp.i6.subtitle': 'GetX 패키지에는 없는 오리지널 신기능',
          'cmp.imp.i6.h0': '비교 항목',
          'cmp.imp.i6.r0c0': '리스트 상태 관리',
          'cmp.imp.i6.r0c1': '별도의 isLoading, errorMessage 등의 변수 선언 필요',
          'cmp.imp.i6.r0c2': '리스트 자체에 상태 내장 (idle/loading/loaded/empty/error, v1.3.0+)',
          'cmp.imp.i6.r1c0': '단일 인스턴스 상태',
          'cmp.imp.i6.r1c1': '컨트롤러 레벨의 StateMixin을 통해서만 제어 가능',
          'cmp.imp.i6.r1c2': '개별 변수 단위로 상태 관리가 내장됨 (RxS)',
          'cmp.imp.i6.r2c0': 'UI 분기 작성',
          'cmp.imp.i6.r2c1': '조건부(if-else) 뷰 조각 수동 구성',
          'cmp.imp.i6.r2c2': '.on() 선언형 빌더를 활용한 깔끔한 바인딩',
          'cmp.imp.i6.eval':
              '별도의 isLoading/errorMessage 변수를 없애는 DX 혁신이며 GetX에는 없는 독창적 기여입니다. 아쉬운 점 둘: .ops가 모든 타입 T에 대한 확장이라 자동완성 어디에나 노출되고, 데이터를 넣어 생성한 리스트도 loaded가 아닌 idle로 시작합니다.',
          // Item 2.7
          'cmp.imp.i7.title': '엄격한 비동기 Obx 코드 검증 체계',
          'cmp.imp.i7.subtitle': '비동기 Obx 작성 안티패턴 사전 차단',
          'cmp.imp.i7.h0': '비교 항목',
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
          'cmp.imp.i8.r0c0': '오류 안내 메시지',
          'cmp.imp.i8.r0c1': '"CounterController" not found. You need to call "Get.put(...)" 한 줄 출력',
          'cmp.imp.i8.r0c2': '요청 위젯 정보 + 부모 탐색 구조(위젯 트리) + 현재 등록 정보 전체 출력',
          'cmp.imp.i8.eval':
              '의존성 탐색 오류가 일어났을 때 어디서 누락이 일어났는지 위젯 조상 추적 및 글로벌 인벤토리 정보를 모아 한눈에 시각화해 줍니다.',

          // ── Comparison — Sacrificed ──
          'cmp.sac.title': '미지원 및 제거된 기능 목록',
          'cmp.sac.h_feature': '기능군',
          'cmp.sac.h_impact': '영향 및 대체제',
          'cmp.sac.r0c0': '자체 라우팅 엔진',
          'cmp.sac.r0c1': 'GetPageRoute, Get.to(), Get.off() 등',
          'cmp.sac.r0c3': 'GoRouter 또는 Flutter 표준 네비게이터 활용 권장',
          'cmp.sac.r1c0': 'Get.dialog / bottomSheet / snackbar',
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
          'cmp.sac.r6c0': 'interval / everAll 워커',
          'cmp.sac.r6c1': '주기 실행 워커 및 다중 Rx 감시 워커',
          'cmp.sac.r6c3': 'Timer 또는 Rx별 ever()로 대체',
          'cmp.sac.r7c0': 'SmartManagement 기능',
          'cmp.sac.r7c1': '메모리 인스턴스 자동 파기 및 유지 정책 제어',
          'cmp.sac.r7c3': 'BindingWidget의 생명주기 자동 가비지 컬렉션(GC)으로 완전 일원화',
          'cmp.sac.r8c0': 'RxMap / RxSet',
          'cmp.sac.r8c1': '반응형 Map/Set 컬렉션',
          'cmp.sac.r8c3': 'RxList만 존재. Map/Set은 Rx<T>에 담아 재대입',
          'cmp.sac.r9c0': 'GetBuilder / update(ids)',
          'cmp.sac.r9c1': 'ID 기반 부분 리빌드',
          'cmp.sac.r9c3': 'update()는 남아 있지만 ids는 무시됨 — Obx 단위로 분리',
          'cmp.sac.r10c0': 'Rx.bindStream',
          'cmp.sac.r10c1': '외부 Stream을 Rx에 바인딩',
          'cmp.sac.r10c3': 'stream.listen((v) => rx.value = v) 후 onClose에서 cancel',
          'cmp.sac.info_card':
              '라우팅, 다이얼로그, 통신, 저장소 등을 제거한 것은 현대 Flutter 생태계에 부합하기 위한 의도적인 다운사이징입니다. 각 역할에 집중된 전문 패키지를 결합하여 사용하면 더욱 견고하고 확장성 있는 구조를 완성할 수 있습니다.',
          'cmp.sac.next_title': '4. 코드 품질 종합 진단',
          'cmp.sac.removed': '❌ 제거됨',

          // ── Comparison — Quality ──
          'cmp.qa.title': '코드 품질 종합 평가',
          'cmp.qa.good0':
              '컴팩트 — 18개 파일, 전체 1,968줄(공백·주석 제외 1,342줄)로 GetX 4.7.3(17,351 / 11,831줄)의 약 11%입니다. 한 번에 다 읽을 수 있는 크기입니다.',
          'cmp.qa.good1': '제로 의존성 — Flutter SDK에만 의존하여 공급망 보안 위험이 완전히 제로입니다.',
          'cmp.qa.good2':
              '탄탄한 테스트 — 패키지 테스트 1,689줄 / 114 케이스에 TDD 예제 테스트(v1.3.2)가 추가되었습니다. RxList 배치, WeakReference 좀비 방지, 형제 컨트롤러 onClose 상호 참조, idle/error 전환을 커버합니다.',
          'cmp.qa.good3':
              '단일 구조 체계 — 모든 반응형 타입이 GetListenable -> RxInterface 계층을 완벽히 따라 확장성이 좋습니다.',
          'cmp.qa.good4':
              '안정성 극대화 — 약한 참조(WeakReference) 캐시, 라이프사이클 역순 파괴 정책, Expando 기반 GetView 관리 등이 정교히 짜여 있습니다.',
          'cmp.qa.good5':
              '문서 퀄리티 — 영문/국문 README가 동기화되어 있고 예제 앱이 전 기능을 다루며, v1.3.2에서 목 서비스 주입을 다룬 TDD 가이드가 추가되었습니다.',
          'cmp.qa.good6':
              '루트 서비스 즉시 초기화 — GetMaterialApp(bindings)과 BindingWidget(eager: true)이 마운트 시점에 GetxService를 초기화(v1.3.1)하여 기존 builder 콜백 우회책이 사라졌습니다.',
          'cmp.qa.bad0':
              'update(ids)는 받아들이지만 ids를 조용히 무시하고 GetBuilder도 없음 — ID 기반 부분 리빌드에 의존하던 GetX 코드가 컴파일은 되지만 기대와 다르게 동작합니다.',
          'cmp.qa.bad1':
              '초기 데이터를 넣은 RxSList/RxS도 loaded가 아닌 idle로 시작 — [1, 2, 3].ops는 첫 변경 전까지 idle을 보고합니다. loaded로 시작하는 옵션이 있으면 좋겠습니다.',
          'cmp.qa.bad2':
              '컬렉션은 RxList만 — RxMap/RxSet이 없고, Worker에 interval/everAll이 없으며, Rx.bindStream도 사라졌습니다.',
          'cmp.qa.bad3':
              '태그와 위젯 트리 스코프는 상호 배타적 — Get.find<T>(context, tag)는 BindingWidget 탐색을 완전히 건너뛰며, 위치 인자 방식의 Get.find(null, tag)는 GetX의 named tag: 파라미터와 시그니처가 다릅니다.',
          'cmp.qa.bad4':
              'updateSequential이 오류를 삼킴 — 예외가 addError로 브로드캐스트 스트림에 전달되므로 구독 중인 Worker가 없으면 소리 없이 사라집니다.',
          'cmp.qa.bad5':
              '컨텍스트 없는 Get.find<T>()는 동일 타입 인스턴스가 여럿이면 모호함 — 마지막에 등록된 것을 반환하며, 무관한 활성 BindingWidget 안의 바인딩을 미리 인스턴스화할 수도 있습니다.',
          'cmp.qa.bad6':
              'lazyPut(fenix: true)는 저장만 되고 실제로는 동작하지 않음 — 삭제된 lazy 의존성이 다음 find()에서 재생성되지 않습니다.',
          'cmp.qa.s0_item': '아키텍처 설계 품질',
          'cmp.qa.s0_note': '위젯 트리 기반 스코프 주입과 하이브리드 탐색 연동은 최고 수준',
          'cmp.qa.s1_item': '성능 최적화 역량',
          'cmp.qa.s1_note': '배치와 FIFO 파이프라인은 실질적 이득, Fast-Path의 GetX 4.x 대비 이득은 미미',
          'cmp.qa.s2_item': '메모리 관리 안전성',
          'cmp.qa.s2_note': 'WeakReference·해제 순서 보장·Expando 정리는 우수, 정적 레지스트리는 테스트에서 Get.reset() 필요',
          'cmp.qa.s3_item': 'DX (개발자 경험)',
          'cmp.qa.s3_note': '상태 인지형 RxSList와 .on() 분기 처리 가독성은 최고 수준',
          'cmp.qa.s4_item': 'GetX 호환성',
          'cmp.qa.s4_note':
              '.obs / Obx / Get.put은 동일하나 Get.find 태그 시그니처, RxMap/RxSet, GetBuilder, bindStream은 다름',
          'cmp.qa.s5_item': '테스트 신뢰성',
          'cmp.qa.s5_note': '114 케이스 + TDD 예제. updateSequential 오류 경로와 fenix는 미검증',
          'cmp.qa.s6_item': '문서화 수준',
          'cmp.qa.s6_note': '한글/영문 가이드라인과 정교한 완성형 데모의 품질이 훌륭함',
          'cmp.qa.s7_item': '생태계 친화성',
          'cmp.qa.s7_note':
              'GoRouter 연동이 매끄러운 대신 기존 GetX 프로젝트 마이그레이션 시 수동 작업 요소 발생',

          // ── Comparison — Riverpod ──
          'cmp.rp.next_title': '종합 결론',

          // 5.1 Philosophical Differences
          'cmp.rp.s1.title': '기본 철학 및 지향점의 차이',
          'cmp.rp.s1.h0': '비교 요소',
          'cmp.rp.s1.r0c0': '지향 패러다임',
          'cmp.rp.s1.r0c1': '명령형(Imperative)에 친화적인 반응형',
          'cmp.rp.s1.r0c2': '선언형(Declarative)에 철저히 입각한 상태 전달',
          'cmp.rp.s1.r1c0': '상태 데이터 선언',
          'cmp.rp.s1.r1c1': '런타임 도중 동적 선언 + .obs 지정',
          'cmp.rp.s1.r1c2': '타입이 있는 프로바이더 객체 (코드 생성은 선택)',
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
          'cmp.rp.s1.r5c2': '선택 (riverpod_generator 사용 시에만)',
          'cmp.rp.s1.eval':
              'getx_distil의 명료한 명령형 패러다임은 극히 낮은 학습 곡선과 상용구 제로 수준의 속도를 보장합니다. 반면 Riverpod 3.x은 체계적이지만 사전 설정과 공부할 개념이 많습니다.',

          // 5.2 State Management Approach
          'cmp.rp.s2.title': '상태 관리 접근 방식의 차이',
          'cmp.rp.s2.desc1': 'getx_distil — 명령형 옵저버블 방식',
          'cmp.rp.s2.desc2': 'Riverpod 3.x — 선언형 노티파이어 방식',
          'cmp.rp.s2.h0': '비교 특징',
          'cmp.rp.s2.r0c0': '상태 변수 선언',
          'cmp.rp.s2.r0c1': '.obs 한 줄로 간단히 해결',
          'cmp.rp.s2.r0c2': 'Notifier 클래스 + build() (+ 선택적 어노테이션)',
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

          // 5.3 Async State Management
          'cmp.rp.s3.title': '비동기 상태 관리',
          'cmp.rp.s3.h0': '비교 특징',
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
          'cmp.rp.s3.r3c2': '기본 내장 (keepAlive, 자동 retry, invalidate, 실험적 오프라인 영속화)',
          'cmp.rp.s3.r4c0': '사용자 개발 경험(DX)',
          'cmp.rp.s3.r4c1': '직관적이나 손이 더 많이 감',
          'cmp.rp.s3.r4c2': '자동화되어 있으나 개념 학습 장벽 존재',
          'cmp.rp.s3.eval':
              '단순 API 연동 영역에 있어서는 Riverpod의 AsyncNotifier가 훨씬 정교하고 견고합니다. getx_distil은 수동 처리가 다소 있지만 동작 흐름 제어 자유도가 높습니다.',

          // 5.4 DI
          'cmp.rp.s4.title': '의존성 주입(DI) 아키텍처 비교',
          'cmp.rp.s4.desc1': 'getx_distil — 하이브리드 탐색 체인',
          'cmp.rp.s4.desc2': 'Riverpod 3.x — 프로바이더 범위(Scope) 지향',
          'cmp.rp.s4.h0': '비교 특징',
          'cmp.rp.s4.r0c0': '의존성 등록',
          'cmp.rp.s4.r0c1': '수동 등록 지향 (Get.put, BindingWidget 활용)',
          'cmp.rp.s4.r0c2': '선언적 프로바이더 객체 (코드 생성은 선택)',
          'cmp.rp.s4.r1c0': '주입 유효 스코프',
          'cmp.rp.s4.r1c1': '위젯 트리 단위 로컬 영역 + 글로벌 영역 복합 방식',
          'cmp.rp.s4.r1c2': '프로바이더 범위 (특정 노드 오버라이드 가능)',
          'cmp.rp.s4.r2c0': '동적 다중 인스턴스',
          'cmp.rp.s4.r2c1': 'BindingWidget의 위젯 트리 중첩을 통해 직관적 대응',
          'cmp.rp.s4.r2c2': 'family 제어 모디파이어 활용 (컴파일 타임 규격 필요)',
          'cmp.rp.s4.r3c0': '컨텍스트 독립 탐색',
          'cmp.rp.s4.r3c1': '✅ 완전 지원 (어디서나 Get.find<T>() 호출 가능)',
          'cmp.rp.s4.r3c2': '❌ ref/container 필요 (전역 컨테이너 접근은 안티패턴)',
          'cmp.rp.s4.r4c0': '의존성 생명주기 관리',
          'cmp.rp.s4.r4c1': '해당 위젯 트리 제거 시 컨트롤러 자동 GC 작동',
          'cmp.rp.s4.r4c2': 'autoDispose + ref.onDispose() 콜백',
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
          'cmp.rp.s5.r0c1': '마이크로태스크 배치로 알림 1회',
          'cmp.rp.s5.r0c2': '알림 N회 + 리스트 복사 N회 (state = [...state, x]); build는 여전히 프레임당 1회',
          'cmp.rp.s5.r1c0': '루프 내부 변경',
          'cmp.rp.s5.r1c1': '배치 최적화로 자동 병합 제어',
          'cmp.rp.s5.r1c2': '관용구: 리스트를 먼저 만들고 한 번에 대입',
          'cmp.rp.s5.r2c0': 'Obx 미사용 읽기',
          'cmp.rp.s5.r2c1': 'isTracking 플래그 O(1) 초고속 패스 패스',
          'cmp.rp.s5.r2c2': '해당 없음 (프로바이더 값을 얻으려면 상시 ref 전달이 필요)',
          'cmp.rp.s5.eval':
              '루프 안에서 그대로 변경하는 순진한 코드에서는 getx_distil이 확실히 우세합니다: 알림 1회·복사 0회 vs 알림 N회·O(N²) 복사. 그러나 관용적인 Riverpod 코드(리스트를 만들어 한 번에 대입)에서는 격차가 사라지므로, 이는 절대적 성능 장벽보다 DX 우위에 가깝습니다.',

          // 5.6 Safety Features
          'cmp.rp.s6.title': '안정성 및 검증 장치 비교',
          'cmp.rp.s6.h0': '검증 및 안전 장치',
          'cmp.rp.s6.r0c0': '빌드 단계 상태 갱신',
          'cmp.rp.s6.r0c1': '프레임 종료 후로 안전하게 자동 스케줄 지연 (오류 복구)',
          'cmp.rp.s6.r0c2': '"Tried to modify a provider while the widget tree was building" 예외 발생',
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
          'cmp.rp.s6.r4c2': 'FIFO 큐는 없음. 낡은 결과는 ref.mounted / 리빌드 취소로 처리',
          'cmp.rp.s6.r5c0': '정적 타입 안전성',
          'cmp.rp.s6.r5c1': '런타임 위젯 트리 조회 기반 (오동작 시 런타임 익셉션 발생)',
          'cmp.rp.s6.r5c2': '컴파일 타임 (타입이 있는 프로바이더 객체, 코드 생성 불필요)',
          'cmp.rp.s6.eval':
              'getx_distil은 유연한 런타임 구조 위에 다양한 다중 안전 그물을 덧댄 형태입니다. 반면 Riverpod은 컴파일 수준에서 실수를 사전 봉쇄하는 것에 초점이 맞추어져 있습니다.',

          // 5.7 Code Generation vs Zero Dependency
          'cmp.rp.s7.title': '코드 생성 방식 vs 제로 의존성 순수 방식',
          'cmp.rp.s7.h0': '비교 항목',
          'cmp.rp.s7.r0c0': '빌드 러너 가동 여부',
          'cmp.rp.s7.r0c1': '불필요',
          'cmp.rp.s7.r0c2': '선택',
          'cmp.rp.s7.r1c0': '자동 생성 코드 파일 (.g.dart)',
          'cmp.rp.s7.r1c1': '없음 (순수 코드로 개발 완료)',
          'cmp.rp.s7.r1c2': 'riverpod_generator 사용 시에만 생성',
          'cmp.rp.s7.r2c0': '전체 빌드 소요 시간',
          'cmp.rp.s7.r2c1': '차이 없음 (순수 Flutter 빌드 시간만 소요)',
          'cmp.rp.s7.r2c2': '코드 생성을 쓸 때만 늘어남',
          'cmp.rp.s7.r3c0': 'IDE 지연 감지',
          'cmp.rp.s7.r3c1': '표준 분석기 작동으로 지연 없음',
          'cmp.rp.s7.r3c2': '생성 코드 탐색 필요 (코드 생성 사용 시)',
          'cmp.rp.s7.r4c0': 'CI/CD 빌드 프로세스',
          'cmp.rp.s7.r4c1': '단순하고 빠른 셋업',
          'cmp.rp.s7.r4c2': '중간 (코드 생성 사용 시에만 build_runner 단계 추가)',
          'cmp.rp.s7.r5c0': '패키지 총 의존성',
          'cmp.rp.s7.r5c1': '0 (Flutter SDK 내장)',
          'cmp.rp.s7.r5c2':
              'flutter_riverpod → riverpod, meta, collection, state_notifier (코드 생성 시 추가)',
          'cmp.rp.s7.eval':
              '소규모 프로젝트에서는 의존성 제로 셋업이 실질적 장점입니다. 단, Riverpod 3.x는 build_runner 없이도 동작하며 코드 생성은 대규모 팀의 리팩토링 안전성을 추가로 사는 선택 사항입니다.',

          // 5.8 Testability
          'cmp.rp.s8.title': '단위 테스트 및 모킹(Mocking)',
          'cmp.rp.s8.h0': '구분',
          'cmp.rp.s8.r0c0': '단위 테스트 수행',
          'cmp.rp.s8.r0c1': 'Get.put(mock)을 통해 수동 교환 후 Get.find 호출',
          'cmp.rp.s8.r0c2': 'ProviderContainer의 overrides 속성에 모킹 전달',
          'cmp.rp.s8.r1c0': '위젯 테스트 수행',
          'cmp.rp.s8.r1c1': 'BindingWidget에 Bind<Interface>(() => Mock()) 선언 (TDD 가이드, v1.3.2)',
          'cmp.rp.s8.r1c2': 'ProviderScope 내부 overrides 목록 교체 방식으로 간편함',
          'cmp.rp.s8.r2c0': '모킹 처리 난이도',
          'cmp.rp.s8.r2c1': '위젯 테스트는 양호 (선언적 Bind 목록), 글로벌 Get.put은 수동',
          'cmp.rp.s8.r2c2': '매우 편리함 (프로바이더 단위 오버라이드 시스템 완벽 지원)',
          'cmp.rp.s8.r3c0': '각 테스트 간 독립 격리',
          'cmp.rp.s8.r3c1': 'BindingWidget 스코프는 자체 격리, 글로벌/immortal 레지스트리는 Get.reset() 필요',
          'cmp.rp.s8.r3c2': '새 컨테이너 객체 생성 방식으로 테스트 간 간섭 자동 차단',
          'cmp.rp.s8.eval':
              '모킹은 여전히 Riverpod의 override 시스템이 더 체계적입니다. getx_distil은 1.3.2의 BindingWidget TDD 패턴으로 격차를 일부 줄였지만, 정적 레지스트리(글로벌·immortal·weak)는 여전히 Get.reset() 규율을 요구합니다.',

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
          'cmp.rp.guide.loser_title': '이런 상황이라면 Riverpod 3.x을 선택하세요!',
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
              '🧪 override 중심의 대규모 테스트 — 목 그래프가 커질수록 프로바이더 override가 수동 바인딩보다 잘 확장됨',
          'cmp.rp.guide.loser2':
              '📡 고도화된 비동기 데이터 쿼리 시스템 — 서버 데이터 캐싱, 리프레시 갱신 및 백그라운드 재호출이 아키텍처의 절대 다수인 경우',
          'cmp.rp.guide.loser3':
              '🔒 극도로 엄격한 상태 변화 제약 — 상태 변경을 정해진 비즈니스 메서드로만 일괄 제약하고 감시하려는 구조',
          'cmp.rp.guide.loser4':
              '🏗️ 5년 이상의 장기 유지보수 서비스 — 자동 코드 생성이 주는 강력한 정적 리스크 최소화 역량의 이점이 장벽보다 커지는 프로젝트',

          // ── Comparison — Conclusion ──
          'cmp.con.title': '비교 분석 종합 결론',
          'cmp.con.card0.quote':
              'getx_distil은 기존 GetX의 불필요한 "군더더기"를 정교하게 도려내고 핵심 "원석"만을 강화하는 데 완벽하게 성공했습니다.',
          'cmp.con.card0.p0':
              'GetX가 모든 기능이 종합된 "종합 프레임워크"였다면 getx_distil은 날렵하게 튜닝된 "마이크로 엔진"입니다. 라우팅, 오버레이, 네트워크 및 로컬 스토리지를 미련 없이 제거하고 오직 상태 관리와 의존성 주입에 초점을 맞춰 현대 Flutter 생태계(GoRouter, dio, shared_preferences 등)와의 결합도를 완벽한 수준으로 끌어올렸습니다.',
          'cmp.con.card0.p1':
              'RxList 마이크로태스크 배치와 위젯 트리 스코프 DI(BindingWidget)는 원본 대비 검증 가능한 명확한 개선이며, RxSList/RxS는 독창적 기여입니다. Fast-Path Tracking은 건전한 설계이지만 GetX 4.x의 정적 프록시와 비교하면 측정 가능한 이득은 작습니다.',
          'cmp.con.card0.p2':
              '기존 GetX 유저에게는 친숙한 문법 그대로 제공하며 의존성 누수를 잡고, 신규 프로젝트에는 GoRouter 시대를 여는 고효율 엔진을 공급한다는 측면에서 원조 패키지보다 압도적인 경쟁 우위를 점합니다.',
          'cmp.con.card1.quote':
              'getx_distil과 Riverpod 3.x은 경쟁 관계라기보다 상호보완 관계에 가깝습니다.',
          'cmp.con.card1.p0':
              'getx_distil은 "최소한의 코드로 가장 빠르고 자유롭게"를 추구하는 라이트웨이트 엔진이며, Riverpod 3.x은 "정적 타입을 통해 엄격하게 실수를 방지하는" 구조 지향형 프레임워크입니다.',
          'cmp.con.card1.p1':
              'RxList 마이크로태스크 배치와 빌드 단계 자동 보정은 Riverpod에 대응물이 없어, 변경 빈도가 매우 높은 페이지에서는 getx_distil이 더 관대합니다. Riverpod은 관용구를 지켜 작성해야 비슷한 효율에 도달합니다.',
          'cmp.con.card1.p2':
              '반면 Riverpod 3.x은 코드 생성이 주는 컴파일 타임 검증성과 탄탄한 비동기 프로바이더가 거대한 엔터프라이즈 프로젝트에서 진가를 발휘하게 돕습니다. 프로젝트 예산 규모, 구성원의 기술적 성숙도, 처리해야 할 실시간 연산량 등에 맞춰 최적의 솔루션을 선택하는 것이 현명합니다.',
          'cmp.con.footer': '개정일: 2026-09-07\n분석 대상 버전: getx_distil 1.3.2 · GetX 4.7.3 · flutter_riverpod 3.4.3',
        },
      };
}

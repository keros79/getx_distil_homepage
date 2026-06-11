import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';

import '../core/app_theme.dart';

class ComparisonController extends GetxController {
  late final ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  // Helper methods for section meta
  Map<String, dynamic> _ok(String text) => {'type': 'success', 'text': text};
  Map<String, dynamic> _del(String text) => {'type': 'delete', 'text': text};
  List<dynamic> _row(List<dynamic> cells) => cells;

  // Metadata map as an instance variable
  late final Map<String, Map<String, dynamic>> sectionMeta = {
    // ── Overview ──
    'overview': {
      'type': 'overview',
      'title': 'Comprehensive Evaluation & Comparison',
      'infoBadges': [
        'Target version: getx_distil v1.1.3',
        'Compared with: GetX (pub.dev/packages/get), Riverpod 3.0',
      ],
      'sectionTitle': '1. getx_distil Project Overview',
      'tableHeaders': ['Category', 'getx_distil', 'GetX'],
      'tableRows': [
        _row(['Version', '1.1.3 (Stable)', '4.6.6']),
        _row(['SDK', 'Dart ^3.12.0', 'Dart >=2.14.0']),
        _row([
          'External Dependencies',
          '0 (Flutter SDK only)',
          'Dozens (collection, web, js, etc.)'
        ]),
        _row(['Source Files', '15', '100+']),
        _row(['Core Logic', '~1,200 lines', '~15,000+ lines']),
        _row([
          'Routing',
          _del('❌ Removed'),
          _ok('✅ Built-in (GetPageRoute, etc.)')
        ]),
        _row(['Internationalization', _ok('✅ Kept (simplified)'), _ok('✅ Kept')]),
        _row(['State Management', _ok('✅ Core enhanced'), _ok('✅ Basic')]),
        _row(['DI', _ok('✅ Hybrid (tree+global)'), _ok('✅ Global-centric')]),
      ],
      'nextSection': 'improvements',
      'nextTitle': '2. Key Improvements over GetX',
    },

    // ── Improvements ──
    'improvements': {
      'type': 'improvements',
      'title': 'Key Improvements over GetX',
      'items': [
        {
          'number': '2.1',
          'title': 'Fast-Path Tracking (Notifier.isTracking)',
          'subtitle': 'Most important performance improvement',
          'tableHeaders': ['Category', 'GetX', 'getx_distil'],
          'tableRows': [
            _row([
              'Approach',
              'Zone-based global proxy (RxInterface.proxy)',
              _ok('Static boolean flag (Notifier.isTracking)')
            ]),
            _row([
              'Rx reads outside Obx',
              'Proxy lookup + null check every time',
              _ok('Bypassed entirely (O(1) bool check)')
            ]),
            _row([
              'Large data iteration',
              'CPU overhead accumulates',
              _ok('Zero-cost')
            ]),
          ],
          'code':
              '// getx_distil - reportRead()\nvoid reportRead() {\n  if (Notifier.isTracking) {  // ← simple bool check\n    Notifier.instance.read(this);\n  }\n}',
          'evaluation':
              'Dramatically lighter than the Zone-based approach, with substantial CPU cycle savings during large data operations. Excellent design.',
        },
        {
          'number': '2.2',
          'title': 'Self-Healing Build-Phase Updates',
          'subtitle': 'Prevents crashes during build/layout phase',
          'tableHeaders': ['Category', 'GetX', 'getx_distil'],
          'tableRows': [
            _row([
              'State change during build',
              _del('setState() during build crash'),
              _ok('Safely deferred via PostFrameCallback')
            ]),
            _row([
              'Detection method',
              'None',
              _ok('SchedulerBinding.instance.schedulerPhase check')
            ]),
          ],
          'code':
              'void refresh() {\n  final phase = SchedulerBinding.instance.schedulerPhase;\n  if (phase == SchedulerPhase.persistentCallbacks || \n      phase == SchedulerPhase.midFrameMicrotasks) {\n    scheduler.addPostFrameCallback((_) { /* safe update */ });\n  } else {\n    /* immediate update */\n  }\n}',
          'evaluation':
              'Prevents crashes that frequently occur in production. Very high practical value.',
        },
        {
          'number': '2.3',
          'title': 'RxList Microtask Batching',
          'subtitle': 'Key performance differentiator',
          'tableHeaders': ['Category', 'GetX', 'getx_distil'],
          'tableRows': [
            _row(['100 add() calls', '100 rebuilds', _ok('1 rebuild')]),
            _row([
              'Approach',
              'Immediate refresh() on each mutation',
              _ok('Dirty-Flag + Microtask pipeline')
            ]),
            _row([
              'sort() / shuffle()',
              'N notifications (ListMixin default)',
              _ok('1 notification (overridden)')
            ]),
          ],
          'code':
              'void _autoBatchRefresh() {\n  if (_isNotificationScheduled) return;  // ← drop-path\n  _isNotificationScheduled = true;\n  scheduleMicrotask(() {\n    refresh();\n    notifyStream();\n    _isNotificationScheduled = false;\n  });\n}',
          'evaluation':
              'When adding 10,000 items to a list, the original triggers 10,000 rebuilds → getx_distil triggers 1 rebuild. The most tangible performance difference.',
        },
        {
          'number': '2.4',
          'title': '100% Tree-Scoped DI (BindingWidget)',
          'subtitle': 'Architecture paradigm shift',
          'tableHeaders': ['Category', 'GetX', 'getx_distil'],
          'tableRows': [
            _row([
              'DI Scope',
              'Global singleton-centric',
              _ok('Widget tree scope + global hybrid')
            ]),
            _row([
              'Same-type multi-instance',
              'Collision',
              _ok('Complete isolation')
            ]),
            _row([
              'Lifecycle management',
              'Manual Get.delete()',
              _ok('Auto GC on widget dispose')
            ]),
            _row(['GoRouter compatibility', 'Low', _ok('Fully compatible')]),
            _row([
              'Context-free access',
              'Get.find<T>()',
              _ok('Get.find<T>() (WeakReference cache)')
            ]),
          ],
          'code':
              'GoRoute(\n  path: \'/settings\',\n  builder: (context, state) => BindingWidget(\n    bindings: [Bind<SettingsController>(() => SettingsController())],\n    child: const SettingsPage(),\n  ),\n)',
          'evaluation':
              'A design that perfectly aligns with the GoRouter era. Solves GetX\'s biggest architectural flaw — a key differentiator.',
        },
        {
          'number': '2.5',
          'title': 'FIFO Sequential Pipeline (updateSequential)',
          'subtitle': 'Prevents race conditions in high-frequency async',
          'tableHeaders': ['Category', 'GetX', 'getx_distil'],
          'tableRows': [
            _row([
              'Async update order',
              'Not guaranteed (race conditions)',
              _ok('Strict FIFO sequential execution')
            ]),
            _row(['Approach', 'None', _ok('Completer chain')]),
          ],
          'code':
              'Future<void> updateSequential(Future<T> Function(T currentValue) action) {\n  final completer = Completer<void>();\n  _lastUpdateFuture = _lastUpdateFuture.then((_) async {\n    final newValue = await action(value);\n    value = newValue;\n    completer.complete();\n  });\n  return completer.future;\n}',
          'evaluation':
              'Essential for high-frequency scenarios like real-time quotes, chat, and sensor data. High practical value.',
        },
        {
          'number': '2.6',
          'title': 'RxSList / RxS — Status-Aware Reactive Types',
          'subtitle': 'Unique feature (not in original)',
          'tableHeaders': ['Category', 'GetX', 'getx_distil'],
          'tableRows': [
            _row([
              'List status management',
              'Separate isLoading/errorMessage observables needed',
              _ok('Built into the list itself')
            ]),
            _row([
              'Single value status',
              'StateMixin (controller level)',
              _ok('Built into the value (RxS)')
            ]),
            _row([
              'UI branching',
              'Manual if-else',
              _ok('Declarative via .on() builder')
            ]),
          ],
          'code':
              'Obx(() => items.on(\n  loading: () => const CircularProgressIndicator(),\n  loaded:  (data) => ListView.builder(...),\n  empty:   () => const Text(\'No items\'),\n  error:   (msg) => Text(\'Error: \$msg\'),\n));',
          'evaluation':
              'A DX innovation that eliminates the need for separate isLoading/errorMessage observables. An original contribution not found in the original.',
        },
        {
          'number': '2.7',
          'title': 'Strict Async Obx Validation',
          'subtitle': 'Blocks async Obx anti-patterns',
          'tableHeaders': ['Category', 'GetX', 'getx_distil'],
          'tableRows': [
            _row([
              'async/await inside Obx',
              'Silent misbehavior',
              _ok('Immediate FlutterError throw')
            ]),
            _row([
              'Rx not detected',
              'Exception thrown',
              _ok('debugPrint warning (v1.0.3+)')
            ]),
          ],
          'evaluation':
              'A safety net that significantly reduces debugging time. Also ensures production stability.',
        },
        {
          'number': '2.8',
          'title': 'High-Visibility DI Debugging',
          'subtitle': 'Detailed debug info on DI lookup failure',
          'tableHeaders': ['Category', 'GetX', 'getx_distil'],
          'tableRows': [
            _row([
              'Error message',
              '"Controller not found"',
              _ok('Requested widget name + ancestor path + global/immortal service list')
            ]),
          ],
          'code':
              '📍 Requested Context Widget: Builder\n🌳 Search Path (Ancestor Widgets):\n   Builder -> Column -> Scaffold -> ...\n🌐 Registered Global Services:\n   CounterController, AuthService\n🌟 Registered Immortal Services:\n   DatabaseService',
          'evaluation':
              'Dramatically reduces time to diagnose DI issues. A decisive DX improvement.',
        },
      ],
      'nextSection': 'sacrificed',
      'nextTitle': '3. Features Sacrificed vs GetX',
    },

    // ── Sacrificed ──
    'sacrificed': {
      'type': 'sacrificed',
      'title': 'Features Sacrificed vs GetX',
      'tableHeaders': ['Feature', 'GetX', 'getx_distil', 'Impact'],
      'tableRows': [
        _row([
          'Routing Engine',
          'GetPageRoute, Get.to(), Get.off(), etc.',
          _del('❌ Removed'),
          'Use GoRouter/Navigator'
        ]),
        _row([
          'GetDialog/BottomSheet',
          'Global overlay management',
          _del('❌ Removed'),
          'Use Flutter default APIs'
        ]),
        _row([
          'GetConnect',
          'Built-in HTTP client',
          _del('❌ Removed'),
          'Use dio/http package'
        ]),
        _row([
          'GetStorage',
          'Local storage',
          _del('❌ Removed'),
          'Use shared_preferences, etc.'
        ]),
        _row([
          'GetUtils',
          'Utility functions',
          _del('❌ Removed'),
          'Use standard Dart/Flutter APIs'
        ]),
        _row([
          'GetX Binding (class)',
          'GetPage + Binding pattern',
          _del('❌ Removed'),
          'Replaced by BindingWidget'
        ]),
        _row([
          'interval Worker',
          'Periodic execution worker',
          _del('❌ Removed'),
          'Use Timer'
        ]),
        _row([
          'SmartManagement',
          'Memory management policy',
          _del('❌ Removed'),
          'Replaced by BindingWidget Auto-GC'
        ]),
      ],
      'infoCard':
          'Removing routing/dialogs/network/storage is an intentional design decision that aligns well with the modern Flutter ecosystem. Delegating each responsibility to specialized packages results in better architecture.',
      'nextSection': 'quality',
      'nextTitle': '4. Code Quality Assessment',
    },

    // ── Quality ──
    'quality': {
      'type': 'quality',
      'title': 'Code Quality Assessment',
      'goodPoints': [
        'Extreme conciseness — core logic at ~1,200 lines, less than 10% of the original. Overwhelming maintainability.',
        'Zero External Dependency — depends only on Flutter SDK. Zero supply chain risk.',
        'Thorough testing — 1,594 lines of test code. Covers edge cases like RxList batching, WeakReference zombie prevention, sibling controller onClose cross-references.',
        'Consistent architecture — all Rx types follow GetListenable → RxInterface hierarchy. Excellent extensibility.',
        'Memory safety — WeakReference cache, guaranteed dispose order (onDelete first → weakRegistry removal), Expando-based GetView context management.',
        'Documentation quality — English/Korean README perfectly synchronized. Example app covers all features.',
      ],
      'improvePoints': [
        'GetxController.update() + ID-based rebuild not supported — ID-based partial rebuild used with GetBuilder in the original is weakened.',
        'RxSList initial status ambiguity — even with data in the constructor, initial status is loading. An option to start as loaded would be nice.',
        'interval Worker not supported — no periodic execution worker, must use Timer instead.',
        'Get.find tag + context combination not possible — when context is provided, tag is ignored.',
        'RxList operator []= override — custom list operations may trigger notifications without batching.',
      ],
      'scores': [
        {
          'item': 'Architecture Design',
          'score': '⭐⭐⭐⭐⭐',
          'note': 'Tree-scoped DI + hybrid fallback is best practice'
        },
        {
          'item': 'Performance Optimization',
          'score': '⭐⭐⭐⭐⭐',
          'note': 'Fast-Path + Batching + FIFO pipeline triple combo'
        },
        {
          'item': 'Memory Safety',
          'score': '⭐⭐⭐⭐⭐',
          'note': 'WeakReference, guaranteed dispose order, Expando cleanup'
        },
        {
          'item': 'DX (Developer Experience)',
          'score': '⭐⭐⭐⭐½',
          'note': 'RxSList/RxS .on() pattern is excellent. Great debug messages'
        },
        {
          'item': 'API Compatibility',
          'score': '⭐⭐⭐⭐',
          'note': 'Core APIs like .obs, Obx, Get.find are identical'
        },
        {
          'item': 'Test Coverage',
          'score': '⭐⭐⭐⭐',
          'note': 'Core features well covered. Some edge cases could be improved'
        },
        {
          'item': 'Documentation/Examples',
          'score': '⭐⭐⭐⭐⭐',
          'note': 'English/Korean README + GoRouter-based example app is perfect'
        },
        {
          'item': 'Ecosystem Compatibility',
          'score': '⭐⭐⭐⭐',
          'note':
              'GoRouter-friendly. Existing GetX projects need routing migration'
        },
      ],
      'nextSection': 'riverpod',
      'nextTitle': '5. getx_distil vs Riverpod 3.0',
    },

    // ── Riverpod ──
    'riverpod': {
      'type': 'riverpod',
      'title': 'getx_distil vs Riverpod 3.0',
      'subsections': [
        {
          'subtype': 'table',
          'number': '5.1',
          'title': 'Philosophical Differences',
          'tableHeaders': ['Dimension', 'getx_distil', 'Riverpod 3.0'],
          'tableRows': [
            _row(['Paradigm', 'Imperative', 'Declarative']),
            _row([
              'State Creation',
              'Runtime new + .obs',
              'Compile-time code generation'
            ]),
            _row([
              'DI Approach',
              'Manual registration (Get.put, BindingWidget)',
              'Auto registration (@riverpod annotation)'
            ]),
            _row([
              'Learning Curve',
              _ok('Low (same as GetX)'),
              'High (Provider, Notifier, AsyncNotifier, etc.)'
            ]),
            _row([
              'Boilerplate',
              _ok('Minimal (.obs one-liner)'),
              'Medium~High (annotation + generated code)'
            ]),
            _row(['Build Dependency', _ok('None'), 'build_runner required']),
          ],
          'evaluation':
              'getx_distil\'s imperative paradigm offers a low learning curve and minimal boilerplate for rapid development. Riverpod 3.0\'s declarative approach is systematic but requires more learning and setup.',
        },
        {
          'subtype': 'codeCompare',
          'number': '5.2',
          'title': 'State Management Approach',
          'description': 'getx_distil — Imperative Observable',
          'code1':
              '// Inside controller\nfinal count = 0.obs;           // RxInt\nfinal items = <String>[].ops;  // RxSList\n\n// Value change\ncount.value++;\nitems.add(\'new item\');\n\n// UI\nObx(() => Text(\'\${controller.count.value}\'))',
          'description2': 'Riverpod 3.0 — Declarative Notifier',
          'code2':
              '@riverpod\nclass Counter extends _\$Counter {\n  @override\n  int build() => 0;\n  void increment() => state++;\n}\n\n// UI\nConsumerWidget: ref.watch(counterProvider)',
          'tableHeaders': ['Comparison', 'getx_distil', 'Riverpod 3.0'],
          'tableRows': [
            _row([
              'State Declaration',
              '.obs one-liner',
              'Class + annotation + build()'
            ]),
            _row([
              'State Mutation',
              '.value = direct assignment',
              'Method call to change state'
            ]),
            _row([
              'Reactive Registration',
              'Automatic (tracked on read)',
              'Automatic (tracked via ref.watch)'
            ]),
            _row(['Nullable State', 'Rxn<T>', 'AsyncValue<T>']),
            _row(['Code Volume', _ok('~3 lines'), '~8 lines']),
          ],
          'evaluation':
              'For simple state management, getx_distil\'s DX is overwhelmingly concise. Riverpod requires explicit state mutation methods, which is an advantage for traceability of state change paths.',
        },
        {
          'subtype': 'codeCompare',
          'number': '5.3',
          'title': 'Async State Management',
          'description': 'getx_distil — RxSList / RxS',
          'code1':
              'final items = <User>[].ops; // RxSList<User>\n\n// Manual state transition\nitems.assignAll(fetchedUsers);     // status → loaded\nitems.error = \'Network failure\';\nitems.status = RxListStatus.error;\n\n// UI\nObx(() => items.on(\n  loading: () => CircularProgressIndicator(),\n  loaded:  (data) => ListView.builder(...),\n  error:   (msg) => Text(\'Error: \$msg\'),\n))',
          'description2': 'Riverpod 3.0 — AsyncNotifier + AsyncValue',
          'code2':
              '@riverpod\nclass Users extends _\$Users {\n  @override\n  FutureOr<List<User>> build() => _fetchUsers();\n\n  Future<void> refresh() async {\n    state = const AsyncLoading();\n    state = await AsyncValue.guard(() => _fetchUsers());\n  }\n}\n\n// UI\nref.watch(usersProvider).when(\n  loading: () => CircularProgressIndicator(),\n  data:    (users) => ListView.builder(...),\n  error:   (err, _) => Text(\'Error: \$err\'),\n)',
          'tableHeaders': ['Comparison', 'getx_distil', 'Riverpod 3.0'],
          'tableRows': [
            _row([
              'Async State Expression',
              'RxSList / RxS (manual state transition)',
              'AsyncValue<T> (automatic state management)'
            ]),
            _row([
              'Loading→Data Transition',
              'Manual assignAll()',
              'Automatic (on Future completion)'
            ]),
            _row([
              'Error Handling',
              'Manual error + status',
              'Automatic (AsyncValue.guard)'
            ]),
            _row([
              'Caching/Retry',
              'Manual implementation',
              'Built-in (keepAlive, retry, invalidate)'
            ]),
            _row([
              'DX',
              'Intuitive but manual',
              'Automated but requires learning'
            ]),
          ],
          'evaluation':
              'For pure async API call scenarios, Riverpod 3.0\'s AsyncNotifier is safer and more automated. getx_distil requires manual state transition control, but offers greater flexibility.',
        },
        {
          'subtype': 'codeCompare',
          'number': '5.4',
          'title': 'DI (Dependency Injection)',
          'description': 'getx_distil — Hybrid DI',
          'code1':
              '// Tree scope\nBindingWidget(\n  bindings: [Bind<Controller>(() => Controller())],\n  child: const MyPage(),\n)\n\n// Global\nGet.put<Controller>(Controller());\n\n// Lookup\nGet.find<Controller>(context);  // scope first → global fallback\nGet.find<Controller>();         // global + WeakReference fallback',
          'description2': 'Riverpod 3.0 — Provider Scope',
          'code2':
              '// Declarative registration (auto via @riverpod annotation)\n@riverpod\nclass Controller extends _\$Controller {\n  @override\n  void build() { ... }\n}\n\n// Lookup\nref.read(controllerProvider);                              // one-time read\nref.watch(controllerProvider);                             // reactive subscription\nref.watch(controllerProvider.select((s) => s.count));      // selective subscription',
          'tableHeaders': ['Comparison', 'getx_distil', 'Riverpod 3.0'],
          'tableRows': [
            _row([
              'Registration',
              'Manual (Get.put, BindingWidget)',
              'Automatic (annotation + code generation)'
            ]),
            _row([
              'Scope',
              'Widget tree scope + global',
              'Provider scope (overridable)'
            ]),
            _row([
              'Dynamic Multi-instance',
              _ok('Natural via BindingWidget nesting'),
              'family modifier (compile-time)'
            ]),
            _row([
              'Context-free Access',
              _ok('✅ Get.find<T>()'),
              '❌ ref required (only inside widgets/functions)'
            ]),
            _row([
              'Lifecycle Management',
              'Auto GC on widget dispose',
              'ref.onDispose() callback'
            ]),
            _row([
              'Multi-instance Isolation',
              _ok('Intuitive (BindingWidget nesting)'),
              'Strict (family + override)'
            ]),
          ],
          'evaluation':
              'Context-free access is a clear advantage of getx_distil. No ref needed when referencing other controllers inside a controller. Riverpod\'s family is type-safe at compile-time, but getx_distil\'s BindingWidget is more flexible for patterns that dynamically create N instances at runtime.',
        },
        {
          'subtype': 'table',
          'number': '5.5',
          'title': 'Performance',
          'subtitle': 'RxList bulk mutation',
          'tableHeaders': ['Scenario', 'getx_distil', 'Riverpod 3.0'],
          'tableRows': [
            _row([
              '10,000 add() calls',
              _ok('1 rebuild (Microtask Batching)'),
              'N rebuilds (per state change)'
            ]),
            _row([
              'for loop mutations',
              _ok('Automatic batching'),
              'Manual batching needed or single state = [...] assignment'
            ]),
            _row([
              'Rx reads outside Obx',
              _ok('Zero-cost (isTracking flag)'),
              'N/A (Provider reads always need ref)'
            ]),
          ],
          'evaluation':
              'In high-frequency list mutation scenarios, getx_distil\'s Microtask Batching has a clear performance advantage over Riverpod. To achieve the same effect in Riverpod, developers must implement batching logic manually or use single state = newList assignment.',
        },
        {
          'subtype': 'table',
          'number': '5.6',
          'title': 'Safety Features',
          'tableHeaders': ['Safety Feature', 'getx_distil', 'Riverpod 3.0'],
          'tableRows': [
            _row([
              'Build-phase state mutation',
              _ok('Self-healing (PostFrameCallback deferral)'),
              'N/A (only ref.watch allowed during build)'
            ]),
            _row([
              'Ref.watch during build',
              'N/A',
              _ok('Strict runtime check')
            ]),
            _row([
              'Async Obx validation',
              _ok('Strict blocking (FlutterError)'),
              'N/A (AsyncNotifier is separate)'
            ]),
            _row([
              'DI lookup failure message',
              _ok('Detailed debug report'),
              'ProviderNotFoundException'
            ]),
            _row([
              'Race condition prevention',
              _ok('FIFO pipeline (updateSequential)'),
              'N/A (no sequential execution guarantee)'
            ]),
            _row([
              'Type Safety',
              'Runtime (dynamic Get.find<T>())',
              _ok('Compile-time (code generation)')
            ]),
          ],
          'evaluation':
              'getx_distil has richer runtime safety nets. Compile-time type safety is Riverpod 3.0\'s overwhelming advantage.',
        },
        {
          'subtype': 'table',
          'number': '5.7',
          'title': 'Code Generation vs Zero Dependency',
          'tableHeaders': ['Category', 'getx_distil', 'Riverpod 3.0'],
          'tableRows': [
            _row(['build_runner needed', _ok('❌'), _ok('✅ (required)')]),
            _row(['Generated code (.g.dart)', 'None', 'Yes']),
            _row([
              'Build time impact',
              _ok('None'),
              'Increases (code generation overhead)'
            ]),
            _row([
              'IDE Support',
              'Standard Dart analysis',
              'Generated code exploration needed'
            ]),
            _row([
              'CI/CD Complexity',
              _ok('Low'),
              'High (build_runner step added)'
            ]),
            _row([
              'External Dependencies',
              _ok('0'),
              'Multiple (riverpod, riverpod_annotation, build_runner, etc.)'
            ]),
          ],
          'evaluation':
              'For small/personal projects, getx_distil\'s zero dependency is a strong advantage. For large team projects, Riverpod\'s code generation provides refactoring safety.',
        },
        {
          'subtype': 'table',
          'number': '5.8',
          'title': 'Testability',
          'tableHeaders': ['Category', 'getx_distil', 'Riverpod 3.0'],
          'tableRows': [
            _row([
              'Unit Testing',
              'Get.put(mock) → Get.find()',
              'ProviderContainer(overrides: [...])'
            ]),
            _row([
              'Widget Testing',
              'Scope control via BindingWidget',
              'ProviderScope(overrides: [...])'
            ]),
            _row([
              'Mocking Convenience',
              'Moderate (manual registration/replacement)',
              _ok('Excellent (systematic override system)')
            ]),
            _row([
              'Test Isolation',
              'Manual Get.reset() call',
              _ok('Automatic ProviderContainer isolation')
            ]),
          ],
          'evaluation':
              'Riverpod 3.0\'s override system is more systematic for test mocking. getx_distil is intuitive but has potential for global state pollution.',
        },
      ],
      'matrix': [
        {'item': 'Learning Curve', 'g': 5, 'r': 3},
        {'item': 'Boilerplate', 'g': 5, 'r': 3},
        {'item': 'Compile-time Safety', 'g': 3, 'r': 5},
        {'item': 'Async State Automation', 'g': 4, 'r': 5},
        {'item': 'List Bulk Mutation Performance', 'g': 5, 'r': 3},
        {'item': 'DI Flexibility', 'g': 5, 'r': 4},
        {'item': 'Context-free Access', 'g': 5, 'r': 2},
        {'item': 'Test/Mocking System', 'g': 4, 'r': 5},
        {'item': 'Build Complexity', 'g': 5, 'r': 3},
        {'item': 'Refactoring Safety', 'g': 3, 'r': 5},
        {'item': 'Memory Management Precision', 'g': 4, 'r': 5},
        {'item': 'Runtime Safety Nets', 'g': 5, 'r': 3},
        {'item': 'External Dependencies', 'g': 5, 'r': 3},
        {'item': 'i18n/Theming', 'g': 4, 'r': 2},
      ],
      'guide': {
        'winnerTitle': 'When to choose getx_distil',
        'winnerIcon': Icons.electric_bolt_rounded,
        'winnerColor': AppTheme.googleBlue,
        'winnerItems': [
          '🚀 Rapid Prototyping / MVP — minimal boilerplate, start immediately',
          '📱 Small~Medium Apps — no complex architecture overhead needed',
          '🔄 GoRouter-based Routing — fully compatible with BindingWidget',
          '📊 Heavy List Manipulation — RxList batching is essential for data-heavy apps',
          '🧑‍💻 GetX Users — same DX, minimal migration cost',
          '⚡ Build Time Sensitive — develop immediately without build_runner'
        ],
        'loserTitle': 'When to choose Riverpod 3.0',
        'loserIcon': Icons.verified_rounded,
        'loserColor': AppTheme.googleGreen,
        'loserItems': [
          '🏢 Large Team Projects — compile-time safety protects refactoring',
          '🧪 Test-Driven Development (TDD) — override system is optimal for mocking',
          '📡 Async-centric Apps — API calls/caching/retry are core features',
          '🔒 Strict State Management — explicitly control state mutation paths',
          '🏗️ Long-term Maintenance — code generation provides refactoring safety net'
        ],
      },
      'nextSection': 'conclusion',
      'nextTitle': '6. Conclusion',
    },

    // ── Conclusion ──
    'conclusion': {
      'type': 'conclusion',
      'title': 'Conclusion',
      'cards': [
        {
          'icon': Icons.compare_arrows_rounded,
          'color': AppTheme.googleBlue,
          'cardTitle': 'getx_distil vs GetX',
          'quote':
              'getx_distil succeeds in precisely removing GetX\'s "excess" while refining its "core."',
          'paragraphs': [
            'If GetX is a "framework," getx_distil is a "micro-engine." The design decision to boldly remove routing, dialogs, networking, and storage — focusing solely on state management and DI — perfectly aligns with the modern Flutter ecosystem (GoRouter, dio, shared_preferences, etc.).',
            'In particular, Fast-Path Tracking, RxList Microtask Batching, and Tree-Scoped DI provide clear, measurable performance/stability advantages over the original, while RxSList/RxS are original contributions not found in the original.',
            'For existing GetX users, it provides the same DX (.obs → Obx → Get.find) while fundamentally solving memory leak and scope collision issues in GoRouter environments. For new projects, it has a clear advantage over the original GetX.',
          ],
        },
        {
          'icon': Icons.swap_horiz_rounded,
          'color': AppTheme.googleGreen,
          'cardTitle': 'getx_distil vs Riverpod 3.0',
          'quote':
              'getx_distil and Riverpod 3.0 are complementary rather than competitive.',
          'paragraphs': [
            'getx_distil is a lightweight engine optimized for "fastest with least code." Riverpod 3.0 is a framework optimized for "safest, most systematic."',
            'getx_distil\'s RxList batching, Fast-Path Tracking, and Self-Healing Build-Phase are unique optimizations not found in Riverpod, with a clear performance advantage especially in high-frequency data manipulation scenarios.',
            'On the other hand, Riverpod 3.0\'s compile-time type safety and systematic async state management shine in large-scale projects. Choose based on project scale, team maturity, and data manipulation patterns.',
          ],
        },
      ],
      'footerText': 'Written: 2026-06-10\nTarget version: getx_distil v1.1.3',
    },
  };
}

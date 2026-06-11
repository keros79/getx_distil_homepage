import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_distil/get.dart';

import '../core/app_theme.dart';

class ApiDetailController extends GetxController
    with StateMixin<Map<String, String>> {
  final ScrollController scrollController = ScrollController();

  late final Map<String, Map<String, dynamic>> sectionMeta = {
    'reactive-state': {
      'title': 'Reactive State (Rx & Obx)',
      'codeKey': 'reactive_state',
      'description':
          'Pinpoint reactive updates without boilerplate. Bind view leaf widgets to target properties and let getx_distil handle efficient rebuilds automatically.',
      'points': [
        'Self-Healing Updates: Defers layout-phase updates post-frame to prevent setState() crashes.',
        'Strict Validation: Detects unsafe async await loops inside Obx and triggers helpful debugging exceptions.',
        'Fast-Path Evaluation: Bypasses proxy overhead lookup when tracking is idle, maximizing computation speed.',
        'Batched Mutations: Groups updates dynamically inside loops, triggering single-microtask UI updates.',
      ],
      'next': 'rxs',
      'nextTitle': 'Status-Aware Observables',
      'color': AppTheme.googleBlue,
    },
    'rxs': {
      'title': 'Status-Aware Observables (RxSList & RxS)',
      'codeKey': 'rxs',
      'description':
          'Simplify async state lifecycle handling. RxSList and RxS bundle loading, loaded, empty, and error states directly with state mutations, eliminating extra boilerplate flags.',
      'points': [
        '1. RxSList (Reactive List): Extends RxList to auto-sync status (loading, loaded, empty) with mutations like add, assignAll, and clear.',
        '2. RxS (Reactive Value): Extends Rxn to carry async status (loading, loaded, error) for single-object models like user profiles.',
        'Declarative UI Binding: Use the on() builder inside Obx to write clean layout branches for different async states.',
        'Resilient Data Retention: Assigning error preserves existing data underneath, allowing retry options without visual flickers.',
      ],
      'next': 'global-di',
      'nextTitle': 'Global Dependency Injection',
      'color': AppTheme.googleBlue,
    },
    'global-di': {
      'title': 'Global Dependency Injection',
      'codeKey': 'global_di',
      'description':
          'Instantiate or lazily register controllers globally. Retrieve singletons securely from anywhere in your business logic without needing contexts.',
      'points': [
        'Context-less Access: Fetch controllers easily using Get.find<T>() inside static logic threads.',
        'Tag Namespace support: Tag classes to register multiple parallel class instances.',
        'Hybrid Resolver pipeline: Prioritizes local BindingWidget scopes before searching global registry maps.',
      ],
      'next': 'binding-widget',
      'nextTitle': 'Widget Tree Scoped DI',
      'color': AppTheme.googleGreen,
    },
    'binding-widget': {
      'title': 'Widget Tree Scoped DI',
      'codeKey': 'binding_widget',
      'description':
          'Scope controller lifecycles directly to widget subtrees. Automates garbage collection and prevents instances from leaking across multi-page configurations.',
      'points': [
        '100% Tree-Scoped DI: Binds controller instances to widget elements.',
        'Automatic GC: Unregisters and disposes controllers automatically when the view unmounts.',
        'Declarative Routes alignment: Ideal for GoRouter or navigator subtrees to ensure isolation.',
      ],
      'next': 'getx-service',
      'nextTitle': 'Global Persistent Services',
      'color': AppTheme.googleRed,
    },
    'getx-service': {
      'title': 'Global Persistent Services',
      'codeKey': 'getx_service',
      'description':
          'Define permanent singletons (GetxService) that must remain active across the entire application lifecycle (Databases, Auth Managers, etc.).',
      'points': [
        'Immortal Singletons: Remains resident in memory and ignores standard controller garbage-collection.',
        'Infrastructure Layers: Designed specifically for configurations, storage wrappers, and network layers.',
        'Sequential Init: Allows bootstrapping setup routines synchronously during application start.',
      ],
      'next': 'worker',
      'nextTitle': 'Background Side-Effects',
      'color': AppTheme.googleYellow,
    },
    'worker': {
      'title': 'Background Side-Effects',
      'codeKey': 'worker',
      'description':
          'Monitor reactive variables and trigger callbacks. Perfect for rate-limiting, background sync processes, and input searches.',
      'points': [
        'Debounce Workers: Throttle rapid user typing interactions before querying API controllers.',
        'Safe Auto-Disposal: Enforces explicit Worker.dispose() routines to avoid background memory leaks.',
        'Clean Lifecycle hooks: Declare inside onInit() and unregister inside onClose() triggers.',
      ],
      'next': 'state-mixin',
      'nextTitle': 'Declarative Async Branching',
      'color': AppTheme.googleBlue,
    },
    'state-mixin': {
      'title': 'Declarative Async Branching',
      'codeKey': 'state_mixin',
      'description':
          'Eradicate nested conditional checks. Map typical loading, success, empty, and network error layout screens cleanly.',
      'points': [
        'Declarative UI branch parsing: obx() builder matches typical request lifecycle states.',
        'Built-in Status tags: loading, success, empty, error (with parameters support).',
        'Minimal boilerplate: Eliminates nested if-else checks inside build routines.',
      ],
      'next': 'i18n',
      'nextTitle': 'Reactive Localization',
      'color': AppTheme.googleGreen,
    },
    'i18n': {
      'title': 'Reactive Localization',
      'codeKey': 'i18n',
      'description':
          'Swap languages on-the-fly reactively. Distilled translation dictionary structures allow seamless localization updates.',
      'points': [
        'Dynamic runtime swap: Switch Locale maps dynamically and let target labels translate instantly.',
        'tr and trParams extension support: Dynamic parameter string injection directly in translations.',
        'Clean dictionary mapping: Structure locale keys inside a simple Translations subclass.',
      ],
      'next': 'comparison',
      'nextTitle': 'Comparison Overview',
      'color': AppTheme.googleGreen,
    },
  };

  // Keyed code samples
  final Map<String, String> _samples = {};

  @override
  void onInit() {
    super.onInit();
    loadSamples();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  Future<void> loadSamples() async {
    change(null, status: RxStatus.loading());
    try {
      final keys = [
        'reactive_state',
        'global_di',
        'binding_widget',
        'getx_service',
        'worker',
        'state_mixin',
        'i18n',
        'rxs',
      ];

      for (var key in keys) {
        try {
          final content =
              await rootBundle.loadString('assets/code_samples/$key.txt');
          _samples[key] = content;
        } catch (e) {
          // Fallback static hardcoded code in case of bundle load delays
          _samples[key] = _getFallbackCode(key);
        }
      }

      change(_samples, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  String getCode(String key) {
    return _samples[key] ?? 'Loading code snippet...';
  }

  String _getFallbackCode(String key) {
    switch (key) {
      case 'reactive_state':
        return '''
class CounterController extends GetxController {
  final count = 0.obs;
  void increment() => count.value++;
}
// View
// Option 1: Obx widget
Obx(() => Text('\${controller.count.value}'));

// Option 2: GetView widget
class CounterView extends GetView<CounterController> {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Text('\${controller.count.value}'));
  }
}''';
      case 'global_di':
        return '''
final controller = Get.put(CounterController());
final count = Get.find<CounterController>();''';
      case 'binding_widget':
        return '''
BindingWidget(
  bindings: [Bind<Controller>(() => Controller())],
  child: MyPage(),
);''';
      case 'rxs':
        return '''
// 1. RxSList (Status-Aware List)
final items = RxSList<String>();
Obx(() => items.on(
  loading: () => CircularProgressIndicator(),
  loaded: (data) => ListView(children: data.map((e) => Text(e)).toList()),
  empty: () => Text('Empty'),
  error: (err) => Text('Error: \$err'),
));

// 2. RxS (Status-Aware Value)
final user = RxS<String?>(null);
Obx(() => user.on(
  loading: () => CircularProgressIndicator(),
  loaded: (data) => Text('User: \$data'),
  error: (err) => Text('Error: \$err'),
));''';
      default:
        return '// Fallback sample code';
    }
  }
}

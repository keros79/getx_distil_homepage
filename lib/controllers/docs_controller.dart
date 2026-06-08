import 'package:flutter/services.dart';
import 'package:getx_distil/get.dart';

class DocsController extends GetxController with StateMixin<Map<String, String>> {
  // Keyed code samples
  final Map<String, String> _samples = {};

  @override
  void onInit() {
    super.onInit();
    loadSamples();
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
      ];

      for (var key in keys) {
        try {
          final content = await rootBundle.loadString('assets/code_samples/$key.txt');
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
      default:
        return '// Fallback sample code';
    }
  }
}

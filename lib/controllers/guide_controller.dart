import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_distil/get.dart';

class GuideController extends GetxController
    with StateMixin<Map<String, String>> {
  final ScrollController scrollController = ScrollController();

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
      final content =
          await rootBundle.loadString('assets/code_samples/reactive_state.txt');
      _samples['reactive_state'] = content;
      change(_samples, status: RxStatus.success());
    } catch (e) {
      _samples['reactive_state'] = _getFallbackCode();
      change(_samples, status: RxStatus.success());
    }
  }

  String _getFallbackCode() {
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
  }
}

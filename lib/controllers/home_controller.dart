import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';

class HomeController extends GetxController {
  // Real-time mini playground states
  final counter = 0.obs;
  final clicks = 0.obs;
  final textInput = 'Type something...'.obs;

  // Status-Aware states
  final demoItems = RxSList<String>();
  final rxUser = RxS<String?>(null);

  // Feature hover states
  final hoveredIndex = (-1).obs;

  late final ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  void increment() {
    counter.value++;
    clicks.value++;
  }

  void decrement() {
    if (counter.value > 0) {
      counter.value--;
    }
    clicks.value++;
  }

  void resetDemo() {
    counter.value = 0;
    clicks.value = 0;
    textInput.value = 'Type something...';
    demoItems.clear();
    demoItems.setIdle();
    rxUser.value = null;
    rxUser.setIdle();
  }

  Future<void> loadDemoList() async {
    if (demoItems.status == RxListStatus.loading) return;
    demoItems.setLoading();
    clicks.value++;
    await Future.delayed(const Duration(seconds: 2));
    demoItems.assignAll(['Apple 🍎', 'Banana 🍌', 'Orange 🍊']);
  }

  void triggerDemoListError() {
    demoItems.setError('Failed to fetch items');
    clicks.value++;
  }

  void clearDemoList() {
    demoItems.clear();
    clicks.value++;
  }

  void addPlaygroundItem() {
    // If not loaded, make sure it transitions to loaded status first
    if (demoItems.status != RxListStatus.loaded) {
      demoItems.status = RxListStatus.loaded;
    }
    demoItems.add('Item ${demoItems.length + 1}');
    clicks.value++;
  }

  Future<void> loadUser() async {
    if (rxUser.status == RxDataStatus.loading) return;
    rxUser.setLoading();
    clicks.value++;
    await Future.delayed(const Duration(seconds: 2));
    rxUser.value = 'Alice 🦄';
  }

  void triggerUserError() {
    rxUser.setError('Database timeout error');
    clicks.value++;
  }

  void resetUser() {
    rxUser.value = null;
    rxUser.setIdle();
    clicks.value++;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

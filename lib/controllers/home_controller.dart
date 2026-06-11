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
    demoItems.status = RxListStatus.loading;
    rxUser.value = null;
    rxUser.status = RxDataStatus.loading;
  }

  void loadDemoList() {
    demoItems.assignAll(['Apple 🍎', 'Banana 🍌', 'Orange 🍊']);
    clicks.value++;
  }

  void triggerDemoListError() {
    demoItems.error = 'Failed to fetch items';
    demoItems.status = RxListStatus.error;
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

  void loadUser() {
    rxUser.value = 'Alice 🦄';
    clicks.value++;
  }

  void triggerUserError() {
    rxUser.error = 'Database timeout error';
    rxUser.status = RxDataStatus.error;
    clicks.value++;
  }

  void resetUser() {
    rxUser.value = null;
    rxUser.status = RxDataStatus.loading;
    clicks.value++;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}

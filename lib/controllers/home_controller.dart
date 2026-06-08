import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';

class HomeController extends GetxController {
  // Reactive scroll offset for navbar styling
  final scrollOffset = 0.0.obs;

  // Real-time mini playground states
  final counter = 0.obs;
  final clicks = 0.obs;
  final textInput = 'Type something...'.obs;
  final demoItems = <String>[].obs;

  // Feature hover states
  final hoveredIndex = (-1).obs;

  late final ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    scrollOffset.value = scrollController.offset;
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
  }

  void addPlaygroundItem() {
    demoItems.add('Item ${demoItems.length + 1}');
    clicks.value++;
  }

  @override
  void onClose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.onClose();
  }
}

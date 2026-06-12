import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_distil/get.dart';

import '../core/app_theme.dart';

class ApiDetailController extends GetxController
    with StateMixin<Map<String, String>> {
  final ScrollController scrollController = ScrollController();

  Map<String, Map<String, dynamic>> get sectionMeta => {
        'reactive-state': {
          'title': 'api.meta.reactive_state.title'.tr,
          'codeKey': 'reactive_state',
          'description': 'api.meta.reactive_state.desc'.tr,
          'points': [
            'api.meta.reactive_state.pt0'.tr,
            'api.meta.reactive_state.pt1'.tr,
            'api.meta.reactive_state.pt2'.tr,
            'api.meta.reactive_state.pt3'.tr,
          ],
          'next': 'rxs',
          'nextTitle': 'api.meta.reactive_state.next_title'.tr,
          'color': AppTheme.googleBlue,
        },
        'rxs': {
          'title': 'api.meta.rxs.title'.tr,
          'codeKey': 'rxs',
          'description': 'api.meta.rxs.desc'.tr,
          'points': [
            'api.meta.rxs.pt0'.tr,
            'api.meta.rxs.pt1'.tr,
            'api.meta.rxs.pt2'.tr,
            'api.meta.rxs.pt3'.tr,
          ],
          'next': 'global-di',
          'nextTitle': 'api.meta.rxs.next_title'.tr,
          'color': AppTheme.googleBlue,
        },
        'global-di': {
          'title': 'api.meta.global_di.title'.tr,
          'codeKey': 'global_di',
          'description': 'api.meta.global_di.desc'.tr,
          'points': [
            'api.meta.global_di.pt0'.tr,
            'api.meta.global_di.pt1'.tr,
            'api.meta.global_di.pt2'.tr,
          ],
          'next': 'binding-widget',
          'nextTitle': 'api.meta.global_di.next_title'.tr,
          'color': AppTheme.googleGreen,
        },
        'binding-widget': {
          'title': 'api.meta.binding_widget.title'.tr,
          'codeKey': 'binding_widget',
          'description': 'api.meta.binding_widget.desc'.tr,
          'points': [
            'api.meta.binding_widget.pt0'.tr,
            'api.meta.binding_widget.pt1'.tr,
            'api.meta.binding_widget.pt2'.tr,
          ],
          'next': 'getx-service',
          'nextTitle': 'api.meta.binding_widget.next_title'.tr,
          'color': AppTheme.googleRed,
        },
        'getx-service': {
          'title': 'api.meta.getx_service.title'.tr,
          'codeKey': 'getx_service',
          'description': 'api.meta.getx_service.desc'.tr,
          'points': [
            'api.meta.getx_service.pt0'.tr,
            'api.meta.getx_service.pt1'.tr,
            'api.meta.getx_service.pt2'.tr,
          ],
          'next': 'worker',
          'nextTitle': 'api.meta.getx_service.next_title'.tr,
          'color': AppTheme.googleYellow,
        },
        'worker': {
          'title': 'api.meta.worker.title'.tr,
          'codeKey': 'worker',
          'description': 'api.meta.worker.desc'.tr,
          'points': [
            'api.meta.worker.pt0'.tr,
            'api.meta.worker.pt1'.tr,
            'api.meta.worker.pt2'.tr,
          ],
          'next': 'state-mixin',
          'nextTitle': 'api.meta.worker.next_title'.tr,
          'color': AppTheme.googleBlue,
        },
        'state-mixin': {
          'title': 'api.meta.state_mixin.title'.tr,
          'codeKey': 'state_mixin',
          'description': 'api.meta.state_mixin.desc'.tr,
          'points': [
            'api.meta.state_mixin.pt0'.tr,
            'api.meta.state_mixin.pt1'.tr,
            'api.meta.state_mixin.pt2'.tr,
          ],
          'next': 'i18n',
          'nextTitle': 'api.meta.state_mixin.next_title'.tr,
          'color': AppTheme.googleGreen,
        },
        'i18n': {
          'title': 'api.meta.i18n.title'.tr,
          'codeKey': 'i18n',
          'description': 'api.meta.i18n.desc'.tr,
          'points': [
            'api.meta.i18n.pt0'.tr,
            'api.meta.i18n.pt1'.tr,
            'api.meta.i18n.pt2'.tr,
          ],
          'next': 'comparison',
          'nextTitle': 'api.meta.i18n.next_title'.tr,
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
        } catch (_) {
          // File not found — skip, sample will show a loading message
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
}

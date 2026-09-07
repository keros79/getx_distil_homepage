import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getx_distil/get.dart';

import '../core/app_theme.dart';

class ComparisonController extends GetxController {
  late final ScrollController scrollController;

  final Map<String, RxS<String>> _samples = {
    'comp_report_read': RxS<String>(''),
    'comp_refresh': RxS<String>(''),
    'comp_auto_batch_refresh': RxS<String>(''),
    'comp_binding_widget_route': RxS<String>(''),
    'comp_update_sequential': RxS<String>(''),
    'comp_items_on': RxS<String>(''),
    'comp_di_debug': RxS<String>(''),
    'comp_rp_s2_distil': RxS<String>(''),
    'comp_rp_s2_riverpod': RxS<String>(''),
    'comp_rp_s3_distil': RxS<String>(''),
    'comp_rp_s3_riverpod': RxS<String>(''),
    'comp_rp_s4_distil': RxS<String>(''),
    'comp_rp_s4_riverpod': RxS<String>(''),
  };

  String getCode(String key) => _samples[key]?.value ?? '';
  RxS<String>? getRxCode(String key) => _samples[key];

  int _activeLoadId = 0;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  List<String> _getKeysForSection(String section) {
    switch (section) {
      case 'improvements':
        return [
          'comp_report_read',
          'comp_refresh',
          'comp_auto_batch_refresh',
          'comp_binding_widget_route',
          'comp_update_sequential',
          'comp_items_on',
          'comp_di_debug',
        ];
      case 'riverpod':
        return [
          'comp_rp_s2_distil',
          'comp_rp_s2_riverpod',
          'comp_rp_s3_distil',
          'comp_rp_s3_riverpod',
          'comp_rp_s4_distil',
          'comp_rp_s4_riverpod',
        ];
      default:
        return [];
    }
  }

  void loadSamplesForSection(String section) {
    final neededKeys = _getKeysForSection(section);
    final missingKeys = neededKeys.where((k) {
      final sample = _samples[k];
      return sample == null || sample.status != RxDataStatus.loaded;
    }).toList();

    if (missingKeys.isEmpty) {
      return;
    }

    _activeLoadId++;
    final loadId = _activeLoadId;

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (loadId != _activeLoadId) return;

      for (final key in missingKeys) {
        _samples[key]?.setLoading();
      }

      try {
        for (final key in missingKeys) {
          final content = await rootBundle.loadString('assets/code_samples/$key.txt');
          if (loadId == _activeLoadId) {
            final sample = _samples[key];
            if (sample != null) {
              sample.value = content;
            }
          }
        }
      } catch (e) {
        if (loadId == _activeLoadId) {
          for (final key in missingKeys) {
            _samples[key]?.setError(e.toString());
          }
        }
      }
    });
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
  Map<String, Map<String, dynamic>> get sectionMeta => {
        // ── Overview ──
        'overview': {
          'type': 'overview',
          'title': 'cmp.ov.title'.tr,
          'sectionTitle': 'cmp.ov.section_title'.tr,
          'tableHeaders': [
            'cmp.ov.h_category'.tr,
            'getx_distil',
            'GetX'
          ],
          'tableRows': [
            _row(['cmp.ov.r_version'.tr, '2.0.0', '4.7.3 (Stable)']),
            _row(['SDK', 'Dart ^3.12.0', 'Dart >=2.15.0 <4.0.0']),
            _row([
              'cmp.ov.r_deps'.tr,
              'cmp.ov.r_deps_distil'.tr,
              'cmp.ov.r_deps_getx'.tr
            ]),
            _row(['cmp.ov.r_files'.tr, '19', '118']),
            _row([
              'cmp.ov.r_logic'.tr,
              '2,867 (1,852 code)',
              '17,351 (11,831 code)'
            ]),
            _row(['cmp.ov.r_tests'.tr, '2,405 lines / 109 cases', 'cmp.ov.r_tests_getx'.tr]),
            _row([
              'cmp.ov.r_collections'.tr,
              _ok('cmp.ov.r_collections_distil'.tr),
              'cmp.ov.r_collections_getx'.tr
            ]),
            _row([
              'cmp.ov.r_routing'.tr,
              _del('cmp.ov.r_removed'.tr),
              _ok('cmp.ov.r_routing_getx'.tr)
            ]),
            _row([
              'cmp.ov.r_i18n'.tr,
              _ok('cmp.ov.r_i18n_distil'.tr),
              _ok('cmp.ov.r_i18n_getx'.tr)
            ]),
            _row([
              'cmp.ov.r_state'.tr,
              _ok('cmp.ov.r_state_distil'.tr),
              _ok('cmp.ov.r_state_getx'.tr)
            ]),
            _row([
              'cmp.ov.r_di'.tr,
              _ok('cmp.ov.r_di_distil'.tr),
              _ok('cmp.ov.r_di_getx'.tr)
            ]),
          ],
          'nextSection': 'improvements',
          'nextTitle': 'cmp.ov.next_title'.tr,
        },

        // ── Improvements ──
        'improvements': {
          'type': 'improvements',
          'title': 'cmp.imp.title'.tr,
          'items': [
            {
              'number': '2.1',
              'title': 'cmp.imp.i1.title'.tr,
              'subtitle': 'cmp.imp.i1.subtitle'.tr,
              'tableHeaders': [
                'cmp.imp.i1.h0'.tr,
                'GetX',
                'getx_distil'
              ],
              'tableRows': [
                _row([
                  'cmp.imp.i1.r0c0'.tr,
                  'cmp.imp.i1.r0c1'.tr,
                  _ok('cmp.imp.i1.r0c2'.tr)
                ]),
                _row([
                  'cmp.imp.i1.r1c0'.tr,
                  'cmp.imp.i1.r1c1'.tr,
                  'cmp.imp.i1.r1c2'.tr
                ]),
                _row([
                  'cmp.imp.i1.r2c0'.tr,
                  'cmp.imp.i1.r2c1'.tr,
                  _ok('cmp.imp.i1.r2c2'.tr)
                ]),
              ],
              'codeKey': 'comp_report_read',
              'evaluation': 'cmp.imp.i1.eval'.tr,
            },
            {
              'number': '2.2',
              'title': 'cmp.imp.i2.title'.tr,
              'subtitle': 'cmp.imp.i2.subtitle'.tr,
              'tableHeaders': [
                'cmp.imp.i2.h0'.tr,
                'GetX',
                'getx_distil'
              ],
              'tableRows': [
                _row([
                  'cmp.imp.i2.r0c0'.tr,
                  _del('cmp.imp.i2.r0c1'.tr),
                  _ok('cmp.imp.i2.r0c2'.tr)
                ]),
                _row([
                  'cmp.imp.i2.r1c0'.tr,
                  'cmp.imp.i2.r1c1'.tr,
                  _ok('cmp.imp.i2.r1c2'.tr)
                ]),
              ],
              'codeKey': 'comp_refresh',
              'evaluation': 'cmp.imp.i2.eval'.tr,
            },
            {
              'number': '2.3',
              'title': 'cmp.imp.i3.title'.tr,
              'subtitle': 'cmp.imp.i3.subtitle'.tr,
              'tableHeaders': [
                'cmp.imp.i3.h0'.tr,
                'GetX',
                'getx_distil'
              ],
              'tableRows': [
                _row([
                  'cmp.imp.i3.r0c0'.tr,
                  'cmp.imp.i3.r0c1'.tr,
                  _ok('cmp.imp.i3.r0c2'.tr)
                ]),
                _row([
                  'cmp.imp.i3.r1c0'.tr,
                  'cmp.imp.i3.r1c1'.tr,
                  _ok('cmp.imp.i3.r1c2'.tr)
                ]),
                _row([
                  'cmp.imp.i3.r2c0'.tr,
                  'cmp.imp.i3.r2c1'.tr,
                  _ok('cmp.imp.i3.r2c2'.tr)
                ]),
                _row([
                  'cmp.imp.i3.r3c0'.tr,
                  'cmp.imp.i3.r3c1'.tr,
                  'cmp.imp.i3.r3c2'.tr
                ]),
              ],
              'codeKey': 'comp_auto_batch_refresh',
              'evaluation': 'cmp.imp.i3.eval'.tr,
            },
            {
              'number': '2.4',
              'title': 'cmp.imp.i4.title'.tr,
              'subtitle': 'cmp.imp.i4.subtitle'.tr,
              'tableHeaders': [
                'cmp.imp.i4.h0'.tr,
                'GetX',
                'getx_distil'
              ],
              'tableRows': [
                _row([
                  'cmp.imp.i4.r0c0'.tr,
                  'cmp.imp.i4.r0c1'.tr,
                  _ok('cmp.imp.i4.r0c2'.tr)
                ]),
                _row([
                  'cmp.imp.i4.r1c0'.tr,
                  'cmp.imp.i4.r1c1'.tr,
                  _ok('cmp.imp.i4.r1c2'.tr)
                ]),
                _row([
                  'cmp.imp.i4.r2c0'.tr,
                  'cmp.imp.i4.r2c1'.tr,
                  _ok('cmp.imp.i4.r2c2'.tr)
                ]),
                _row([
                  'cmp.imp.i4.r3c0'.tr,
                  'cmp.imp.i4.r3c1'.tr,
                  _ok('cmp.imp.i4.r3c2'.tr)
                ]),
                _row([
                  'cmp.imp.i4.r4c0'.tr,
                  'cmp.imp.i4.r4c1'.tr,
                  _ok('cmp.imp.i4.r4c2'.tr)
                ]),
              ],
              'codeKey': 'comp_binding_widget_route',
              'evaluation': 'cmp.imp.i4.eval'.tr,
            },
            {
              'number': '2.5',
              'title': 'cmp.imp.i5.title'.tr,
              'subtitle': 'cmp.imp.i5.subtitle'.tr,
              'tableHeaders': [
                'cmp.imp.i5.h0'.tr,
                'GetX',
                'getx_distil'
              ],
              'tableRows': [
                _row([
                  'cmp.imp.i5.r0c0'.tr,
                  'cmp.imp.i5.r0c1'.tr,
                  _ok('cmp.imp.i5.r0c2'.tr)
                ]),
                _row([
                  'cmp.imp.i5.r1c0'.tr,
                  'cmp.imp.i5.r1c1'.tr,
                  _ok('cmp.imp.i5.r1c2'.tr)
                ]),
              ],
              'codeKey': 'comp_update_sequential',
              'evaluation': 'cmp.imp.i5.eval'.tr,
            },
            {
              'number': '2.6',
              'title': 'cmp.imp.i6.title'.tr,
              'subtitle': 'cmp.imp.i6.subtitle'.tr,
              'tableHeaders': [
                'cmp.imp.i6.h0'.tr,
                'GetX',
                'getx_distil'
              ],
              'tableRows': [
                _row([
                  'cmp.imp.i6.r0c0'.tr,
                  'cmp.imp.i6.r0c1'.tr,
                  _ok('cmp.imp.i6.r0c2'.tr)
                ]),
                _row([
                  'cmp.imp.i6.r1c0'.tr,
                  'cmp.imp.i6.r1c1'.tr,
                  _ok('cmp.imp.i6.r1c2'.tr)
                ]),
                _row([
                  'cmp.imp.i6.r2c0'.tr,
                  'cmp.imp.i6.r2c1'.tr,
                  _ok('cmp.imp.i6.r2c2'.tr)
                ]),
              ],
              'codeKey': 'comp_items_on',
              'evaluation': 'cmp.imp.i6.eval'.tr,
            },
            {
              'number': '2.7',
              'title': 'cmp.imp.i7.title'.tr,
              'subtitle': 'cmp.imp.i7.subtitle'.tr,
              'tableHeaders': [
                'cmp.imp.i7.h0'.tr,
                'GetX',
                'getx_distil'
              ],
              'tableRows': [
                _row([
                  'cmp.imp.i7.r0c0'.tr,
                  'cmp.imp.i7.r0c1'.tr,
                  _ok('cmp.imp.i7.r0c2'.tr)
                ]),
                _row([
                  'cmp.imp.i7.r1c0'.tr,
                  'cmp.imp.i7.r1c1'.tr,
                  _ok('cmp.imp.i7.r1c2'.tr)
                ]),
              ],
              'evaluation': 'cmp.imp.i7.eval'.tr,
            },
            {
              'number': '2.8',
              'title': 'cmp.imp.i8.title'.tr,
              'subtitle': 'cmp.imp.i8.subtitle'.tr,
              'tableHeaders': [
                'cmp.imp.i8.h0'.tr,
                'GetX',
                'getx_distil'
              ],
              'tableRows': [
                _row([
                  'cmp.imp.i8.r0c0'.tr,
                  'cmp.imp.i8.r0c1'.tr,
                  _ok('cmp.imp.i8.r0c2'.tr)
                ]),
              ],
              'codeKey': 'comp_di_debug',
              'evaluation': 'cmp.imp.i8.eval'.tr,
            },
          ],
          'nextSection': 'sacrificed',
          'nextTitle': 'cmp.imp.next_title'.tr,
        },

        // ── Sacrificed ──
        'sacrificed': {
          'type': 'sacrificed',
          'title': 'cmp.sac.title'.tr,
          'tableHeaders': [
            'cmp.sac.h_feature'.tr,
            'GetX',
            'getx_distil',
            'cmp.sac.h_impact'.tr
          ],
          'tableRows': [
            _row([
              'cmp.sac.r0c0'.tr,
              'cmp.sac.r0c1'.tr,
              _del('cmp.sac.removed'.tr),
              'cmp.sac.r0c3'.tr
            ]),
            _row([
              'cmp.sac.r1c0'.tr,
              'cmp.sac.r1c1'.tr,
              _del('cmp.sac.removed'.tr),
              'cmp.sac.r1c3'.tr
            ]),
            _row([
              'cmp.sac.r2c0'.tr,
              'cmp.sac.r2c1'.tr,
              _del('cmp.sac.removed'.tr),
              'cmp.sac.r2c3'.tr
            ]),
            _row([
              'cmp.sac.r3c0'.tr,
              'cmp.sac.r3c1'.tr,
              _del('cmp.sac.removed'.tr),
              'cmp.sac.r3c3'.tr
            ]),
            _row([
              'cmp.sac.r4c0'.tr,
              'cmp.sac.r4c1'.tr,
              _del('cmp.sac.removed'.tr),
              'cmp.sac.r4c3'.tr
            ]),
            _row([
              'cmp.sac.r5c0'.tr,
              'cmp.sac.r5c1'.tr,
              _del('cmp.sac.removed'.tr),
              'cmp.sac.r5c3'.tr
            ]),
            _row([
              'cmp.sac.r7c0'.tr,
              'cmp.sac.r7c1'.tr,
              _del('cmp.sac.removed'.tr),
              'cmp.sac.r7c3'.tr
            ]),
            _row([
              'cmp.sac.r6c0'.tr,
              'cmp.sac.r6c1'.tr,
              _ok('cmp.sac.restored'.tr),
              'cmp.sac.r6c3'.tr
            ]),
            _row([
              'cmp.sac.r8c0'.tr,
              'cmp.sac.r8c1'.tr,
              _ok('cmp.sac.restored'.tr),
              'cmp.sac.r8c3'.tr
            ]),
            _row([
              'cmp.sac.r9c0'.tr,
              'cmp.sac.r9c1'.tr,
              _ok('cmp.sac.restored'.tr),
              'cmp.sac.r9c3'.tr
            ]),
            _row([
              'cmp.sac.r10c0'.tr,
              'cmp.sac.r10c1'.tr,
              _ok('cmp.sac.restored'.tr),
              'cmp.sac.r10c3'.tr
            ]),
          ],
          'infoCard': 'cmp.sac.info_card'.tr,
          'nextSection': 'quality',
          'nextTitle': 'cmp.sac.next_title'.tr,
        },

        // ── Quality ──
        'quality': {
          'type': 'quality',
          'title': 'cmp.qa.title'.tr,
          'goodPoints': [
            'cmp.qa.good0'.tr,
            'cmp.qa.good1'.tr,
            'cmp.qa.good2'.tr,
            'cmp.qa.good3'.tr,
            'cmp.qa.good4'.tr,
            'cmp.qa.good5'.tr,
            'cmp.qa.good6'.tr,
          ],
          'improvePoints': [
            'cmp.qa.bad0'.tr,
            'cmp.qa.bad1'.tr,
            'cmp.qa.bad2'.tr,
            'cmp.qa.bad3'.tr,
            'cmp.qa.bad4'.tr,
          ],
          'scores': [
            {
              'item': 'cmp.qa.s0_item'.tr,
              'score': '⭐⭐⭐⭐⭐',
              'note': 'cmp.qa.s0_note'.tr
            },
            {
              'item': 'cmp.qa.s1_item'.tr,
              'score': '⭐⭐⭐⭐',
              'note': 'cmp.qa.s1_note'.tr
            },
            {
              'item': 'cmp.qa.s2_item'.tr,
              'score': '⭐⭐⭐⭐½',
              'note': 'cmp.qa.s2_note'.tr
            },
            {
              'item': 'cmp.qa.s3_item'.tr,
              'score': '⭐⭐⭐⭐½',
              'note': 'cmp.qa.s3_note'.tr
            },
            {
              'item': 'cmp.qa.s4_item'.tr,
              'score': '⭐⭐⭐⭐',
              'note': 'cmp.qa.s4_note'.tr
            },
            {
              'item': 'cmp.qa.s5_item'.tr,
              'score': '⭐⭐⭐⭐½',
              'note': 'cmp.qa.s5_note'.tr
            },
            {
              'item': 'cmp.qa.s6_item'.tr,
              'score': '⭐⭐⭐⭐⭐',
              'note': 'cmp.qa.s6_note'.tr
            },
            {
              'item': 'cmp.qa.s7_item'.tr,
              'score': '⭐⭐⭐⭐',
              'note': 'cmp.qa.s7_note'.tr
            },
          ],
          'nextSection': 'riverpod',
          'nextTitle': 'getx_distil vs Riverpod 3.x',
        },

        // ── Riverpod ──
        'riverpod': {
          'type': 'riverpod',
          'title': 'getx_distil vs Riverpod 3.x',
          'subsections': [
            {
              'subtype': 'table',
              'number': '5.1',
              'title': 'cmp.rp.s1.title'.tr,
              'tableHeaders': [
                'cmp.rp.s1.h0'.tr,
                'getx_distil',
                'Riverpod 3.x'
              ],
              'tableRows': [
                _row([
                  'cmp.rp.s1.r0c0'.tr,
                  'cmp.rp.s1.r0c1'.tr,
                  'cmp.rp.s1.r0c2'.tr
                ]),
                _row([
                  'cmp.rp.s1.r1c0'.tr,
                  'cmp.rp.s1.r1c1'.tr,
                  'cmp.rp.s1.r1c2'.tr
                ]),
                _row([
                  'cmp.rp.s1.r2c0'.tr,
                  'cmp.rp.s1.r2c1'.tr,
                  'cmp.rp.s1.r2c2'.tr
                ]),
                _row([
                  'cmp.rp.s1.r3c0'.tr,
                  _ok('cmp.rp.s1.r3c1'.tr),
                  'cmp.rp.s1.r3c2'.tr
                ]),
                _row([
                  'cmp.rp.s1.r4c0'.tr,
                  _ok('cmp.rp.s1.r4c1'.tr),
                  'cmp.rp.s1.r4c2'.tr
                ]),
                _row([
                  'cmp.rp.s1.r5c0'.tr,
                  _ok('cmp.rp.s1.r5c1'.tr),
                  'cmp.rp.s1.r5c2'.tr
                ]),
              ],
              'evaluation': 'cmp.rp.s1.eval'.tr,
            },
            {
              'subtype': 'codeCompare',
              'number': '5.2',
              'title': 'cmp.rp.s2.title'.tr,
              'description': 'cmp.rp.s2.desc1'.tr,
              'codeKey1': 'comp_rp_s2_distil',
              'description2': 'cmp.rp.s2.desc2'.tr,
              'codeKey2': 'comp_rp_s2_riverpod',
              'tableHeaders': [
                'cmp.rp.s2.h0'.tr,
                'getx_distil',
                'Riverpod 3.x'
              ],
              'tableRows': [
                _row([
                  'cmp.rp.s2.r0c0'.tr,
                  'cmp.rp.s2.r0c1'.tr,
                  'cmp.rp.s2.r0c2'.tr
                ]),
                _row([
                  'cmp.rp.s2.r1c0'.tr,
                  'cmp.rp.s2.r1c1'.tr,
                  'cmp.rp.s2.r1c2'.tr
                ]),
                _row([
                  'cmp.rp.s2.r2c0'.tr,
                  'cmp.rp.s2.r2c1'.tr,
                  'cmp.rp.s2.r2c2'.tr
                ]),
                _row([
                  'cmp.rp.s2.r3c0'.tr,
                  'Rxn<T>',
                  'AsyncValue<T>'
                ]),
                _row([
                  'cmp.rp.s2.r4c0'.tr,
                  _ok('cmp.rp.s2.r4c1'.tr),
                  'cmp.rp.s2.r4c2'.tr
                ]),
              ],
              'evaluation': 'cmp.rp.s2.eval'.tr,
            },
            {
              'subtype': 'codeCompare',
              'number': '5.3',
              'title': 'cmp.rp.s3.title'.tr,
              'description': 'getx_distil — RxSList / RxS',
              'codeKey1': 'comp_rp_s3_distil',
              'description2': 'Riverpod 3.x — AsyncNotifier + AsyncValue',
              'codeKey2': 'comp_rp_s3_riverpod',
              'tableHeaders': [
                'cmp.rp.s3.h0'.tr,
                'getx_distil',
                'Riverpod 3.x'
              ],
              'tableRows': [
                _row([
                  'cmp.rp.s3.r0c0'.tr,
                  'cmp.rp.s3.r0c1'.tr,
                  'cmp.rp.s3.r0c2'.tr
                ]),
                _row([
                  'cmp.rp.s3.r1c0'.tr,
                  'cmp.rp.s3.r1c1'.tr,
                  'cmp.rp.s3.r1c2'.tr
                ]),
                _row([
                  'cmp.rp.s3.r2c0'.tr,
                  'cmp.rp.s3.r2c1'.tr,
                  'cmp.rp.s3.r2c2'.tr
                ]),
                _row([
                  'cmp.rp.s3.r3c0'.tr,
                  'cmp.rp.s3.r3c1'.tr,
                  'cmp.rp.s3.r3c2'.tr
                ]),
                _row([
                  'cmp.rp.s3.r4c0'.tr,
                  'cmp.rp.s3.r4c1'.tr,
                  'cmp.rp.s3.r4c2'.tr
                ]),
              ],
              'evaluation': 'cmp.rp.s3.eval'.tr,
            },
            {
              'subtype': 'codeCompare',
              'number': '5.4',
              'title': 'cmp.rp.s4.title'.tr,
              'description': 'cmp.rp.s4.desc1'.tr,
              'codeKey1': 'comp_rp_s4_distil',
              'description2': 'cmp.rp.s4.desc2'.tr,
              'codeKey2': 'comp_rp_s4_riverpod',
              'tableHeaders': [
                'cmp.rp.s4.h0'.tr,
                'getx_distil',
                'Riverpod 3.x'
              ],
              'tableRows': [
                _row([
                  'cmp.rp.s4.r0c0'.tr,
                  'cmp.rp.s4.r0c1'.tr,
                  'cmp.rp.s4.r0c2'.tr
                ]),
                _row([
                  'cmp.rp.s4.r1c0'.tr,
                  'cmp.rp.s4.r1c1'.tr,
                  'cmp.rp.s4.r1c2'.tr
                ]),
                _row([
                  'cmp.rp.s4.r2c0'.tr,
                  _ok('cmp.rp.s4.r2c1'.tr),
                  'cmp.rp.s4.r2c2'.tr
                ]),
                _row([
                  'cmp.rp.s4.r3c0'.tr,
                  _ok('cmp.rp.s4.r3c1'.tr),
                  'cmp.rp.s4.r3c2'.tr
                ]),
                _row([
                  'cmp.rp.s4.r4c0'.tr,
                  'cmp.rp.s4.r4c1'.tr,
                  'cmp.rp.s4.r4c2'.tr
                ]),
                _row([
                  'cmp.rp.s4.r5c0'.tr,
                  _ok('cmp.rp.s4.r5c1'.tr),
                  'cmp.rp.s4.r5c2'.tr
                ]),
              ],
              'evaluation': 'cmp.rp.s4.eval'.tr,
            },
            {
              'subtype': 'table',
              'number': '5.5',
              'title': 'cmp.rp.s5.title'.tr,
              'tableHeaders': [
                'cmp.rp.s5.h0'.tr,
                'getx_distil',
                'Riverpod 3.x'
              ],
              'tableRows': [
                _row([
                  'cmp.rp.s5.r0c0'.tr,
                  _ok('cmp.rp.s5.r0c1'.tr),
                  'cmp.rp.s5.r0c2'.tr
                ]),
                _row([
                  'cmp.rp.s5.r1c0'.tr,
                  _ok('cmp.rp.s5.r1c1'.tr),
                  'cmp.rp.s5.r1c2'.tr
                ]),
                _row([
                  'cmp.rp.s5.r2c0'.tr,
                  _ok('cmp.rp.s5.r2c1'.tr),
                  'cmp.rp.s5.r2c2'.tr
                ]),
              ],
              'evaluation': 'cmp.rp.s5.eval'.tr,
            },
            {
              'subtype': 'table',
              'number': '5.6',
              'title': 'cmp.rp.s6.title'.tr,
              'tableHeaders': [
                'cmp.rp.s6.h0'.tr,
                'getx_distil',
                'Riverpod 3.x'
              ],
              'tableRows': [
                _row([
                  'cmp.rp.s6.r0c0'.tr,
                  _ok('cmp.rp.s6.r0c1'.tr),
                  'cmp.rp.s6.r0c2'.tr
                ]),
                _row([
                  'cmp.rp.s6.r1c0'.tr,
                  'cmp.rp.s6.r1c1'.tr,
                  _ok('cmp.rp.s6.r1c2'.tr)
                ]),
                _row([
                  'cmp.rp.s6.r2c0'.tr,
                  _ok('cmp.rp.s6.r2c1'.tr),
                  'cmp.rp.s6.r2c2'.tr
                ]),
                _row([
                  'cmp.rp.s6.r3c0'.tr,
                  _ok('cmp.rp.s6.r3c1'.tr),
                  'cmp.rp.s6.r3c2'.tr
                ]),
                _row([
                  'cmp.rp.s6.r4c0'.tr,
                  _ok('cmp.rp.s6.r4c1'.tr),
                  'cmp.rp.s6.r4c2'.tr
                ]),
                _row([
                  'cmp.rp.s6.r5c0'.tr,
                  'cmp.rp.s6.r5c1'.tr,
                  _ok('cmp.rp.s6.r5c2'.tr)
                ]),
              ],
              'evaluation': 'cmp.rp.s6.eval'.tr,
            },
            {
              'subtype': 'table',
              'number': '5.7',
              'title': 'cmp.rp.s7.title'.tr,
              'tableHeaders': [
                'cmp.rp.s7.h0'.tr,
                'getx_distil',
                'Riverpod 3.x'
              ],
              'tableRows': [
                _row([
                  'cmp.rp.s7.r0c0'.tr,
                  _ok('cmp.rp.s7.r0c1'.tr),
                  'cmp.rp.s7.r0c2'.tr
                ]),
                _row([
                  'cmp.rp.s7.r1c0'.tr,
                  'cmp.rp.s7.r1c1'.tr,
                  'cmp.rp.s7.r1c2'.tr
                ]),
                _row([
                  'cmp.rp.s7.r2c0'.tr,
                  _ok('cmp.rp.s7.r2c1'.tr),
                  'cmp.rp.s7.r2c2'.tr
                ]),
                _row([
                  'cmp.rp.s7.r3c0'.tr,
                  'cmp.rp.s7.r3c1'.tr,
                  'cmp.rp.s7.r3c2'.tr
                ]),
                _row([
                  'cmp.rp.s7.r4c0'.tr,
                  _ok('cmp.rp.s7.r4c1'.tr),
                  'cmp.rp.s7.r4c2'.tr
                ]),
                _row([
                  'cmp.rp.s7.r5c0'.tr,
                  _ok('cmp.rp.s7.r5c1'.tr),
                  'cmp.rp.s7.r5c2'.tr
                ]),
              ],
              'evaluation': 'cmp.rp.s7.eval'.tr,
            },
            {
              'subtype': 'table',
              'number': '5.8',
              'title': 'cmp.rp.s8.title'.tr,
              'tableHeaders': [
                'cmp.rp.s8.h0'.tr,
                'getx_distil',
                'Riverpod 3.x'
              ],
              'tableRows': [
                _row([
                  'cmp.rp.s8.r0c0'.tr,
                  'cmp.rp.s8.r0c1'.tr,
                  'cmp.rp.s8.r0c2'.tr
                ]),
                _row([
                  'cmp.rp.s8.r1c0'.tr,
                  'cmp.rp.s8.r1c1'.tr,
                  'cmp.rp.s8.r1c2'.tr
                ]),
                _row([
                  'cmp.rp.s8.r2c0'.tr,
                  'cmp.rp.s8.r2c1'.tr,
                  _ok('cmp.rp.s8.r2c2'.tr)
                ]),
                _row([
                  'cmp.rp.s8.r3c0'.tr,
                  'cmp.rp.s8.r3c1'.tr,
                  _ok('cmp.rp.s8.r3c2'.tr)
                ]),
              ],
              'evaluation': 'cmp.rp.s8.eval'.tr,
            },
          ],
          'matrix': [
            {'item': 'cmp.rp.mx.learning_curve'.tr, 'g': 5, 'r': 3},
            {'item': 'cmp.rp.mx.boilerplate'.tr, 'g': 5, 'r': 3},
            {'item': 'cmp.rp.mx.compile_safety'.tr, 'g': 3, 'r': 5},
            {'item': 'cmp.rp.mx.async_auto'.tr, 'g': 4, 'r': 5},
            {'item': 'cmp.rp.mx.list_perf'.tr, 'g': 5, 'r': 4},
            {'item': 'cmp.rp.mx.di_flex'.tr, 'g': 5, 'r': 4},
            {'item': 'cmp.rp.mx.ctx_free'.tr, 'g': 5, 'r': 2},
            {'item': 'cmp.rp.mx.test_mock'.tr, 'g': 4, 'r': 5},
            {'item': 'cmp.rp.mx.build_complex'.tr, 'g': 5, 'r': 4},
            {'item': 'cmp.rp.mx.refactor'.tr, 'g': 3, 'r': 5},
            {'item': 'cmp.rp.mx.mem_mgmt'.tr, 'g': 4, 'r': 5},
            {'item': 'cmp.rp.mx.runtime_safety'.tr, 'g': 4, 'r': 4},
            {'item': 'cmp.rp.mx.ext_deps'.tr, 'g': 5, 'r': 3},
            {'item': 'cmp.rp.mx.i18n'.tr, 'g': 4, 'r': 2},
          ],
          'guide': {
            'winnerTitle': 'cmp.rp.guide.winner_title'.tr,
            'winnerColor': AppTheme.googleBlue,
            'winnerItems': [
              'cmp.rp.guide.winner0'.tr,
              'cmp.rp.guide.winner1'.tr,
              'cmp.rp.guide.winner2'.tr,
              'cmp.rp.guide.winner3'.tr,
              'cmp.rp.guide.winner4'.tr,
              'cmp.rp.guide.winner5'.tr
            ],
            'loserTitle': 'cmp.rp.guide.loser_title'.tr,
            'loserColor': AppTheme.googleGreen,
            'loserItems': [
              'cmp.rp.guide.loser0'.tr,
              'cmp.rp.guide.loser1'.tr,
              'cmp.rp.guide.loser2'.tr,
              'cmp.rp.guide.loser3'.tr,
              'cmp.rp.guide.loser4'.tr
            ],
          },
          'nextSection': 'conclusion',
          'nextTitle': 'cmp.rp.next_title'.tr,
        },

        // ── Conclusion ──
        'conclusion': {
          'type': 'conclusion',
          'title': 'cmp.con.title'.tr,
          'cards': [
            {
              'icon': Icons.compare_arrows_rounded,
              'color': AppTheme.googleBlue,
              'cardTitle': 'getx_distil vs GetX',
              'quote': 'cmp.con.card0.quote'.tr,
              'paragraphs': [
                'cmp.con.card0.p0'.tr,
                'cmp.con.card0.p1'.tr,
                'cmp.con.card0.p2'.tr,
              ],
            },
            {
              'icon': Icons.swap_horiz_rounded,
              'color': AppTheme.googleGreen,
              'cardTitle': 'getx_distil vs Riverpod 3.x',
              'quote': 'cmp.con.card1.quote'.tr,
              'paragraphs': [
                'cmp.con.card1.p0'.tr,
                'cmp.con.card1.p1'.tr,
                'cmp.con.card1.p2'.tr,
              ],
            },
          ],
          'footerText': 'cmp.con.footer'.tr,
        },
      };
}

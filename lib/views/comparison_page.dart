import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/sidebar_toc_comparison.dart';
import '../core/widgets/code_block.dart';
import '../core/widgets/glass_card.dart';
import '../core/widgets/particle_field.dart';
import '../core/widgets/app_drawer.dart';

// ──────────────────────────────────────────────
// Section Meta — 모든 콘텐츠 데이터를 맵으로 관리
// ──────────────────────────────────────────────
Map<String, dynamic> _ok(String text) => {'type': 'success', 'text': text};
Map<String, dynamic> _del(String text) => {'type': 'delete', 'text': text};
List<dynamic> _row(List<dynamic> cells) => cells;

final Map<String, Map<String, dynamic>> _sectionMeta = {
  // ── Overview ──
  'overview': {
    'type': 'overview',
    'title': '종합 평가 및 비교 분석',
    'infoBadges': [
      '대상 버전: getx_distil v1.1.3',
      '비교 대상: GetX (pub.dev/packages/get), Riverpod 3.0',
    ],
    'sectionTitle': '1. getx_distil 프로젝트 개요',
    'tableHeaders': ['항목', 'getx_distil', 'GetX'],
    'tableRows': [
      _row(['버전', '1.1.3 (Stable)', '4.6.6']),
      _row(['SDK', 'Dart ^3.12.0', 'Dart >=2.14.0']),
      _row(['외부 의존성', '0개 (Flutter SDK만)', '수십 개 (collection, web, js 등)']),
      _row(['소스 파일', '15개', '100개 이상']),
      _row(['핵심 로직', '~1,200줄', '~15,000줄 이상']),
      _row(['라우팅', _del('❌ 제거'), _ok('✅ 내장 (GetPageRoute 등)')]),
      _row(['다국어', _ok('✅ 유지 (간소화)'), _ok('✅ 유지')]),
      _row(['상태관리', _ok('✅ 핵심 강화'), _ok('✅ 기본')]),
      _row(['DI', _ok('✅ 하이브리드 (트리+전역)'), _ok('✅ 전역 위주')]),
    ],
    'nextSection': 'improvements',
    'nextTitle': '2. GetX 대비 핵심 개선 사항',
  },

  // ── Improvements ──
  'improvements': {
    'type': 'improvements',
    'title': 'GetX 대비 핵심 개선 사항',
    'items': [
      {
        'number': '2.1',
        'title': 'Fast-Path Tracking (Notifier.isTracking)',
        'subtitle': '가장 중요한 성능 개선',
        'tableHeaders': ['구분', 'GetX', 'getx_distil'],
        'tableRows': [
          _row([
            '방식',
            'Zone 기반 글로벌 프록시 (RxInterface.proxy)',
            _ok('정적 부울 플래그 (Notifier.isTracking)')
          ]),
          _row([
            'Obx 외부 Rx 읽기',
            '매번 프록시 탐색 + null 체크',
            _ok('원천 우회 (O(1) bool 체크)')
          ]),
          _row(['대량 데이터 순회 시', 'CPU 오버헤드 누적', _ok('Zero-cost')]),
        ],
        'code':
            '// getx_distil - reportRead()\nvoid reportRead() {\n  if (Notifier.isTracking) {  // ← 단순 bool 체크\n    Notifier.instance.read(this);\n  }\n}',
        'evaluation':
            'Zone 기반 접근 대비 압도적으로 가볍고, 대량 데이터 연산 시 실질적인 CPU 사이클 절감 효과가 큼. 설계가 매우 우수함.',
      },
      {
        'number': '2.2',
        'title': 'Self-Healing Build-Phase Updates',
        'subtitle': '빌드/레이아웃 단계 크래시 방지',
        'tableHeaders': ['구분', 'GetX', 'getx_distil'],
        'tableRows': [
          _row([
            '빌드 중 상태 변경',
            _del('setState() during build 크래시'),
            _ok('PostFrameCallback으로 안전 지연')
          ]),
          _row([
            '감지 방식',
            '없음',
            _ok('SchedulerBinding.instance.schedulerPhase 검사')
          ]),
        ],
        'code':
            'void refresh() {\n  final phase = SchedulerBinding.instance.schedulerPhase;\n  if (phase == SchedulerPhase.persistentCallbacks || \n      phase == SchedulerPhase.midFrameMicrotasks) {\n    scheduler.addPostFrameCallback((_) { /* 안전한 업데이트 */ });\n  } else {\n    /* 즉시 업데이트 */\n  }\n}',
        'evaluation': '실제 프로덕션에서 빈번히 발생하는 크래시를 원천 차단. 실용적 가치가 매우 높음.',
      },
      {
        'number': '2.3',
        'title': 'RxList Microtask Batching',
        'subtitle': '성능 차별화의 핵심',
        'tableHeaders': ['구분', 'GetX', 'getx_distil'],
        'tableRows': [
          _row(['100번 add()', '100번 리빌드', _ok('1회 리빌드')]),
          _row([
            '방식',
            '각 변경 연산 즉시 refresh()',
            _ok('Dirty-Flag + Microtask 파이프라인')
          ]),
          _row([
            'sort() / shuffle()',
            'N번 알림 (ListMixin 기본)',
            _ok('1회 알림 (오버라이드)')
          ]),
        ],
        'code':
            'void _autoBatchRefresh() {\n  if (_isNotificationScheduled) return;  // ← drop-path\n  _isNotificationScheduled = true;\n  scheduleMicrotask(() {\n    refresh();\n    notifyStream();\n    _isNotificationScheduled = false;\n  });\n}',
        'evaluation':
            '10,000건 리스트 대량 추가 시 오리지널은 10,000번 리빌드 → getx_distil은 1회 리빌드. 가장 실감나는 성능 차이를 제공하는 기능.',
      },
      {
        'number': '2.4',
        'title': '100% Tree-Scoped DI (BindingWidget)',
        'subtitle': '아키텍처 패러다임 전환',
        'tableHeaders': ['구분', 'GetX', 'getx_distil'],
        'tableRows': [
          _row(['DI 범위', '전역 싱글톤 위주', _ok('위젯 트리 스코프 + 전역 하이브리드')]),
          _row(['동일 타입 멀티 인스턴스', '충돌 발생', _ok('완벽 격리')]),
          _row(['수명 관리', 'Get.delete() 수동 호출', _ok('위젯 dispose 시 자동 GC')]),
          _row(['GoRouter 호환성', '낮음', _ok('완벽 호환')]),
          _row([
            'Context 없는 접근',
            'Get.find<T>()',
            _ok('Get.find<T>() (WeakReference 캐시)')
          ]),
        ],
        'code':
            'GoRoute(\n  path: \'/settings\',\n  builder: (context, state) => BindingWidget(\n    bindings: [Bind<SettingsController>(() => SettingsController())],\n    child: const SettingsPage(),\n  ),\n)',
        'evaluation':
            'GoRouter 시대에 완벽하게 부합하는 설계. GetX의 가장 큰 아키텍처 결함을 해결한 핵심 차별점.',
      },
      {
        'number': '2.5',
        'title': 'FIFO Sequential Pipeline (updateSequential)',
        'subtitle': '고주파 비동기 레이스 컨디션 방지',
        'tableHeaders': ['구분', 'GetX', 'getx_distil'],
        'tableRows': [
          _row(['비동기 업데이트 순서', '보장 안 됨 (레이스 컨디션)', _ok('엄격한 FIFO 순차 실행')]),
          _row(['방식', '없음', _ok('Completer 체인')]),
        ],
        'code':
            'Future<void> updateSequential(Future<T> Function(T currentValue) action) {\n  final completer = Completer<void>();\n  _lastUpdateFuture = _lastUpdateFuture.then((_) async {\n    final newValue = await action(value);\n    value = newValue;\n    completer.complete();\n  });\n  return completer.future;\n}',
        'evaluation': '실시간 시세, 채팅, 센서 데이터 등 고주파 시나리오에서 필수적. 실용적 가치가 높음.',
      },
      {
        'number': '2.6',
        'title': 'RxSList / RxS — Status-Aware Reactive Types',
        'subtitle': '독창적 추가 기능 (오리지널에 없음)',
        'tableHeaders': ['구분', 'GetX', 'getx_distil'],
        'tableRows': [
          _row([
            '리스트 상태 관리',
            '별도 isLoading/errorMessage 옵저버블 필요',
            _ok('리스트 자체에 내장')
          ]),
          _row(['단일 값 상태 관리', 'StateMixin (컨트롤러 레벨)', _ok('값 자체에 내장 (RxS)')]),
          _row(['UI 분기 처리', '수동 if-else', _ok('.on() 빌더로 선언적 처리')]),
        ],
        'code':
            'Obx(() => items.on(\n  loading: () => const CircularProgressIndicator(),\n  loaded:  (data) => ListView.builder(...),\n  empty:   () => const Text(\'No items\'),\n  error:   (msg) => Text(\'Error: \$msg\'),\n));',
        'evaluation':
            '별도의 isLoading / errorMessage 옵저버블이 불필요해지는 DX 혁신. 오리지널에 없는 독창적 기여.',
      },
      {
        'number': '2.7',
        'title': 'Strict Async Obx Validation',
        'subtitle': '비동기 Obx 안티패턴 차단',
        'tableHeaders': ['구분', 'GetX', 'getx_distil'],
        'tableRows': [
          _row(['Obx 내 async/await', '조용히 오동작', _ok('즉시 FlutterError throw')]),
          _row(['Rx 미검출 시', '예외 발생', _ok('debugPrint 경고 (v1.0.3+)')]),
        ],
        'evaluation': '디버깅 시간을 크게 절약하는 안전망. 프로덕션 안정성도 확보.',
      },
      {
        'number': '2.8',
        'title': 'High-Visibility DI Debugging',
        'subtitle': 'DI 조회 실패 시 디버그 정보',
        'tableHeaders': ['구분', 'GetX', 'getx_distil'],
        'tableRows': [
          _row([
            '에러 메시지',
            '"Controller not found"',
            _ok('요청 위젯명 + 조상 계층 경로 + 전역/불멸 서비스 목록')
          ]),
        ],
        'code':
            '📍 Requested Context Widget: Builder\n🌳 Search Path (Ancestor Widgets):\n   Builder -> Column -> Scaffold -> ...\n🌐 Registered Global Services:\n   CounterController, AuthService\n🌟 Registered Immortal Services:\n   DatabaseService',
        'evaluation': 'DI 문제 원인 파악 시간을 극적으로 단축. 개발자 경험(DX)의 결정적 개선.',
      },
    ],
    'nextSection': 'sacrificed',
    'nextTitle': '3. GetX 대비 희생된 기능',
  },

  // ── Sacrificed ──
  'sacrificed': {
    'type': 'sacrificed',
    'title': 'GetX 대비 희생된 기능',
    'tableHeaders': ['기능', 'GetX', 'getx_distil', '영향도'],
    'tableRows': [
      _row([
        '라우팅 엔진',
        'GetPageRoute, Get.to(), Get.off() 등',
        _del('❌ 제거'),
        'GoRouter/Navigator 사용 필요'
      ]),
      _row([
        'GetDialog/BottomSheet',
        '전역 오버레이 관리',
        _del('❌ 제거'),
        'Flutter 기본 API 사용'
      ]),
      _row(['GetConnect', 'HTTP 클라이언트 내장', _del('❌ 제거'), 'dio/http 패키지 사용']),
      _row(['GetStorage', '로컬 스토리지', _del('❌ 제거'), 'shared_preferences 등 사용']),
      _row(['GetUtils', '유틸리티 함수', _del('❌ 제거'), '표준 Dart/Flutter API 사용']),
      _row([
        'GetX Binding (클래스)',
        'GetPage + Binding 패턴',
        _del('❌ 제거'),
        'BindingWidget으로 대체'
      ]),
      _row(['interval Worker', '주기적 실행 워커', _del('❌ 제거'), 'Timer로 대체']),
      _row([
        'SmartManagement',
        '메모리 관리 정책',
        _del('❌ 제거'),
        'BindingWidget Auto-GC로 대체'
      ]),
    ],
    'infoCard':
        '라우팅/다이얼로그/네트워크/스토리지 제거는 의도적인 설계 결정이며, 현대 Flutter 생태계에서는 오히려 바람직함. 각 책임을 전문 패키지에 위임하는 것이 더 나은 아키텍처.',
    'nextSection': 'quality',
    'nextTitle': '4. 코드 품질 평가',
  },

  // ── Quality ──
  'quality': {
    'type': 'quality',
    'title': '코드 품질 평가',
    'goodPoints': [
      '극도의 간결성 — 핵심 로직 ~1,200줄로 오리지널의 10% 이하. 유지보수성 압도적',
      'Zero External Dependency — Flutter SDK만 의존. 공급망 리스크 제로',
      '치밀한 테스트 — 1,594줄의 테스트 코드. RxList 배칭, WeakReference 좀비 방지, 형제 컨트롤러 onClose 교차 참조 등 엣지 케이스까지 커버',
      '일관된 아키텍처 — 모든 Rx 타입이 GetListenable → RxInterface 계층을 따름. 확장성이 뛰어남',
      '메모리 안전성 — WeakReference 캐시, dispose 순서 보장(onDelete 먼저 → weakRegistry 제거), Expando 기반 GetView 컨텍스트 관리',
      '문서 품질 — 영문/한국어 README가 완벽하게 동기화됨. 예제 앱이 모든 기능을 커버',
    ],
    'improvePoints': [
      'GetxController.update() + ID 기반 리빌드 미지원 — 오리지널에서 GetBuilder와 함께 쓰이는 ID 기반 부분 리빌드가 약화됨',
      'RxSList 초기 상태 모호성 — 생성자에 데이터를 넣어도 초기 status는 loading. 이미 데이터가 있는 경우 loaded로 시작하는 옵션이 있으면 좋겠음',
      'interval Worker 미지원 — 주기적 실행 워커가 없어 Timer로 대체해야 함',
      'Get.find tag + context 조합 불가 — context가 제공되면 tag가 무시됨',
      'RxList의 operator []= 오버라이드 — 커스텀 리스트 연산이 배칭 없이 각각 알림을 발생시킬 가능성',
    ],
    'scores': [
      {
        'item': '아키텍처 설계',
        'score': '⭐⭐⭐⭐⭐',
        'note': '트리 스코프 DI + 하이브리드 폴백은 모범 사례'
      },
      {
        'item': '성능 최적화',
        'score': '⭐⭐⭐⭐⭐',
        'note': 'Fast-Path + 배칭 + FIFO 파이프라인 3종 세트'
      },
      {
        'item': '메모리 안전성',
        'score': '⭐⭐⭐⭐⭐',
        'note': 'WeakReference, dispose 순서 보장, Expando 정리'
      },
      {
        'item': 'DX (개발자 경험)',
        'score': '⭐⭐⭐⭐½',
        'note': 'RxSList/RxS의 .on() 패턴이 탁월. 디버그 메시지 우수'
      },
      {
        'item': 'API 호환성',
        'score': '⭐⭐⭐⭐',
        'note': '.obs, Obx, Get.find 등 핵심 API는 동일'
      },
      {
        'item': '테스트 커버리지',
        'score': '⭐⭐⭐⭐',
        'note': '핵심 기능은 잘 커버. 엣지 케이스 일부 보완 여지'
      },
      {
        'item': '문서/예제',
        'score': '⭐⭐⭐⭐⭐',
        'note': '영/한 README + GoRouter 기반 예제 앱이 완벽'
      },
      {
        'item': '생태계 호환성',
        'score': '⭐⭐⭐⭐',
        'note': 'GoRouter 친화적. 기존 GetX 프로젝트 마이그레이션 필요'
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
        'title': '철학적 차이',
        'tableHeaders': ['차원', 'getx_distil', 'Riverpod 3.0'],
        'tableRows': [
          _row(['패러다임', '명령형 (Imperative)', '선언형 (Declarative)']),
          _row(['상태 생성', '런타임 new + .obs', '컴파일타임 코드 제너레이션']),
          _row([
            'DI 방식',
            '수동 등록 (Get.put, BindingWidget)',
            '자동 등록 (@riverpod 어노테이션)'
          ]),
          _row([
            '학습 곡선',
            _ok('낮음 (GetX와 동일)'),
            '높음 (Provider, Notifier, AsyncNotifier 등)'
          ]),
          _row(['보일러플레이트', _ok('최소 (.obs 한 줄)'), '중간~높음 (어노테이션 + 생성 코드)']),
          _row(['빌드 의존성', _ok('없음'), 'build_runner 필수']),
        ],
        'evaluation':
            'getx_distil의 명령형 패러다임은 학습 곡선이 낮고 보일러플레이트가 적어 빠른 개발에 유리. Riverpod 3.0의 선언형 접근은 체계적이지만 학습과 설정이 더 필요.',
      },
      {
        'subtype': 'codeCompare',
        'number': '5.2',
        'title': '상태 관리 방식',
        'description': 'getx_distil — 명령형 옵저버블',
        'code1':
            '// 컨트롤러 내부\nfinal count = 0.obs;           // RxInt\nfinal items = <String>[].ops;  // RxSList\n\n// 값 변경\ncount.value++;\nitems.add(\'new item\');\n\n// UI\nObx(() => Text(\'\${controller.count.value}\'))',
        'description2': 'Riverpod 3.0 — 선언형 Notifier',
        'code2':
            '@riverpod\nclass Counter extends _\$Counter {\n  @override\n  int build() => 0;\n  void increment() => state++;\n}\n\n// UI\nConsumerWidget: ref.watch(counterProvider)',
        'tableHeaders': ['비교', 'getx_distil', 'Riverpod 3.0'],
        'tableRows': [
          _row(['상태 선언', '.obs 한 줄', '클래스 + 어노테이션 + build()']),
          _row(['상태 변경', '.value = 직접 대입', '메서드 호출로 state 변경']),
          _row(['반응형 등록', '자동 (값 읽으면 추적)', '자동 (ref.watch 시 추적)']),
          _row(['Nullable 상태', 'Rxn<T>', 'AsyncValue<T>']),
          _row(['코드량', _ok('~3줄'), '~8줄']),
        ],
        'evaluation':
            '단순 상태 관리의 DX는 getx_distil이 압도적으로 간결. Riverpod은 상태 변경 메서드를 명시적으로 정의해야 하지만, 이는 상태 변경 경로의 추적성 측면에서는 장점.',
      },
      {
        'subtype': 'codeCompare',
        'number': '5.3',
        'title': '비동기 상태 관리',
        'description': 'getx_distil — RxSList / RxS',
        'code1':
            'final items = <User>[].ops; // RxSList<User>\n\n// 수동 상태 전환\nitems.assignAll(fetchedUsers);     // status → loaded\nitems.error = \'Network failure\';\nitems.status = RxListStatus.error;\n\n// UI\nObx(() => items.on(\n  loading: () => CircularProgressIndicator(),\n  loaded:  (data) => ListView.builder(...),\n  error:   (msg) => Text(\'Error: \$msg\'),\n))',
        'description2': 'Riverpod 3.0 — AsyncNotifier + AsyncValue',
        'code2':
            '@riverpod\nclass Users extends _\$Users {\n  @override\n  FutureOr<List<User>> build() => _fetchUsers();\n\n  Future<void> refresh() async {\n    state = const AsyncLoading();\n    state = await AsyncValue.guard(() => _fetchUsers());\n  }\n}\n\n// UI\nref.watch(usersProvider).when(\n  loading: () => CircularProgressIndicator(),\n  data:    (users) => ListView.builder(...),\n  error:   (err, _) => Text(\'Error: \$err\'),\n)',
        'tableHeaders': ['비교', 'getx_distil', 'Riverpod 3.0'],
        'tableRows': [
          _row([
            '비동기 상태 표현',
            'RxSList / RxS (수동 상태 전환)',
            'AsyncValue<T> (자동 상태 관리)'
          ]),
          _row(['로딩→데이터 전환', '수동 assignAll()', '자동 (Future 완료 시)']),
          _row(['에러 처리', '수동 error + status', '자동 (AsyncValue.guard)']),
          _row(['캐싱/재시도', '수동 구현', '내장 (keepAlive, retry, invalidate)']),
          _row(['DX', '직관적이나 수동', '자동화되나 학습 필요']),
        ],
        'evaluation':
            '순수 비동기 API 호출 시나리오에서는 Riverpod 3.0의 AsyncNotifier가 더 안전하고 자동화됨. getx_distil은 상태 전환을 수동으로 제어해야 하지만, 그만큼 유연성이 높음.',
      },
      {
        'subtype': 'codeCompare',
        'number': '5.4',
        'title': 'DI (의존성 주입)',
        'description': 'getx_distil — 하이브리드 DI',
        'code1':
            '// 트리 스코프\nBindingWidget(\n  bindings: [Bind<Controller>(() => Controller())],\n  child: const MyPage(),\n)\n\n// 전역\nGet.put<Controller>(Controller());\n\n// 조회\nGet.find<Controller>(context);  // 스코프 우선 → 전역 폴백\nGet.find<Controller>();         // 전역 + WeakReference 폴백',
        'description2': 'Riverpod 3.0 — Provider 스코프',
        'code2':
            '// 선언적 등록 (@riverpod 어노테이션으로 자동)\n@riverpod\nclass Controller extends _\$Controller {\n  @override\n  void build() { ... }\n}\n\n// 조회\nref.read(controllerProvider);                              // 단발 읽기\nref.watch(controllerProvider);                             // 반응형 구독\nref.watch(controllerProvider.select((s) => s.count));      // 선택적 구독',
        'tableHeaders': ['비교', 'getx_distil', 'Riverpod 3.0'],
        'tableRows': [
          _row([
            '등록 방식',
            '수동 (Get.put, BindingWidget)',
            '자동 (어노테이션 + 코드 제너레이션)'
          ]),
          _row(['스코프', '위젯 트리 스코프 + 전역', 'Provider 스코프 (오버라이드 가능)']),
          _row([
            '동적 멀티 인스턴스',
            _ok('BindingWidget 중첩으로 자연스럽게'),
            'family 한정자 (컴파일타임)'
          ]),
          _row([
            'Context 없는 접근',
            _ok('✅ Get.find<T>()'),
            '❌ ref 필요 (위젯/함수 내에서만)'
          ]),
          _row(['수명 관리', '위젯 dispose 시 자동 GC', 'ref.onDispose() 콜백']),
          _row([
            '멀티 인스턴스 격리',
            _ok('직관적 (BindingWidget 중첩)'),
            '엄격 (family + override)'
          ]),
        ],
        'evaluation':
            'Context 없는 접근은 getx_distil의 확실한 장점. 컨트롤러 내부에서 다른 컨트롤러를 참조할 때 ref가 필요 없음. Riverpod의 family는 컴파일타임에 타입 안전하지만, 런타임에 동적으로 N개의 인스턴스를 생성하는 패턴에서는 getx_distil의 BindingWidget이 더 유연.',
      },
      {
        'subtype': 'table',
        'number': '5.5',
        'title': '성능',
        'subtitle': 'RxList 대량 변경',
        'tableHeaders': ['시나리오', 'getx_distil', 'Riverpod 3.0'],
        'tableRows': [
          _row([
            '10,000건 add()',
            _ok('1회 리빌드 (Microtask Batching)'),
            'N회 리빌드 (상태 변경 시마다)'
          ]),
          _row(
              ['for 루프 내 변경', _ok('자동 배칭'), '수동 배칭 필요 또는 단일 state = [...] 할당']),
          _row([
            'Obx 외부 Rx 읽기',
            _ok('Zero-cost (isTracking 플래그)'),
            'N/A (Provider 읽기는 항상 ref 필요)'
          ]),
        ],
        'evaluation':
            '고빈도 리스트 변경 시나리오에서 getx_distil의 Microtask Batching이 Riverpod 대비 명확한 성능 우위. Riverpod에서 동일 효과를 얻으려면 개발자가 직접 배칭 로직을 구현하거나 단일 state = newList 할당으로 전체 교체해야 함.',
      },
      {
        'subtype': 'table',
        'number': '5.6',
        'title': '안전 장치',
        'tableHeaders': ['안전 기능', 'getx_distil', 'Riverpod 3.0'],
        'tableRows': [
          _row([
            '빌드 단계 상태 변경',
            _ok('자가 치유 (PostFrameCallback 지연)'),
            'N/A (빌드 중 ref.watch만 허용)'
          ]),
          _row([
            '비동기 Obx 검증',
            _ok('엄격 차단 (FlutterError)'),
            'N/A (AsyncNotifier가 분리되어 있음)'
          ]),
          _row(
              ['DI 조회 실패 메시지', _ok('상세 디버그 리포트'), 'ProviderNotFoundException']),
          _row([
            '레이스 컨디션 방지',
            _ok('FIFO 파이프라인 (updateSequential)'),
            'N/A (순차 실행 보장 없음)'
          ]),
          _row(['타입 안전성', '런타임 (동적 Get.find<T>())', _ok('컴파일타임 (코드 제너레이션)')]),
        ],
        'evaluation':
            '런타임 안전망은 getx_distil이 더 풍부. 컴파일타임 타입 안전성은 Riverpod 3.0의 압도적 장점.',
      },
      {
        'subtype': 'table',
        'number': '5.7',
        'title': '코드 제너레이션 vs 제로 의존',
        'tableHeaders': ['항목', 'getx_distil', 'Riverpod 3.0'],
        'tableRows': [
          _row(['build_runner 필요', _ok('❌'), _ok('✅ (필수)')]),
          _row(['생성 코드 (.g.dart)', '없음', '있음']),
          _row(['빌드 시간 영향', _ok('없음'), '증가 (코드 제너레이션 오버헤드)']),
          _row(['IDE 지원', '일반 Dart 분석', '생성 코드 탐색 필요']),
          _row(['CI/CD 복잡도', _ok('낮음'), '높음 (build_runner 스텝 추가)']),
          _row([
            '외부 의존성',
            _ok('0개'),
            '여러 개 (riverpod, riverpod_annotation, build_runner 등)'
          ]),
        ],
        'evaluation':
            '소규모/개인 프로젝트에서는 getx_distil의 제로 의존이 강력한 장점. 대규모 팀 프로젝트에서는 Riverpod의 코드 제너레이션이 리팩토링 안전성을 제공.',
      },
      {
        'subtype': 'table',
        'number': '5.8',
        'title': '테스트 용이성',
        'tableHeaders': ['항목', 'getx_distil', 'Riverpod 3.0'],
        'tableRows': [
          _row([
            '단위 테스트',
            'Get.put(mock) → Get.find()',
            'ProviderContainer(overrides: [...])'
          ]),
          _row([
            '위젯 테스트',
            'BindingWidget으로 스코프 제어',
            'ProviderScope(overrides: [...])'
          ]),
          _row(['모킹 편의성', '보통 (수동 등록/교체)', _ok('우수 (override 체계가 체계적)')]),
          _row(['테스트 격리', 'Get.reset() 수동 호출', _ok('ProviderContainer 자동 격리')]),
        ],
        'evaluation':
            'Riverpod 3.0의 override 체계가 테스트 모킹에 더 체계적. getx_distil은 직관적이지만 전역 상태 오염 가능성 존재.',
      },
    ],
    'matrix': [
      {'item': '학습 곡선', 'g': 5, 'r': 3},
      {'item': '보일러플레이트', 'g': 5, 'r': 3},
      {'item': '컴파일타임 안전성', 'g': 3, 'r': 5},
      {'item': '비동기 상태 자동화', 'g': 4, 'r': 5},
      {'item': '리스트 대량 변경 성능', 'g': 5, 'r': 3},
      {'item': 'DI 유연성', 'g': 5, 'r': 4},
      {'item': 'Context 없는 접근', 'g': 5, 'r': 2},
      {'item': '테스트/모킹 체계', 'g': 4, 'r': 5},
      {'item': '빌드 복잡도', 'g': 5, 'r': 3},
      {'item': '리팩토링 안전성', 'g': 3, 'r': 5},
      {'item': '메모리 관리 정밀도', 'g': 4, 'r': 5},
      {'item': '런타임 안전망', 'g': 5, 'r': 3},
      {'item': '외부 의존성', 'g': 5, 'r': 3},
      {'item': '다국어/테마', 'g': 4, 'r': 2},
    ],
    'guide': {
      'winnerTitle': 'getx_distil이 적합한 경우',
      'winnerIcon': Icons.electric_bolt_rounded,
      'winnerColor': AppTheme.googleBlue,
      'winnerItems': [
        '🚀 빠른 프로토타이핑 / MVP — 보일러플레이트 최소, 즉시 시작',
        '📱 소규모~중규모 앱 — 복잡한 아키텍처 오버헤드 불필요',
        '🔄 GoRouter 기반 라우팅 — BindingWidget과 완벽 호환',
        '📊 대량 리스트 조작 — RxList 배칭이 필수적인 데이터 헤비 앱',
        '🧑‍💻 GetX 경험자 — 동일한 DX, 마이그레이션 비용 최소',
        '⚡ 빌드 시간 민감 — build_runner 없이 즉시 개발'
      ],
      'loserTitle': 'Riverpod 3.0이 적합한 경우',
      'loserIcon': Icons.verified_rounded,
      'loserColor': AppTheme.googleGreen,
      'loserItems': [
        '🏢 대규모 팀 프로젝트 — 컴파일타임 안전성이 리팩토링 보호',
        '🧪 테스트 주도 개발(TDD) — override 체계가 모킹에 최적',
        '📡 비동기 중심 앱 — API 호출/캐싱/재시도가 핵심인 앱',
        '🔒 엄격한 상태 관리 — 상태 변경 경로를 명시적으로 통제',
        '🏗️ 장기 유지보수 — 코드 제너레이션이 리팩토링 안전망 제공'
      ],
    },
    'nextSection': 'conclusion',
    'nextTitle': '6. 종합 결론',
  },

  // ── Conclusion ──
  'conclusion': {
    'type': 'conclusion',
    'title': '종합 결론',
    'cards': [
      {
        'icon': Icons.compare_arrows_rounded,
        'color': AppTheme.googleBlue,
        'cardTitle': 'getx_distil vs GetX',
        'quote': 'getx_distil은 GetX의 "과잉"을 정확히 제거하고 "핵심"을 정제하는 데 성공한 라이브러리입니다.',
        'paragraphs': [
          'GetX가 "프레임워크"라면, getx_distil은 "마이크로 엔진"입니다. 라우팅, 다이얼로그, 네트워크, 스토리지를 과감히 제거하고, 상태 관리와 DI에만 집중한 설계 결정은 현대 Flutter 생태계(GoRouter, dio, shared_preferences 등)의 발전 방향과 완벽히 부합합니다.',
          '특히 Fast-Path Tracking, RxList Microtask Batching, Tree-Scoped DI 3가지는 오리지널 대비 명확하고 측정 가능한 성능/안정성 우위를 제공하며, RxSList/RxS는 오리지널에 없는 독창적 기여입니다.',
          '기존 GetX 사용자에게는 .obs → Obx → Get.find라는 동일한 DX를 제공하면서, GoRouter 환경에서의 메모리 누수와 스코프 충돌 문제를 근본적으로 해결합니다. 신규 프로젝트에서는 GetX 대비 분명한 우위가 있습니다.',
        ],
      },
      {
        'icon': Icons.swap_horiz_rounded,
        'color': AppTheme.googleGreen,
        'cardTitle': 'getx_distil vs Riverpod 3.0',
        'quote': 'getx_distil과 Riverpod 3.0은 경쟁 관계가 아니라 보완 관계에 가깝습니다.',
        'paragraphs': [
          'getx_distil은 "가장 적은 코드로 가장 빠르게"라는 목표에 최적화된 경량 엔진. Riverpod 3.0은 "가장 안전하게, 가장 체계적으로"라는 목표에 최적화된 프레임워크.',
          'getx_distil의 RxList 배칭, Fast-Path Tracking, Self-Healing Build-Phase는 Riverpod에도 없는 독창적 최적화이며, 특히 고빈도 데이터 조작 시나리오에서는 Riverpod 대비 명확한 성능 우위를 가집니다.',
          '반면 Riverpod 3.0의 컴파일타임 타입 안전성과 체계적인 비동기 상태 관리는 대규모 프로젝트에서 빛을 발합니다. 프로젝트의 규모, 팀의 성숙도, 데이터 조작 패턴에 따라 선택하면 됩니다.',
        ],
      },
    ],
    'footerText': '작성일: 2026-06-10\n대상 버전: getx_distil v1.1.3',
  },
};

// ── 위젯 클래스 ──
class ComparisonPage extends StatefulWidget {
  final String section;
  const ComparisonPage({super.key, this.section = 'overview'});

  @override
  State<ComparisonPage> createState() => _ComparisonPageState();
}

class _ComparisonPageState extends State<ComparisonPage> {
  late final ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (mounted) setState(() => _scrollOffset = _scrollController.offset);
    });
  }

  @override
  void didUpdateWidget(ComparisonPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.section != oldWidget.section) {
      _scrollController.jumpTo(0.0);
      _scrollOffset = 0.0;
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double sw = MediaQuery.of(context).size.width;
    final bool isMobile = sw < 800;
    final meta = _sectionMeta[widget.section] ?? _sectionMeta['overview']!;

    return Scaffold(
      backgroundColor: AppTheme.bg,
      endDrawer: isMobile ? const AppDrawer() : null,
      body: Stack(
        children: [
          const ParticleField(),
          Positioned.fill(
            child: Column(
              children: [
                const SizedBox(height: 70.0),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isMobile)
                        SidebarTocComparison(activePath: widget.section),
                      Expanded(
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          padding: EdgeInsets.symmetric(
                            horizontal: isMobile ? 24.0 : 48.0,
                            vertical: 32.0,
                          ),
                          child: Center(
                            child: Container(
                              constraints: const BoxConstraints(maxWidth: 900),
                              child: _buildContent(meta, isMobile),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(scrollOffset: _scrollOffset),
          ),
        ],
      ),
    );
  }

  // ── Content Router ──
  Widget _buildContent(Map<String, dynamic> meta, bool isMobile) {
    switch (meta['type'] as String) {
      case 'overview':
        return _buildOverview(meta, isMobile);
      case 'improvements':
        return _buildImprovements(meta, isMobile);
      case 'sacrificed':
        return _buildSacrificed(meta, isMobile);
      case 'quality':
        return _buildQuality(meta, isMobile);
      case 'riverpod':
        return _buildRiverpod(meta, isMobile);
      case 'conclusion':
        return _buildConclusion(meta, isMobile);
      default:
        return _buildOverview(meta, isMobile);
    }
  }

  // ── SECTION: Overview ──
  Widget _buildOverview(Map<String, dynamic> meta, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(meta['title']),
        const SizedBox(height: 8.0),
        for (final badge in (meta['infoBadges'] as List<String>))
          Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded,
                    size: 14, color: AppTheme.textMuted),
                const SizedBox(width: 6.0),
                Text(badge,
                    style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12.0,
                        fontFamily: 'Google Sans Mono')),
              ],
            ),
          ),
        const SizedBox(height: 32.0),
        _sectionTitle(meta['sectionTitle']),
        const SizedBox(height: 16.0),
        _buildComparisonTable(
          headers: meta['tableHeaders'].cast<String>(),
          rows: _resolveRows(meta['tableRows']),
          isMobile: isMobile,
        ),
        const SizedBox(height: 48.0),
        _nextSectionHint(meta['nextTitle'], meta['nextSection'], isMobile),
        const SizedBox(height: 80.0),
      ],
    );
  }

  // ── SECTION: Improvements ──
  Widget _buildImprovements(Map<String, dynamic> meta, bool isMobile) {
    final items = meta['items'] as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(meta['title']),
        const SizedBox(height: 32.0),
        for (int i = 0; i < items.length; i++)
          Padding(
            padding: EdgeInsets.only(bottom: i < items.length - 1 ? 48.0 : 0),
            child: _buildImprovementCard(items[i], isMobile),
          ),
        const SizedBox(height: 48.0),
        _nextSectionHint(meta['nextTitle'], meta['nextSection'], isMobile),
        const SizedBox(height: 80.0),
      ],
    );
  }

  Widget _buildImprovementCard(Map<String, dynamic> item, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${item['number']} ${item['title']}',
                style: const TextStyle(
                    fontFamily: 'Google Sans Flex',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.textPrimary)),
            const SizedBox(height: 4.0),
            Text(item['subtitle'] ?? '',
                style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 13.0,
                    fontStyle: FontStyle.italic)),
          ],
        ),
        const SizedBox(height: 20.0),
        _buildComparisonTable(
          headers: (item['tableHeaders'] as List<String>),
          rows: _resolveRows(item['tableRows']),
          isMobile: isMobile,
        ),
        if (item['code'] != null) ...[
          const SizedBox(height: 20.0),
          const Text('CODE',
              style: TextStyle(
                  fontFamily: 'Google Sans Flex',
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textMuted,
                  letterSpacing: 1.5)),
          const SizedBox(height: 8.0),
          CodeBlock(code: item['code'] as String, language: 'dart'),
        ],
        const SizedBox(height: 20.0),
        _evaluationBadge(item['evaluation'] as String),
      ],
    );
  }

  // ── SECTION: Sacrificed ──
  Widget _buildSacrificed(Map<String, dynamic> meta, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(meta['title']),
        const SizedBox(height: 32.0),
        _buildComparisonTable(
          headers: meta['tableHeaders'].cast<String>(),
          rows: _resolveRows(meta['tableRows']),
          isMobile: isMobile,
        ),
        if (meta['infoCard'] != null) ...[
          const SizedBox(height: 24.0),
          GlassCard(
            glowColor: AppTheme.googleBlue,
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded,
                    color: AppTheme.googleBlue, size: 20),
                const SizedBox(width: 12.0),
                Expanded(
                    child: Text(meta['infoCard'] as String,
                        style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14.0,
                            height: 1.5))),
              ],
            ),
          ),
        ],
        const SizedBox(height: 48.0),
        _nextSectionHint(meta['nextTitle'], meta['nextSection'], isMobile),
        const SizedBox(height: 80.0),
      ],
    );
  }

  // ── SECTION: Quality ──
  Widget _buildQuality(Map<String, dynamic> meta, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(meta['title']),
        const SizedBox(height: 32.0),
        _sectionTitle('✅ 우수한 점'),
        const SizedBox(height: 16.0),
        _buildQualityList(meta['goodPoints'] as List<String>, warning: false),
        const SizedBox(height: 32.0),
        _sectionTitle('⚠️ 개선 여지'),
        const SizedBox(height: 16.0),
        _buildQualityList(meta['improvePoints'] as List<String>, warning: true),
        const SizedBox(height: 40.0),
        _sectionTitle('📊 종합 점수'),
        const SizedBox(height: 16.0),
        _buildScoreTable(meta['scores'] as List, isMobile),
        const SizedBox(height: 48.0),
        _nextSectionHint(meta['nextTitle'], meta['nextSection'], isMobile),
        const SizedBox(height: 80.0),
      ],
    );
  }

  // ── SECTION: Riverpod ──
  Widget _buildRiverpod(Map<String, dynamic> meta, bool isMobile) {
    final subsections = meta['subsections'] as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(meta['title']),
        const SizedBox(height: 32.0),
        for (int i = 0; i < subsections.length; i++)
          Padding(
            padding:
                EdgeInsets.only(bottom: i < subsections.length - 1 ? 40.0 : 0),
            child: _buildSubsection(subsections[i], isMobile),
          ),
        const SizedBox(height: 40.0),
        _buildComprehensiveMatrix(meta['matrix'] as List, isMobile),
        const SizedBox(height: 40.0),
        _buildSelectionGuide(meta['guide'] as Map<String, dynamic>, isMobile),
        const SizedBox(height: 48.0),
        _nextSectionHint(meta['nextTitle'], meta['nextSection'], isMobile),
        const SizedBox(height: 80.0),
      ],
    );
  }

  Widget _buildSubsection(Map<String, dynamic> item, bool isMobile) {
    final subtype = item['subtype'] as String;
    if (subtype == 'table') {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${item['number']} ${item['title']}',
                  style: const TextStyle(
                      fontFamily: 'Google Sans Flex',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary)),
              if (item['subtitle'] != null) ...[
                const SizedBox(height: 4.0),
                Text(item['subtitle'] as String,
                    style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 13.0,
                        fontStyle: FontStyle.italic)),
              ],
            ],
          ),
          const SizedBox(height: 20.0),
          _buildComparisonTable(
              headers: item['tableHeaders'].cast<String>(),
              rows: _resolveRows(item['tableRows']),
              isMobile: isMobile),
          const SizedBox(height: 20.0),
          _evaluationBadge(item['evaluation'] as String),
        ],
      );
    }
    // subtype == 'codeCompare'
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('${item['number']} ${item['title']}',
            style: const TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary)),
        const SizedBox(height: 20.0),
        Text(item['description'] as String,
            style: const TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: AppTheme.googleBlue)),
        const SizedBox(height: 8.0),
        CodeBlock(code: item['code1'] as String, language: 'dart'),
        const SizedBox(height: 20.0),
        Text(item['description2'] as String,
            style: const TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: AppTheme.textSecondary)),
        const SizedBox(height: 8.0),
        CodeBlock(code: item['code2'] as String, language: 'dart'),
        const SizedBox(height: 20.0),
        _buildComparisonTable(
            headers: item['tableHeaders'].cast<String>(),
            rows: _resolveRows(item['tableRows']),
            isMobile: isMobile),
        const SizedBox(height: 20.0),
        _evaluationBadge(item['evaluation'] as String),
      ],
    );
  }

  // ── SECTION: Conclusion ──
  Widget _buildConclusion(Map<String, dynamic> meta, bool isMobile) {
    final cards = meta['cards'] as List;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(meta['title']),
        const SizedBox(height: 32.0),
        for (final card in cards) ...[
          _buildConclusionCard(card as Map<String, dynamic>),
          const SizedBox(height: 32.0),
        ],
        const SizedBox(height: 80.0),
      ],
    );
  }

  Widget _buildConclusionCard(Map<String, dynamic> card) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(card['cardTitle'] as String,
            style: const TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary)),
        const SizedBox(height: 16.0),
        const Divider(height: 1, color: Color(0xFFDADCE0)),
        const SizedBox(height: 16.0),
        Text(card['quote'] as String,
            style: const TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: AppTheme.textPrimary,
                height: 1.5)),
        const SizedBox(height: 16.0),
        for (final p in (card['paragraphs'] as List<String>)) ...[
          Text(p,
              style: const TextStyle(
                  color: AppTheme.textSecondary, fontSize: 14.0, height: 1.6)),
          const SizedBox(height: 12.0),
        ],
      ],
    );
  }

  // ── Helper: Row Resolver ──
  List<List<dynamic>> _resolveRows(List<dynamic> rawRows) {
    return rawRows.map((row) {
      final cells = row as List<dynamic>;
      return cells.map((cell) {
        if (cell is Map<String, dynamic>) {
          return _renderCell(cell);
        }
        return cell as String;
      }).toList();
    }).toList();
  }

  Widget _renderCell(Map<String, dynamic> cell) {
    switch (cell['type'] as String) {
      case 'success':
        return Text(cell['text'] as String,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppTheme.googleGreen,
                fontSize: 12.5));
      case 'delete':
        return Text(cell['text'] as String,
            style: const TextStyle(color: AppTheme.googleRed, fontSize: 12.5));
      case 'star':
        return Text('⭐' * (cell['count'] as int),
            style: const TextStyle(fontSize: 13.0));
      default:
        return Text('${cell['text']}',
            style:
                const TextStyle(fontSize: 13.0, color: AppTheme.textSecondary));
    }
  }

  // ── Shared Widgets ──
  Widget _sectionHeader(String title) {
    return Text(title,
        style: const TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 28.0,
            fontWeight: FontWeight.w800,
            color: AppTheme.textPrimary,
            letterSpacing: -1.0));
  }

  Widget _sectionTitle(String text) {
    return Text(text,
        style: const TextStyle(
            fontFamily: 'Google Sans Flex',
            fontSize: 22.0,
            fontWeight: FontWeight.w700,
            color: AppTheme.textPrimary));
  }

  Widget _evaluationBadge(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppTheme.googleBlue.withOpacity(0.04),
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppTheme.googleBlue.withOpacity(0.12)),
      ),
      child: Text('평가: $text',
          style: const TextStyle(
              color: AppTheme.textSecondary, fontSize: 13.5, height: 1.5)),
    );
  }

  Widget _buildQualityList(List<String> points, {required bool warning}) {
    return Column(
      children: points.map((pt) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                  warning
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline_rounded,
                  color: warning ? AppTheme.googleYellow : AppTheme.googleGreen,
                  size: 18.0),
              const SizedBox(width: 12.0),
              Expanded(
                  child: Text(pt,
                      style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14.0,
                          height: 1.5))),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildComparisonTable({
    required List<String> headers,
    required List<List<dynamic>> rows,
    required bool isMobile,
  }) {
    if (isMobile) {
      return Column(
        children: rows.map((row) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: GlassCard(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${row[0]}',
                      style: const TextStyle(
                          fontFamily: 'Google Sans Flex',
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary)),
                  const SizedBox(height: 8.0),
                  for (int i = 1; i < headers.length && i < row.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${headers[i]}: ',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppTheme.textMuted,
                                  fontSize: 12.0)),
                          Expanded(
                              child: row[i] is Widget
                                  ? row[i] as Widget
                                  : Text('${row[i]}',
                                      style: const TextStyle(
                                          color: AppTheme.textSecondary,
                                          fontSize: 13.0))),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.black.withOpacity(0.06))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(
                      AppTheme.googleBlue.withOpacity(0.04)),
                  border: TableBorder(
                    horizontalInside: BorderSide(
                        color: Colors.black.withOpacity(0.03), width: 0.3),
                    verticalInside: BorderSide(
                        color: Colors.black.withOpacity(0.03), width: 0.3),
                  ),
                  columnSpacing: 24.0,
                  columns: headers
                      .map((h) => DataColumn(
                          label: Text(h,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.0,
                                  color: AppTheme.textPrimary))))
                      .toList(),
                  rows: rows.map((row) {
                    return DataRow(
                      cells: row.asMap().entries.map((entry) {
                        final cell = entry.value;
                        return DataCell(cell is Widget
                            ? cell
                            : Text('$cell',
                                style: const TextStyle(
                                    fontSize: 13.0,
                                    color: AppTheme.textSecondary)));
                      }).toList(),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildScoreTable(List<dynamic> scores, bool isMobile) {
    if (isMobile) {
      return Column(
        children: scores.map((s) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: GlassCard(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(s['item'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: AppTheme.textPrimary)),
                      Text(s['score'], style: const TextStyle(fontSize: 14.0)),
                    ],
                  ),
                  const SizedBox(height: 6.0),
                  Text(s['note'],
                      style: const TextStyle(
                          color: AppTheme.textSecondary, fontSize: 12.5)),
                ],
              ),
            ),
          );
        }).toList(),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraints.maxWidth),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.black.withOpacity(0.06))),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(
                      AppTheme.googleBlue.withOpacity(0.04)),
                  border: TableBorder(
                      horizontalInside: BorderSide(
                          color: Colors.black.withOpacity(0.03), width: 0.3)),
                  columnSpacing: 32.0,
                  columns: const [
                    DataColumn(
                        label: Text('평가 항목',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('점수',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('비고',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: scores.map((s) {
                    return DataRow(cells: [
                      DataCell(Text(s['item'],
                          style: const TextStyle(fontSize: 13.0))),
                      DataCell(Text(s['score'],
                          style: const TextStyle(fontSize: 13.0))),
                      DataCell(Text(s['note'],
                          style: const TextStyle(
                              fontSize: 13.0, color: AppTheme.textMuted))),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildComprehensiveMatrix(List<dynamic> matrix, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('5.9 📊 종합 비교 매트릭스',
            style: TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 18.0,
                fontWeight: FontWeight.w700,
                color: AppTheme.textPrimary)),
        const SizedBox(height: 16.0),
        if (isMobile)
          Column(
            children: matrix.map((m) {
              final g = m['g'] as int;
              final r = m['r'] as int;
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GlassCard(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Text(m['item'],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: AppTheme.textPrimary)),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _matrixCell('getx_distil', g),
                          const Text('vs',
                              style: TextStyle(
                                  color: AppTheme.textMuted, fontSize: 12)),
                          _matrixCell('Riverpod', r),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          )
        else
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12.0),
                        border:
                            Border.all(color: Colors.black.withOpacity(0.06))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: DataTable(
                        headingRowColor: WidgetStateProperty.all(
                            AppTheme.googleBlue.withOpacity(0.04)),
                        border: TableBorder(
                            horizontalInside: BorderSide(
                                color: Colors.black.withOpacity(0.03),
                                width: 0.3)),
                        columnSpacing: 32.0,
                        columns: const [
                          DataColumn(
                              label: Text('평가 항목',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('getx_distil',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('Riverpod 3.0',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                          DataColumn(
                              label: Text('승자',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: matrix.map((m) {
                          final g = m['g'] as int;
                          final r = m['r'] as int;
                          final winner = g > r
                              ? 'getx_distil'
                              : (r > g ? 'Riverpod' : '동률');
                          return DataRow(cells: [
                            DataCell(Text(m['item'],
                                style: const TextStyle(fontSize: 13.0))),
                            DataCell(Text('⭐' * g,
                                style: const TextStyle(fontSize: 13.0))),
                            DataCell(Text('⭐' * r,
                                style: const TextStyle(fontSize: 13.0))),
                            DataCell(Text(winner,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.bold,
                                    color: winner == 'getx_distil'
                                        ? AppTheme.googleBlue
                                        : (winner == 'Riverpod'
                                            ? AppTheme.googleGreen
                                            : AppTheme.textMuted)))),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  Widget _matrixCell(String label, int score) {
    return Column(
      children: [
        Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 11.0,
                color: AppTheme.textMuted)),
        const SizedBox(height: 4.0),
        Text('⭐' * score, style: const TextStyle(fontSize: 12.0)),
      ],
    );
  }

  Widget _buildSelectionGuide(Map<String, dynamic> guide, bool isMobile) {
    return GlassCard(
      glowColor: AppTheme.googleGreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.route_rounded, color: AppTheme.googleGreen, size: 24),
              SizedBox(width: 12.0),
              Text('5.10 🎯 선택 가이드',
                  style: TextStyle(
                      fontFamily: 'Google Sans Flex',
                      fontSize: 18.0,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.textPrimary)),
            ],
          ),
          const SizedBox(height: 24.0),
          _guideSection(
              guide['winnerTitle'],
              guide['winnerIcon'] as IconData,
              guide['winnerColor'] as Color,
              (guide['winnerItems'] as List<String>)),
          const SizedBox(height: 20.0),
          _guideSection(
              guide['loserTitle'],
              guide['loserIcon'] as IconData,
              guide['loserColor'] as Color,
              (guide['loserItems'] as List<String>)),
        ],
      ),
    );
  }

  Widget _guideSection(
      String title, IconData icon, Color color, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8.0),
            Text(title,
                style: TextStyle(
                    fontFamily: 'Google Sans Flex',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: color)),
          ],
        ),
        const SizedBox(height: 12.0),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.circle_rounded,
                    size: 6, color: AppTheme.textMuted),
                const SizedBox(width: 12.0),
                Expanded(
                    child: Text(item,
                        style: const TextStyle(
                            color: AppTheme.textSecondary,
                            fontSize: 14.0,
                            height: 1.4))),
              ],
            ),
          ),
      ],
    );
  }

  Widget _nextSectionHint(String label, String targetSection, bool isMobile) {
    return GlassCard(
      glowColor: AppTheme.googleBlue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Next section',
                  style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold)),
              const SizedBox(height: 4.0),
              Text('Explore $label',
                  style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_rounded,
                color: AppTheme.googleBlue),
            onPressed: () => context.go('/comparison/$targetSection'),
          ),
        ],
      ),
    );
  }
}

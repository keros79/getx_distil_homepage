import 'package:getx_distil/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          // About Page
          'about.name': 'Danny Kang',
          'about.role': 'Flutter Framework & Architecture Engineer',
          'about.section_title': 'ABOUT THE DEVELOPER',
          'about.intro_1':
              'Hello! I am a passionate mobile and web framework engineer interested in Flutter, state machines, reactive programming, and modular Dependency Injection (DI) system design. My goal is to build tools that maximize developer productivity and maintain high visual excellence.',
          'about.intro_2':
              'I pioneered "getx_distil" out of a practical need to integrate the reactive DX paradigms of GetX with modern declarative routers like GoRouter, completely removing unnecessary legacy global overlays and fixing concurrency issues.',
          'about.github_title': 'GitHub Profile',
          'about.github_desc':
              'Checkout repositories, open-source utilities, and contribute to getx_distil packages.',
          'about.github_link': 'Visit GitHub ->',
          'about.pub_title': 'pub.dev Packages',
          'about.pub_desc':
              'Explore published packages, benchmarks, documentation scoring, and installations.',
          'about.pub_link': 'Visit pub.dev ->',

          // Guide Page
          'guide.breadcrumb_1': 'DOCUMENTATION',
          'guide.breadcrumb_2': 'GETTING STARTED',
          'guide.title': 'Quick Start Guide',
          'guide.description':
              'Learn how to integrate getx_distil and deploy high-performance reactive architectures in under 5 minutes.',
          'guide.step1_title': '1. Add getx_distil dependency',
          'guide.step1_desc':
              'Add getx_distil to your Flutter project using command line or configure it in pubspec.yaml file.',
          'guide.step2_title': '2. Set up GetMaterialApp',
          'guide.step2_desc':
              'Configure the router and theme systems inside your core entry point using GetMaterialApp.',
          'guide.step3_title': '3. Create a Controller & View',
          'guide.step3_desc':
              'Structure your controller classes with .obs properties. Bind the view elements with Obx wrappers to catch updates reactively.',
          'guide.next_label': 'Next up',
          'guide.next_title': 'Explore Reactive State (Rx & Obx)',
        },
      };
}

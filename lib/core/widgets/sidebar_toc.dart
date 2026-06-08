import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_theme.dart';

class SidebarToc extends StatelessWidget {
  final String activePath;

  const SidebarToc({
    super.key,
    required this.activePath,
  });

  static final List<Map<String, String>> sections = [
    {
      'title': '1. Reactive State (Rx & Obx)',
      'path': 'reactive-state',
      'icon': '🎯',
    },
    {
      'title': '2. Global Dependency Injection',
      'path': 'global-di',
      'icon': '🚀',
    },
    {
      'title': '3. Widget Tree Scoped DI',
      'path': 'binding-widget',
      'icon': '🌳',
    },
    {
      'title': '4. Global Persistent Services',
      'path': 'getx-service',
      'icon': '🌐',
    },
    {
      'title': '5. Background Side-Effects',
      'path': 'worker',
      'icon': '🛠️',
    },
    {
      'title': '6. Declarative Async Branching',
      'path': 'state-mixin',
      'icon': '🔄',
    },
    {
      'title': '7. Internationalization (i18n)',
      'path': 'i18n',
      'icon': '🌍',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      decoration: BoxDecoration(
        color: AppTheme.bg,
        border: Border(
          right: BorderSide(
            color: Colors.white.withOpacity(0.06),
            width: 1.0,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            child: Text(
              'API REFERENCE',
              style: TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
                color: AppTheme.textMuted,
                letterSpacing: 1.5,
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Expanded(
            child: ListView.builder(
              itemCount: sections.length,
              itemBuilder: (context, index) {
                final section = sections[index];
                final isSelected = activePath == section['path'];
                
                return _TocItem(
                  title: section['title']!,
                  icon: section['icon']!,
                  isSelected: isSelected,
                  onTap: () => context.go('/api/${section['path']}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TocItem extends StatefulWidget {
  final String title;
  final String icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _TocItem({
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<_TocItem> createState() => _TocItemState();
}

class _TocItemState extends State<_TocItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: widget.isSelected
              ? AppTheme.googleBlue.withOpacity(0.08)
              : (_isHovered ? Colors.white.withOpacity(0.03) : Colors.transparent),
          border: Border.all(
            color: widget.isSelected
                ? AppTheme.googleBlue.withOpacity(0.2)
                : Colors.transparent,
            width: 1.0,
          ),
        ),
        child: ListTile(
          onTap: widget.onTap,
          dense: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          leading: Text(
            widget.icon,
            style: const TextStyle(fontSize: 16.0),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              fontFamily: 'Google Sans Flex',
              fontSize: 14.0,
              fontWeight: widget.isSelected ? FontWeight.w600 : FontWeight.w400,
              color: widget.isSelected ? Colors.white : AppTheme.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

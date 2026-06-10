import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../app_theme.dart';

class SidebarTocComparison extends StatelessWidget {
  final String activePath;

  const SidebarTocComparison({
    super.key,
    required this.activePath,
  });

  static final List<Map<String, String>> sections = [
    {'title': '1. Overview', 'path': 'overview'},
    {'title': '2. Improvements', 'path': 'improvements'},
    {'title': '3. Features Sacrificed', 'path': 'sacrificed'},
    {'title': '4. Code Quality Assessment', 'path': 'quality'},
    {'title': '5. vs Riverpod 3.0', 'path': 'riverpod'},
    {'title': '6. Conclusion', 'path': 'conclusion'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      decoration: BoxDecoration(
        color: AppTheme.bg,
        border: Border(
          right: BorderSide(
            color: Colors.black.withOpacity(0.06),
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
              'COMPARISON',
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
                  isSelected: isSelected,
                  onTap: () => context.go('/comparison/${section['path']}'),
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
  final bool isSelected;
  final VoidCallback onTap;

  const _TocItem({
    required this.title,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Material(
          color: widget.isSelected
              ? AppTheme.googleBlue.withOpacity(0.08)
              : (_isHovered
                  ? Colors.black.withOpacity(0.03)
                  : Colors.transparent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(
              color: widget.isSelected
                  ? AppTheme.googleBlue.withOpacity(0.2)
                  : Colors.transparent,
              width: 1.0,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: ListTile(
            onTap: widget.onTap,
            dense: true,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            title: Text(
              widget.title,
              style: TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 14.0,
                fontWeight:
                    widget.isSelected ? FontWeight.w600 : FontWeight.w400,
                color: widget.isSelected
                    ? AppTheme.textPrimary
                    : AppTheme.textSecondary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

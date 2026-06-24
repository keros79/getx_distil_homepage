import 'package:flutter/material.dart';

class ScrollResetter extends StatefulWidget {
  final Widget child;
  final String param;
  final ScrollController scrollController;

  const ScrollResetter({
    super.key,
    required this.child,
    required this.param,
    required this.scrollController,
  });

  @override
  State<ScrollResetter> createState() => _ScrollResetterState();
}

class _ScrollResetterState extends State<ScrollResetter> {
  @override
  void initState() {
    super.initState();
    _scrollToTop();
  }

  @override
  void didUpdateWidget(covariant ScrollResetter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.param != oldWidget.param) {
      _scrollToTop();
    }
  }

  void _scrollToTop() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.scrollController.hasClients) {
        widget.scrollController.jumpTo(0.0);
      }
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

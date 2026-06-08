import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/atom-one-light.dart';
import '../app_theme.dart';

class CodeBlock extends StatefulWidget {
  final String code;
  final String language;

  const CodeBlock({
    super.key,
    required this.code,
    this.language = 'dart',
  });

  @override
  State<CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock> {
  bool _isCopied = false;

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.code));
    setState(() => _isCopied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _isCopied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.08),
          width: 1.0,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 48.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: HighlightView(
                  widget.code.trim(),
                  language: widget.language,
                  theme: atomOneLightTheme,
                  padding: EdgeInsets.zero,
                  textStyle: const TextStyle(
                    fontFamily: 'Google Sans Mono',
                    fontSize: 13.5,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            
            // Header Bar
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40.0,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.03),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black.withOpacity(0.05),
                      width: 1.0,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Mac OS style window controls
                    Row(
                      children: [
                        _circleControl(const Color(0xFFFF5F56)),
                        const SizedBox(width: 6.0),
                        _circleControl(const Color(0xFFFFBD2E)),
                        const SizedBox(width: 6.0),
                        _circleControl(const Color(0xFF27C93F)),
                      ],
                    ),
                    
                    // Copy Button
                    InkWell(
                      onTap: _copyToClipboard,
                      borderRadius: BorderRadius.circular(6.0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(_isCopied ? 0.2 : 0.08),
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(6.0),
                          color: _isCopied 
                              ? AppTheme.googleGreen.withOpacity(0.1) 
                              : Colors.transparent,
                        ),
                        child: AnimatedSize(
                          duration: const Duration(milliseconds: 150),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _isCopied ? Icons.check : Icons.copy_rounded,
                                size: 14.0,
                                color: _isCopied ? AppTheme.googleGreen : AppTheme.textSecondary,
                              ),
                              const SizedBox(width: 6.0),
                              Text(
                                _isCopied ? 'Copied!' : 'Copy',
                                style: TextStyle(
                                  color: _isCopied ? AppTheme.googleGreen : AppTheme.textSecondary,
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _circleControl(Color color) {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:getx_distil/get.dart';
import 'package:go_router/go_router.dart';

import '../controllers/comparison_controller.dart';
import '../core/app_theme.dart';
import '../core/widgets/nav_bar.dart';
import '../core/widgets/sidebar_toc_comparison.dart';
import '../core/widgets/code_block.dart';
import '../core/widgets/next_nav_card.dart';
import '../core/widgets/app_drawer.dart';
import '../core/widgets/scroll_resetter.dart';

// ── Widget Class ──
class ComparisonPage extends GetView<ComparisonController> {
  final String section;
  const ComparisonPage({super.key, this.section = 'overview'});

  @override
  Widget build(BuildContext context) {
    controller.loadSamplesForSection(section);
    final double sw = MediaQuery.of(context).size.width;
    final bool isMobile = sw < 800;

    return Scaffold(
      backgroundColor: AppTheme.bg,
      endDrawer: isMobile ? const AppDrawer() : null,
      appBar: const NavBar(),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMobile) SidebarTocComparison(activePath: section),
          Expanded(
            child: ScrollResetter(
              param: section,
              scrollController: controller.scrollController,
              child: SingleChildScrollView(
                controller: controller.scrollController,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 24.0 : 48.0,
                  vertical: 32.0,
                ),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Builder(
                      builder: (context) {
                        final meta = controller.sectionMeta[section] ??
                            controller.sectionMeta['overview']!;
                        return _buildContent(meta, isMobile, context);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Content Router ──
  Widget _buildContent(
      Map<String, dynamic> meta, bool isMobile, BuildContext context) {
    switch (meta['type'] as String) {
      case 'overview':
        return _buildOverview(meta, isMobile, context);
      case 'improvements':
        return _buildImprovements(meta, isMobile, context);
      case 'sacrificed':
        return _buildSacrificed(meta, isMobile, context);
      case 'quality':
        return _buildQuality(meta, isMobile, context);
      case 'riverpod':
        return _buildRiverpod(meta, isMobile, context);
      case 'conclusion':
        return _buildConclusion(meta, isMobile);
      default:
        return _buildOverview(meta, isMobile, context);
    }
  }

  // ── SECTION: Overview ──
  Widget _buildOverview(
      Map<String, dynamic> meta, bool isMobile, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(meta['title']),
        const SizedBox(height: 32.0),
        _sectionTitle(meta['sectionTitle']),
        const SizedBox(height: 16.0),
        _buildComparisonTable(
          headers: meta['tableHeaders'].cast<String>(),
          rows: _resolveRows(meta['tableRows'], isMobile: isMobile),
          isMobile: isMobile,
        ),
        const SizedBox(height: 48.0),
        _nextSectionHint(
            meta['nextTitle'], meta['nextSection'], isMobile, context),
        const SizedBox(height: 80.0),
      ],
    );
  }

  // ── SECTION: Improvements ──
  Widget _buildImprovements(
      Map<String, dynamic> meta, bool isMobile, BuildContext context) {
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
        _nextSectionHint(
            meta['nextTitle'], meta['nextSection'], isMobile, context),
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
          rows: _resolveRows(item['tableRows'], isMobile: isMobile),
          isMobile: isMobile,
        ),
        if (item['codeKey'] != null) ...[
          const SizedBox(height: 20.0),
          const Text('CODE',
              style: TextStyle(
                  fontFamily: 'Google Sans Flex',
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textMuted,
                  letterSpacing: 1.5)),
          const SizedBox(height: 8.0),
          _buildRxCodeBlock(item['codeKey'] as String),
        ],
        const SizedBox(height: 20.0),
        _evaluationBadge(item['evaluation'] as String),
      ],
    );
  }

  // ── SECTION: Sacrificed ──
  Widget _buildSacrificed(
      Map<String, dynamic> meta, bool isMobile, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(meta['title']),
        const SizedBox(height: 32.0),
        _buildComparisonTable(
          headers: meta['tableHeaders'].cast<String>(),
          rows: _resolveRows(meta['tableRows'], isMobile: isMobile),
          isMobile: isMobile,
        ),
        if (meta['infoCard'] != null) ...[
          const SizedBox(height: 24.0),
          Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(
                color: Colors.black.withOpacity(0.06),
                width: 1.0,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  blurRadius: 12.0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
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
        _nextSectionHint(
            meta['nextTitle'], meta['nextSection'], isMobile, context),
        const SizedBox(height: 80.0),
      ],
    );
  }

  // ── SECTION: Quality ──
  Widget _buildQuality(
      Map<String, dynamic> meta, bool isMobile, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _sectionHeader(meta['title']),
        const SizedBox(height: 32.0),
        _sectionTitle('Strengths'),
        const SizedBox(height: 16.0),
        _buildQualityList(meta['goodPoints'] as List<String>, warning: false),
        const SizedBox(height: 32.0),
        _sectionTitle('Areas for Improvement'),
        const SizedBox(height: 16.0),
        _buildQualityList(meta['improvePoints'] as List<String>, warning: true),
        const SizedBox(height: 40.0),
        _sectionTitle('Overall Score'),
        const SizedBox(height: 16.0),
        _buildScoreTable(meta['scores'] as List, isMobile),
        const SizedBox(height: 48.0),
        _nextSectionHint(
            meta['nextTitle'], meta['nextSection'], isMobile, context),
        const SizedBox(height: 80.0),
      ],
    );
  }

  // ── SECTION: Riverpod ──
  Widget _buildRiverpod(
      Map<String, dynamic> meta, bool isMobile, BuildContext context) {
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
        _nextSectionHint(
            meta['nextTitle'], meta['nextSection'], isMobile, context),
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
              rows: _resolveRows(item['tableRows'], isMobile: isMobile),
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
        _buildRxCodeBlock(item['codeKey1'] as String),
        const SizedBox(height: 20.0),
        Text(item['description2'] as String,
            style: const TextStyle(
                fontFamily: 'Google Sans Flex',
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: AppTheme.textSecondary)),
        const SizedBox(height: 8.0),
        _buildRxCodeBlock(item['codeKey2'] as String),
        const SizedBox(height: 20.0),
        _buildComparisonTable(
            headers: item['tableHeaders'].cast<String>(),
            rows: _resolveRows(item['tableRows'], isMobile: isMobile),
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
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.06),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 12.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(card['cardTitle'] as String,
              style: const TextStyle(
                  fontFamily: 'Google Sans Flex',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary)),
          const SizedBox(height: 12.0),
          Container(
            height: 2,
            width: 40,
            decoration: BoxDecoration(
              gradient: AppTheme.primaryGradient,
              borderRadius: BorderRadius.circular(1.0),
            ),
          ),
          const SizedBox(height: 20.0),
          Text(card['quote'] as String,
              style: const TextStyle(
                  fontFamily: 'Google Sans Flex',
                  fontSize: 15.5,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                  height: 1.5)),
          const SizedBox(height: 16.0),
          for (final p in (card['paragraphs'] as List<String>)) ...[
            Text(p,
                style: const TextStyle(
                    color: AppTheme.textSecondary,
                    fontSize: 13.5,
                    height: 1.6)),
            const SizedBox(height: 12.0),
          ],
        ],
      ),
    );
  }

  // ── Helper: Row Resolver ──
  List<List<dynamic>> _resolveRows(List<dynamic> rawRows,
      {bool isMobile = false}) {
    return rawRows.map((row) {
      final cells = row as List<dynamic>;
      return cells.map((cell) {
        if (cell is Map<String, dynamic>) {
          return _renderCell(cell, isMobile: isMobile);
        }
        return cell as String;
      }).toList();
    }).toList();
  }

  Widget _renderCell(Map<String, dynamic> cell, {bool isMobile = false}) {
    final double offset = isMobile ? 2.0 : 0.0;
    switch (cell['type'] as String) {
      case 'success':
        return Text(cell['text'] as String,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppTheme.googleGreen,
                fontSize: 12.5 + offset));
      case 'delete':
        return Text(cell['text'] as String,
            style:
                TextStyle(color: AppTheme.googleRed, fontSize: 12.5 + offset));
      case 'star':
        return Text('⭐' * (cell['count'] as int),
            style: TextStyle(fontSize: 13.0 + offset));
      default:
        return Text('${cell['text']}',
            style: TextStyle(
                fontSize: 13.0 + offset, color: AppTheme.textSecondary));
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
        color: AppTheme.googleBlue.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: AppTheme.googleBlue.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.analytics_outlined,
            color: AppTheme.googleBlue,
            size: 20.0,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Google Sans Flex',
                  fontSize: 13.5,
                  height: 1.5,
                  color: AppTheme.textSecondary,
                ),
                children: [
                  const TextSpan(
                    text: 'Evaluation: ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.googleBlue,
                    ),
                  ),
                  TextSpan(text: text),
                ],
              ),
            ),
          ),
        ],
      ),
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
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black.withOpacity(0.06),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 12.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      color: AppTheme.bg,
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black.withOpacity(0.04),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Text(
                      '${row[0]}',
                      style: const TextStyle(
                        fontFamily: 'Google Sans Flex',
                        fontSize: 16.5,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                        letterSpacing: -0.2,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 1;
                            i < headers.length && i < row.length;
                            i++) ...[
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: headers[i].toLowerCase().contains('distil')
                                  ? AppTheme.googleBlue.withOpacity(0.03)
                                  : Colors.black.withOpacity(0.015),
                            ),
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    width: 5,
                                    color: _getLibraryColor(headers[i]),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            headers[i],
                                            style: TextStyle(
                                              fontFamily: 'Google Sans Flex',
                                              fontSize: 13.5,
                                              fontWeight: FontWeight.bold,
                                              color:
                                                  _getLibraryColor(headers[i]),
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          const SizedBox(height: 6.0),
                                          row[i] is Widget
                                              ? row[i] as Widget
                                              : Text(
                                                  '${row[i]}',
                                                  style: TextStyle(
                                                    color: headers[i]
                                                            .toLowerCase()
                                                            .contains('distil')
                                                        ? AppTheme.textPrimary
                                                        : AppTheme
                                                            .textSecondary,
                                                    fontSize: 15.0,
                                                    height: 1.4,
                                                    fontWeight: headers[i]
                                                            .toLowerCase()
                                                            .contains('distil')
                                                        ? FontWeight.w500
                                                        : FontWeight.normal,
                                                  ),
                                                ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                        final isLastColumn = entry.key == row.length - 1;
                        return DataCell(
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: isLastColumn ? 220 : double.infinity,
                            ),
                            child: cell is Widget
                                ? cell
                                : Text('$cell',
                                    softWrap: true,
                                    style: const TextStyle(
                                        fontSize: 13.0,
                                        color: AppTheme.textSecondary)),
                          ),
                        );
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
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: Colors.black.withOpacity(0.06),
                  width: 1.0,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 12.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 5,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [AppTheme.googleBlue, AppTheme.googleGreen],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    s['item'],
                                    style: const TextStyle(
                                      fontFamily: 'Google Sans Flex',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.5,
                                      color: AppTheme.textPrimary,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color:
                                        AppTheme.googleYellow.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: Text(
                                    s['score'],
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              s['note'],
                              style: const TextStyle(
                                color: AppTheme.textSecondary,
                                fontSize: 12.5,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                        label: Text('Category',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Score',
                            style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(
                        label: Text('Note',
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
        const Text('5.9 Comprehensive Comparison Matrix',
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
              final winner =
                  g > r ? 'getx_distil' : (r > g ? 'Riverpod' : 'Tie');
              return Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: Container(
                  padding: const EdgeInsets.all(0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.06),
                      width: 1.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.02),
                        blurRadius: 12.0,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        decoration: BoxDecoration(
                          color: AppTheme.bg,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black.withOpacity(0.04),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            m['item'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Google Sans Flex',
                              fontWeight: FontWeight.w700,
                              fontSize: 14.0,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: _matrixCellWidget(
                                  'getx_distil', g, winner == 'getx_distil'),
                            ),
                            Container(
                              height: 32,
                              width: 1,
                              color: Colors.black.withOpacity(0.06),
                            ),
                            Expanded(
                              child: _matrixCellWidget(
                                  'Riverpod 3.0', r, winner == 'Riverpod'),
                            ),
                          ],
                        ),
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
                              label: Text('Category',
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
                              label: Text('Winner',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold))),
                        ],
                        rows: matrix.map((m) {
                          final g = m['g'] as int;
                          final r = m['r'] as int;
                          final winner = g > r
                              ? 'getx_distil'
                              : (r > g ? 'Riverpod' : 'Tie');
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

  Widget _matrixCellWidget(String label, int score, bool isWinner) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Google Sans Flex',
            fontWeight: isWinner ? FontWeight.bold : FontWeight.w500,
            fontSize: isWinner ? 13.5 : 11.5,
            color: isWinner ? _getLibraryColor(label) : AppTheme.textMuted,
          ),
        ),
        const SizedBox(height: 6.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '⭐' * score,
              style: const TextStyle(fontSize: 12.0),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectionGuide(Map<String, dynamic> guide, bool isMobile) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Colors.black.withOpacity(0.06),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 12.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('comparison.selection_guide'.tr,
              style: const TextStyle(
                  fontFamily: 'Google Sans Flex',
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.textPrimary)),
          const SizedBox(height: 24.0),
          _guideSection(guide['winnerTitle'], guide['winnerColor'] as Color,
              (guide['winnerItems'] as List<String>), true),
          const SizedBox(height: 24.0),
          _guideSection(guide['loserTitle'], guide['loserColor'] as Color,
              (guide['loserItems'] as List<String>), false),
        ],
      ),
    );
  }

  Widget _guideSection(
      String title, Color color, List<String> items, bool isWinner) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: color.withOpacity(0.08),
            borderRadius: BorderRadius.circular(6.0),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Google Sans Flex',
              fontSize: 14.5,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ),
        const SizedBox(height: 14.0),
        for (final item in items)
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  isWinner
                      ? Icons.check_circle_outline_rounded
                      : Icons.arrow_outward_rounded,
                  size: 16.0,
                  color: isWinner ? AppTheme.googleBlue : AppTheme.textMuted,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Text(
                    item,
                    style: const TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 13.5,
                      height: 1.45,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _nextSectionHint(
      String label, String targetSection, bool isMobile, BuildContext context) {
    return NextNavCard(
      label: 'comparison.next_section'.tr,
      title: '${'comparison.explore'.tr} $label',
      glowColor: AppTheme.googleBlue,
      onTap: () => context.go('/comparison/$targetSection'),
    );
  }

  Widget _buildRxCodeBlock(String codeKey) {
    final rxCode = controller.getRxCode(codeKey);
    if (rxCode == null) {
      return const SizedBox.shrink();
    }
    return Obx(
      () => rxCode.on(
        idle: () => const SizedBox(
          height: 100,
          child: Center(
            child: Text(
              'Idle...',
              style: TextStyle(color: AppTheme.textMuted),
            ),
          ),
        ),
        loading: () => Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.02),
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.black.withOpacity(0.04)),
          ),
          child: const Center(
            child: CircularProgressIndicator(color: AppTheme.googleBlue),
          ),
        ),
        loaded: (code) => CodeBlock(code: code ?? '', language: 'dart'),
        error: (error) => Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppTheme.googleRed.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: AppTheme.googleRed.withOpacity(0.12)),
          ),
          child: Text(
            'Error loading code sample: $error',
            style: const TextStyle(color: AppTheme.googleRed),
          ),
        ),
      ),
    );
  }

  Color _getLibraryColor(String header) {
    final lower = header.toLowerCase();
    if (lower.contains('distil')) {
      return AppTheme.googleBlue;
    } else if (lower.contains('getx') || lower.contains('classic')) {
      return Colors.purple;
    } else if (lower.contains('riverpod')) {
      return AppTheme.googleGreen;
    }
    return AppTheme.textMuted;
  }
}

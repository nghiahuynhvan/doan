import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// {@template single_child_scroll_load_view}
/// [SingleChildScrollLoadView] returns a widget
/// that has stateless widget.
///
/// Single child builder and have function to load more by call back
/// Single child builder and have function to onRefresh by call back
/// {@endtemplate}
class SingleChildScrollLoadView extends StatefulWidget {
  /// {@macro single_child_scroll_load_view}
  const SingleChildScrollLoadView({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.marginBottom,
    this.primary,
    this.physics,
    required this.child,
    this.dragStartBehavior = DragStartBehavior.start,
    this.clipBehavior = Clip.hardEdge,
    this.restorationId,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.onLoadMore,
    this.onRefresh,
    this.controller,
  });

  /// scrollDirection
  final Axis scrollDirection;

  /// reverse
  final bool reverse;

  /// primary
  final bool? primary;

  /// physics
  final ScrollPhysics? physics;

  /// padding
  final EdgeInsetsGeometry? padding;

  /// dragStartBehavior
  final DragStartBehavior dragStartBehavior;

  /// keyboardDismissBehavior
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;

  /// restorationId
  final String? restorationId;

  /// clipBehavior
  final Clip clipBehavior;

  /// Load more callback function
  final VoidCallback? onLoadMore;

  /// Refresh callback function
  final AsyncCallback? onRefresh;

  /// Widget
  final Widget child;

  /// Scroll controller
  final ScrollController? controller;

  /// check padding child widget
  final EdgeInsetsGeometry? marginBottom;

  @override
  State<SingleChildScrollLoadView> createState() =>
      _SingleChildLoadMoreWidget();
}

class _SingleChildLoadMoreWidget extends State<SingleChildScrollLoadView>
    with TickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _headerController;

  static const _paddingBottom = 60.0;
  final double _heightOffset = 60.0;
  bool _isEnableLoadMore = true;

  final minimumRefreshTime = 1300; // Milliseconds time

  @override
  void initState() {
    _headerController =
        AnimationController(value: 0.0, vsync: this, upperBound: 1.0);
    _scrollController = widget.controller ?? ScrollController();
    _scrollController.addListener(_scrollListener);
    _isEnableLoadMore = true;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() async {
    final maxScrollExtent =
    _scrollController.position.maxScrollExtent > _paddingBottom
        ? _scrollController.position.maxScrollExtent - (_paddingBottom - 50)
        : _scrollController.position.maxScrollExtent;
    if (_scrollController.position.pixels >= maxScrollExtent &&
        _isEnableLoadMore) {}
  }

  final RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullDown: widget.onRefresh != null,
      enablePullUp: widget.onLoadMore != null,
      controller: _refreshController,
      scrollController: _scrollController,
      onRefresh: _handleRefresh,
      onLoading: _handleLoadMore,
      footer: CustomFooter(builder: (_, __) => Container()),
      header: CustomHeader(
        onOffsetChange: (value) {
          if (_refreshController.headerMode!.value !=
              RefreshStatus.refreshing) {
            _headerController.value = value / 80.0;
          }
        },
        builder: (_, state) {
          return AnimatedBuilder(
            animation: _headerController,
            builder: (context, _) {
              final themeData = Theme.of(context);
              final conditionValue = _refreshController.headerMode!.value ==
                  RefreshStatus.refreshing ||
                  _refreshController.headerMode!.value ==
                      RefreshStatus.completed;
              final Widget materialIndicator = RefreshProgressIndicator(
                semanticsLabel: MaterialLocalizations.of(context)
                    .refreshIndicatorSemanticLabel,
                value: conditionValue ? null : _headerController.value,
                valueColor:
                AlwaysStoppedAnimation(themeData.colorScheme.primary),
                backgroundColor: themeData.canvasColor,
                strokeWidth: RefreshProgressIndicator.defaultStrokeWidth,
              );
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 10),
                height: _heightOffset,
                child: OverflowBox(
                  maxHeight: 48,
                  minHeight: 48,
                  maxWidth: 48,
                  minWidth: 48,
                  alignment: Alignment.topCenter,
                  child: materialIndicator,
                ),
              );
            },
          );
        },
      ),
      child: SingleChildScrollView(
        scrollDirection: widget.scrollDirection,
        reverse: widget.reverse,
        padding: widget.padding,
        primary: widget.primary,
        physics: widget.physics ?? const NeverScrollableScrollPhysics(),
        dragStartBehavior: widget.dragStartBehavior,
        clipBehavior: widget.clipBehavior,
        restorationId: widget.restorationId,
        keyboardDismissBehavior: widget.keyboardDismissBehavior,
        child: Padding(
          padding: widget.marginBottom ??
              const EdgeInsets.only(bottom: _paddingBottom),
          child: widget.child,
        ),
      ),
    );
  }

  Future<void> _delayTime(int milliseconds) async {
    await Future.delayed(Duration(milliseconds: milliseconds));
  }

  Future<void> _handleRefresh() async {
    if (widget.onRefresh == null) return;
    widget.onRefresh!();
    // Delays time refreshing
    await _delayTime(minimumRefreshTime);
    _refreshController.refreshCompleted();
  }

  Future<void> _handleLoadMore() async {
    if (widget.onLoadMore == null) return;
    widget.onLoadMore!();
    _refreshController.loadComplete();
  }
}

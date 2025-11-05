import 'package:driving_license/common_widgets/async_value/async_error_widget.dart';
import 'package:driving_license/utils/async_value_group.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class _AsyncValueWidgetHelper {
  static Widget loading(bool showLoadingIndicator, Widget? loadingWidget) {
    if (!showLoadingIndicator) {
      return const SizedBox.shrink();
    }

    return loadingWidget ?? const Center(child: CircularProgressIndicator());
  }

  static Widget error(Object e, StackTrace st) =>
      Center(child: AsyncErrorWidget(e.toString()));
}

/// A widget that handles different states of an asynchronous value and builds
/// the UI accordingly.
class AsyncValueWidget<T> extends StatelessWidget {
  /// Creates an [AsyncValueWidget] with the given parameters.
  ///
  /// The [value] represents the asynchronous value to handle.
  ///
  /// The [showLoadingIndicator] determines whether to show the loading
  /// indicator.
  ///
  /// The [loadingWidget] is the widget to display when the value is loading.
  /// If this is provided, the [showLoadingIndicator] will be ignored.
  ///
  /// The [builder] is a function that builds the UI based on the data value.
  const AsyncValueWidget({
    super.key,
    required this.value,
    this.showLoadingIndicator = false,
    this.loadingWidget,
    this.builder,
  });
  final AsyncValue<T> value;
  final bool showLoadingIndicator;
  final Widget? loadingWidget;
  final Widget Function(T dataValue)? builder;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: builder != null ? builder! : (data) => const SizedBox.shrink(),
      error: _AsyncValueWidgetHelper.error,
      loading: () => _AsyncValueWidgetHelper.loading(
        showLoadingIndicator,
        loadingWidget,
      ),
    );
  }
}

class Async2ValuesWidget<T, U> extends StatelessWidget {
  const Async2ValuesWidget({
    super.key,
    required this.values,
    this.showLoadingIndicator = false,
    this.loadingWidget,
    this.builder,
  });
  final (AsyncValue<T>, AsyncValue<U>) values;
  final bool showLoadingIndicator;
  final Widget? loadingWidget;
  final Widget Function(T, U)? builder;

  @override
  Widget build(BuildContext context) {
    return AsyncValueGroup.group2(values.$1, values.$2).when(
      data: (t) =>
          builder != null ? builder!(t.$1, t.$2) : const SizedBox.shrink(),
      error: _AsyncValueWidgetHelper.error,
      loading: () => _AsyncValueWidgetHelper.loading(
        showLoadingIndicator,
        loadingWidget,
      ),
    );
  }
}

class Async3ValuesWidget<T, U, V> extends StatelessWidget {
  const Async3ValuesWidget({
    super.key,
    required this.values,
    this.showLoadingIndicator = false,
    this.loadingWidget,
    this.builder,
  });
  final (AsyncValue<T>, AsyncValue<U>, AsyncValue<V>) values;
  final bool showLoadingIndicator;
  final Widget? loadingWidget;
  final Widget Function(T, U, V)? builder;

  @override
  Widget build(BuildContext context) {
    return AsyncValueGroup.group3(values.$1, values.$2, values.$3).when(
      data: (t) => builder != null
          ? builder!(t.$1, t.$2, t.$3)
          : const SizedBox.shrink(),
      error: _AsyncValueWidgetHelper.error,
      loading: () => _AsyncValueWidgetHelper.loading(
        showLoadingIndicator,
        loadingWidget,
      ),
    );
  }
}

class Async4ValuesWidget<T, U, V, W> extends StatelessWidget {
  const Async4ValuesWidget({
    super.key,
    required this.values,
    this.showLoadingIndicator = false,
    this.loadingWidget,
    this.builder,
  });
  final (AsyncValue<T>, AsyncValue<U>, AsyncValue<V>, AsyncValue<W>) values;
  final bool showLoadingIndicator;
  final Widget? loadingWidget;
  final Widget Function(T, U, V, W)? builder;

  @override
  Widget build(BuildContext context) {
    return AsyncValueGroup.group4(
      values.$1,
      values.$2,
      values.$3,
      values.$4,
    ).when(
      data: (t) => builder != null
          ? builder!(t.$1, t.$2, t.$3, t.$4)
          : const SizedBox.shrink(),
      error: _AsyncValueWidgetHelper.error,
      loading: () => _AsyncValueWidgetHelper.loading(
        showLoadingIndicator,
        loadingWidget,
      ),
    );
  }
}

class Async5ValuesWidget<T, U, V, W, X> extends StatelessWidget {
  const Async5ValuesWidget({
    super.key,
    required this.values,
    this.showLoadingIndicator = false,
    this.loadingWidget,
    this.builder,
  });
  final (
    AsyncValue<T>,
    AsyncValue<U>,
    AsyncValue<V>,
    AsyncValue<W>,
    AsyncValue<X>
  ) values;
  final bool showLoadingIndicator;
  final Widget? loadingWidget;
  final Widget Function(T, U, V, W, X)? builder;

  @override
  Widget build(BuildContext context) {
    return AsyncValueGroup.group5(
      values.$1,
      values.$2,
      values.$3,
      values.$4,
      values.$5,
    ).when(
      data: (t) => builder != null
          ? builder!(t.$1, t.$2, t.$3, t.$4, t.$5)
          : const SizedBox.shrink(),
      error: _AsyncValueWidgetHelper.error,
      loading: () => _AsyncValueWidgetHelper.loading(
        showLoadingIndicator,
        loadingWidget,
      ),
    );
  }
}

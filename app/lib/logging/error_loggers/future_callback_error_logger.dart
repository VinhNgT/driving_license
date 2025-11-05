import 'package:driving_license/logging/error_loggers/error_logger.dart';
import 'package:driving_license/logging/logger_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Calls a future and returns an [AsyncSnapshot] of the result.
///
/// Use this instead of [useFuture] when you want to get the [AsyncSnapshot] of
/// a future, but don't want to call the future right away because if the future
/// completes with an error immediately (e.g. by Future.error) before the next
/// [useFuture] cycle is called then it is considered unhandled. This hook
/// advoids this issue by ensure both of them are called at the same time.
///
/// The [initialData], [preserveState] parameters are the same as [useFuture].
///
/// If an error occurs, it is logged using [errorLoggerProvider].
///
/// The calling widget must be a [HookConsumerWidget].
///
/// Example usecase:
/// ```dart
/// final futureFunction =
///   useState<Future<CartItems> Function()?>(null);
///
/// AsyncSnapshot<CartItems> snapshot = useFutureCallbackErrorLogger(
///   futureFunction.value,
///   initialData: null,
///   preserveState: true,
/// );
/// ```
///
/// See also:
///   * [useFuture], which this hook uses internally.
///   * [errorLoggerProvider], which is used to log errors.
///   * [loggerProvider], which is used to log events.
///
AsyncSnapshot<T> useFutureCallbackErrorLogger<T>(
  Future<T> Function()? futureCallback, {
  T? initialData,
  bool preserveState = true,
}) {
  final riverpodRef = useContext() as WidgetRef;

  final future = useMemoized(
    () => futureCallback?.call().onError<Object>((error, stackTrace) {
      riverpodRef.read(errorLoggerProvider).log(
            source: ErrorSource.flutterHook,
            error: error,
            stackTrace: stackTrace,
          );

      return Future<T>.error(error, stackTrace);
    }),
    [futureCallback],
  );

  final snapshot = useFuture(
    future,
    initialData: initialData,
    preserveState: preserveState,
  );

  return snapshot;
}

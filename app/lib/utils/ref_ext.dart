import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

extension AutoDisposeProviderRefX on Ref {
  /// Keeps the [provider] alive by listening to its changes.
  ///
  /// The [provider] is a [ProviderListenable] object that notifies its
  /// listeners its value changes. This function adds a listener to the
  /// [provider] that does nothing when the value changes. This effectively
  /// keeps the [provider] alive and prevents it from being garbage collected.
  void keepProviderAlive<T>(ProviderListenable<T> provider) {
    listen(provider, (previous, next) {});
  }
}

extension WidgetRefX on WidgetRef {
  /// Keeps the [provider] alive by listening to its changes.
  ///
  /// The [provider] is a [ProviderListenable] object that notifies its
  /// listeners its value changes. This function adds a listener to the
  /// [provider] that does nothing when the value changes. This effectively
  /// keeps the [provider] alive and prevents it from being garbage collected.
  void keepProviderAlive<T>(ProviderListenable<T> provider) {
    listen(provider, (previous, next) {});
  }

  /// A hook to watch and retrieve the value of an [AsyncValue] from a
  /// [ProviderListenable].
  ///
  /// The [initialData] parameter is the initial value to be used before any
  /// [AsyncValue] is emitted.
  ///
  T useWatchAsyncValue<T>(
    ProviderListenable<AsyncValue<T>> provider, {
    required T initialData,
  }) {
    final currentState = useRef<T>(initialData);

    return watch(
      provider.select((value) {
        return value.map(
          data: (asyncData) {
            currentState.value = asyncData.value;
            return asyncData;
          },
          error: (asyncError) => asyncError,
          loading: (asyncLoading) => AsyncData(currentState.value),
        );
      }),
    ).requireValue;
  }

  /// Watches an [AsyncValue] from a [ProviderListenable] and converts it to a
  /// new [AsyncValue] using the provided [convert] function.
  ///
  /// The [convert] function takes a value of type [T] and returns a value of
  /// type [V].
  /// The returned [AsyncValue] will have the same state as the original
  /// [AsyncValue], but with the converted value.
  ///
  /// Example usage:
  /// ```dart
  /// final myProvider = FutureProvider<int>((ref) async {
  ///   // ...
  /// });
  ///
  /// final myConvertedValue = watchConvertAsyncValue(myProvider, (value) {
  ///   // Convert the value from int to String
  ///   return value.toString();
  /// });
  /// ```
  AsyncValue<V> watchConvertAsyncValue<T, V>(
    ProviderListenable<AsyncValue<T>> provider,
    V Function(T valueData) convert,
  ) {
    return watch(
      provider.select((value) {
        return value.map<AsyncValue<V>>(
          data: (data) => AsyncData(convert(data.value)),
          error: (error) => AsyncError(error.error, error.stackTrace),
          loading: (loading) => const AsyncLoading(),
        );
      }),
    );
  }

  AsyncValue<V> readConvertAsyncValue<T, V>(
    ProviderListenable<AsyncValue<T>> provider,
    V Function(T valueData) convert,
  ) {
    return read(
      provider.select((value) {
        return value.map<AsyncValue<V>>(
          data: (data) => AsyncData(convert(data.value)),
          error: (error) => AsyncError(error.error, error.stackTrace),
          loading: (loading) => const AsyncLoading(),
        );
      }),
    );
  }
}

import 'package:driving_license/backend/env/application/env_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:vector_graphics/vector_graphics.dart';

/// Error widget that show when an app level error occurs.
class AppErrorWidget extends HookConsumerWidget {
  const AppErrorWidget({
    super.key,
    this.errorMessage,
    this.userFriendlyErrorMessage,
  });

  /// The error message to show when envProvider.showDetailedError is true.
  final String? errorMessage;

  /// The error message to show to the user when envProvider.showDetailedError
  /// is false.
  final String? userFriendlyErrorMessage;

  /// The default error message to show when no error message is provided.
  final String _defaultErrorMessage = 'Đã có lỗi xảy ra';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDetailedError = ref.watch(envProvider).showDetailedError;
    final resolvedErrorMessage = _resolveErrorMessage(showDetailedError);

    return Material(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SvgPicture(
                AssetBytesLoader(
                  'assets/icons/error/_compiled/view_error.svg.vec',
                ),
              ),
              const SizedBox(height: 24),
              Text(
                resolvedErrorMessage,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _resolveErrorMessage(bool showDetailedError) {
    if (showDetailedError) {
      return errorMessage ?? _defaultErrorMessage;
    }
    return userFriendlyErrorMessage ?? _defaultErrorMessage;
  }
}

/// Error widget that show when a widget level error occurs.
@Deprecated('Use AppErrorWidget instead')
class WidgetErrorWidget extends HookConsumerWidget {
  const WidgetErrorWidget({super.key, this.errorMessage});

  final String? errorMessage;
  final String _defaultErrorMessage = 'Đã có lỗi xảy ra';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showDetailedError = ref.watch(envProvider).showDetailedError;
    final resolvedErrorWidget = _resolveErrorWidget(showDetailedError);

    return resolvedErrorWidget;
  }

  Widget _resolveErrorWidget(bool showDetailedError) {
    if (showDetailedError) {
      return Text(
        errorMessage ?? _defaultErrorMessage,
        style: Theme.of(useContext())
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.red),
      );
    }

    return Center(child: Text(_defaultErrorMessage));
  }
}

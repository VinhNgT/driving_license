import 'dart:async';
import 'dart:ui';

import 'package:driving_license/app.dart';
import 'package:driving_license/backend/env/application/env_provider.dart';
import 'package:driving_license/bootstrap/bootstrap_delegate.dart';
import 'package:driving_license/exceptions/app_error_widget.dart';
import 'package:driving_license/logging/error_loggers/async_error_logger.dart';
import 'package:driving_license/logging/error_loggers/error_logger.dart';
import 'package:driving_license/logging/logger_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Bootstrap {
  const Bootstrap(this.delegate);
  final BootstrapDelegate delegate;

  Future<UncontrolledProviderScope> initApp() async {
    final container = ProviderContainer();
    final errorLogger = ErrorLogger(container.read(loggerProvider));

    await runZonedGuarded(() async {
      await delegate.setupServices(container);
    }, (error, stackTrace) {
      errorLogger.log(
        source: ErrorSource.bootstrap,
        error: error,
        stackTrace: stackTrace,
      );
    });

    setupErrorHandlers(container, errorLogger);

    return UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    );
  }

  void setupErrorHandlers(
    ProviderContainer container,
    ErrorLogger errorLogger,
  ) {
    final showDetailedError = container.read(envProvider).showDetailedError;

    // Log all Riverpod asynchronous errors
    container.observers.addAll([
      AsyncErrorLogger(errorLogger),
    ]);

    // Show some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      Future(() async {
        FlutterError.presentError(details);
        // Wait for the previous command to finish
        await Future.delayed(const Duration(milliseconds: 10));
        errorLogger.log(
          source: ErrorSource.flutter,
          error: details.exception,
          stackTrace: details.stack,
        );
      });
    };

    // Handle errors from the underlying platform/OS
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      errorLogger.log(
        source: ErrorSource.rootIsolate,
        error: error,
        stackTrace: stack,
      );
      return true;
    };

    // Show some error UI when any widget in the app fails to build
    ErrorWidget.builder = (FlutterErrorDetails details) {
      final error = details.exception is FlutterError
          ? details.exception as FlutterError
          : null;

      return showDetailedError
          ? ErrorWidget.withDetails(
              message: details.exceptionAsString(),
              error: error,
            )
          : const AppErrorWidget();
    };
  }
}

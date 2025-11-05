import 'package:driving_license/exceptions/app_exception.dart';
import 'package:logger/logger.dart';

enum ErrorSource {
  flutter('Flutter framework'),
  riverpodProvider('Riverpod provider'),
  flutterHook('Flutter hook'),
  rootIsolate('Root isolate'),
  bootstrap('Bootstrap');

  const ErrorSource(this.name);
  final String name;
}

/// A logger that logs all errors and exceptions in the app.
class ErrorLogger {
  ErrorLogger(this.logger);
  final Logger logger;

  void log({
    required ErrorSource source,
    required Object error,
    StackTrace? stackTrace,
  }) {
    switch (error) {
      case (final AppException exception):
        logger.w(
          _formatMessageSource(source),
          error: exception,
          stackTrace: stackTrace,
        );

      case _:
        logger.e(
          _formatMessageSource(source),
          error: error,
          stackTrace: stackTrace,
        );
    }
  }

  String _formatMessageSource(ErrorSource source) {
    return 'Caught by ${source.name}';
  }
}

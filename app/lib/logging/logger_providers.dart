import 'package:driving_license/logging/error_loggers/error_logger.dart';
import 'package:driving_license/logging/log_outputs/level_console_output.dart';
import 'package:driving_license/logging/printers/lower_level_hybird_printer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logger_providers.g.dart';

/// Provides an instance of [Logger].
///
/// All errors, exceptions, and events in the app should be logged using this
/// [Logger] instance.
@Riverpod(keepAlive: true)
Logger logger(Ref ref) {
  const logLevel = Level.debug;

  final logger = Logger(
    filter: ProductionFilter(),
    printer: LowerLevelHybridPrinter(
      lowerPrinter: SimplePrinter(),
      normalPrinter: PrettyPrinter(
        methodCount: 1,
        excludePaths: ['package:driving_license/logging'],
        printEmojis: false,
      ),
      evalLevel: Level.info,
    ),
    output: MultiOutput([
      LevelConsoleOutput(logLevel),
      // Todo: Implement firebase crashlytics
    ]),
  );

  ref.onDispose(logger.close);
  return logger;
}

@Riverpod(keepAlive: true)
ErrorLogger errorLogger(Ref ref) {
  return ErrorLogger(ref.watch(loggerProvider));
}

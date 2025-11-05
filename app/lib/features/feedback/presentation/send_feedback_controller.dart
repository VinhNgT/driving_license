import 'package:dio/dio.dart';
import 'package:driving_license/exceptions/app_exception.dart';
import 'package:driving_license/features/feedback/data/feedback_repository.dart';
import 'package:driving_license/features/feedback/domain/feedback_form.dart';
import 'package:driving_license/logging/logger_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'send_feedback_controller.g.dart';

class SendFeedbackController {
  SendFeedbackController({
    required this.feedbackRepository,
    required this.logger,
    this.cancelToken,
  });

  final FeedbackRepository feedbackRepository;
  final Logger logger;
  final CancelToken? cancelToken;

  Future<void> submitFeedback(FeedbackForm feedback) async {
    try {
      await feedbackRepository.submitFeedback(
        feedback,
        cancelToken: cancelToken,
      );
    } on AppException catch (e, st) {
      logger.e('Submit feedback failed', error: e, stackTrace: st);
      rethrow;
    }
  }
}

@riverpod
SendFeedbackController sendFeedbackController(Ref ref) {
  final feedbackRepository = ref.watch(feedbackRepositoryProvider);
  final logger = ref.watch(loggerProvider);

  final cancelToken = CancelToken();
  ref.onDispose(cancelToken.cancel);

  return SendFeedbackController(
    feedbackRepository: feedbackRepository,
    logger: logger,
    cancelToken: cancelToken,
  );
}

import 'package:dio/dio.dart';
import 'package:driving_license/backend/app_config/app_config.dart';
import 'package:driving_license/exceptions/app_exception.dart';
import 'package:driving_license/features/feedback/domain/feedback_form.dart';
import 'package:driving_license/networking/dio_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'feedback_repository.g.dart';

class FeedbackRepository {
  const FeedbackRepository({required this.dio, required this.feedbackPostLink});

  final Dio dio;
  final String feedbackPostLink;

  Future<Response> _handle302(Response redirectResponse) async {
    final newLocation = redirectResponse.headers['location']![0];
    final response = await dio.get(newLocation);
    return response;
  }

  Future<void> submitFeedback(
    FeedbackForm feedbackForm, {
    CancelToken? cancelToken,
  }) async {
    var response = await dio.post(
      feedbackPostLink,
      data: feedbackForm.toJson(),
      cancelToken: cancelToken,
      options: Options(
        validateStatus: (status) => status == 200 || status == 302,
      ),
    );

    if (response.statusCode == 302) {
      response = await _handle302(response);
    }

    if (response.data case {
      'status': final String status,
      'message': final String message,
    } when status != 'SUCCESS') {
      throw SubmitFeedbackFailedException(message);
    }
  }
}

@riverpod
FeedbackRepository feedbackRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  final feedbackPostLink = ref.watch(
    appConfigProvider.select((value) => value.requireValue.gsFeedbackPostLink),
  );

  return FeedbackRepository(dio: dio, feedbackPostLink: feedbackPostLink);
}

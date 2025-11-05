import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_app_bar_controller.g.dart';

@riverpod
class QuestionAppBarController extends _$QuestionAppBarController {
  @override
  FutureOr<void> build() {}

  Future<QuestionsService> get _questionsService async =>
      ref.read(questionsServiceProvider.future);

  Future<void> deleteAnswer(Question question) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async => (await _questionsService).clearUserAnswer(question),
    );
  }
}

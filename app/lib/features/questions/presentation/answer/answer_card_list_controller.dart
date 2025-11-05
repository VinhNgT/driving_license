import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'answer_card_list_controller.g.dart';

@riverpod
class AnswerCardListController extends _$AnswerCardListController {
  @override
  FutureOr<void> build() {}

  Future<QuestionsService> get _questionsService async =>
      ref.read(questionsServiceProvider.future);

  Future<void> selectAnswer(Question question, int answerOptionIndex) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async =>
          (await _questionsService).saveUserAnswer(question, answerOptionIndex),
    );
  }
}

import 'dart:async';

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/questions/application/question/providers/db_questions_providers.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_progress_providers.g.dart';

@riverpod
Stream<({int questionsCount, UserAnswersSummary summary})> completionStatus(
  Ref ref, {
  Chapter? chapter,
  bool filterDangerQuestions = false,
}) async* {
  final license = await ref.watch(userSelectedLicenseProvider.future);
  final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);

  final questionsCount = await ref.watch(
    dbQuestionsCountProvider(
      chapter: chapter,
      filterDangerQuestions: filterDangerQuestions,
    ).future,
  );
  final userAnswersSummary = userAnswersRepository.watchUserAnswersSummary(
    license,
    chapter: chapter,
    filterDangerAnswers: filterDangerQuestions,
  );

  yield* userAnswersSummary.map((summary) {
    return (questionsCount: questionsCount, summary: summary);
  });
}

@riverpod
FutureOr<int?> firstUnansweredQuestionIndex(
  Ref ref, {
  Chapter? chapter,
  bool filterDangerQuestions = false,
}) async {
  final license = await ref.watch(userSelectedLicenseProvider.future);
  final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);
  final questionsRepository = ref.watch(questionsRepositoryProvider);

  final allQuestionsDbIndexes = await questionsRepository.getQuestionDbIndexes(
    license,
    chapter: chapter,
    filterDangerQuestions: filterDangerQuestions,
  );

  final firstUnansweredLocation = await userAnswersRepository
      .getFirstUnansweredPositionInList(allQuestionsDbIndexes);

  return firstUnansweredLocation;
}

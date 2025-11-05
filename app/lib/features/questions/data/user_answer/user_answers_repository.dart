import 'package:driving_license/backend/database/sembast_provider.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/user_answer/sembast_user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answers_repository.g.dart';

abstract interface class UserAnswersRepository {
  FutureOr<void> saveAnswer(Question question, int selectedAnswerIndex);

  FutureOr<void> clearAnswer(Question question);
  FutureOr<void> clearAllAnswers(
    License license, {
    Chapter? chapter,
    bool filterDangerAnswers = false,
  });
  FutureOr<void> clearDatabase();

  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  FutureOr<UserAnswersMap> getAllAnswers(
    License license, {
    Chapter? chapter,
    bool filterWrongAnswers = false,
    bool filterDangerAnswers = false,
    bool filterDifficultAnswers = false,
  });
  Stream<UserAnswersSummary> watchUserAnswersSummary(
    License license, {
    Chapter? chapter,
    bool filterDangerAnswers = false,
  });

  FutureOr<int?> getFirstUnansweredPositionInList(Iterable<int> dbIndexes);
  FutureOr<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  );

  Stream<int> watchUserAnswersCount(License license);
}

@riverpod
UserAnswersRepository userAnswersRepository(Ref ref) {
  final sembastDatabase = ref.watch(sembastProvider).requireValue;
  return SembastUserAnswersRepository(sembastDatabase);
}

@Riverpod(keepAlive: true)
FutureOr<UserAnswersRepository> inMemoryUserAnswersRepository(Ref ref) async {
  final sembastDatabase = await ref.watch(
    inMemorySembastProvider('user_answers').future,
  );
  ref.onDispose(() => ref.invalidate(inMemorySembastProvider('user_answers')));

  return SembastUserAnswersRepository(sembastDatabase);
}

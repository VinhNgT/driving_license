import 'package:collection/collection.dart';
import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/application/question/questions_handler.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/questions/application/user_answer/user_answers_handler.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_service.g.dart';

class QuestionsService {
  const QuestionsService({
    required this.questionsHandler,
    required this.userAnswersHandler,
  });

  QuestionsService._full({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
  }) : this(
         questionsHandler: FullQuestionsHandler(
           questionsRepository: questionsRepository,
         ),
         userAnswersHandler: DirectUserAnswersHandler(
           userAnswersRepository: userAnswersRepository,
         ),
       );

  QuestionsService._chapter({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required License license,
    required Chapter chapter,
  }) : this(
         questionsHandler: ChapterQuestionsHandler(
           questionsRepository: questionsRepository,
           license: license,
           chapter: chapter,
         ),
         userAnswersHandler: DirectUserAnswersHandler(
           userAnswersRepository: userAnswersRepository,
         ),
       );

  QuestionsService._danger({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required License license,
  }) : this(
         questionsHandler: DangerQuestionsHandler(
           questionsRepository: questionsRepository,
           license: license,
         ),
         userAnswersHandler: DirectUserAnswersHandler(
           userAnswersRepository: userAnswersRepository,
         ),
       );

  QuestionsService._difficult({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required UserAnswersRepository inMemoryUserAnswersRepository,
    required UserAnswersMap difficultQuestionUserAnswers,
    required License license,
  }) : this(
         questionsHandler: DifficultQuestionsHandler(
           questionsRepository: questionsRepository,
           license: license,
         ),
         userAnswersHandler: HidePreviousUserAnswersHandler(
           userAnswersRepository: userAnswersRepository,
           inMemoryUserAnswersRepository: inMemoryUserAnswersRepository,
           userAnswersBeforeStart: difficultQuestionUserAnswers,
         ),
       );

  QuestionsService._wrongAnswers({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required UserAnswersRepository inMemoryUserAnswersRepository,
    required UserAnswersMap wrongUserAnswers,
  }) : this(
         questionsHandler: CustomQuestionListQuestionHandler(
           questionsRepository: questionsRepository,
           sortedQuestionDbIndexes: wrongUserAnswers.questionDbIndexes..sort(),
         ),
         userAnswersHandler: HidePreviousUserAnswersHandler(
           userAnswersRepository: userAnswersRepository,
           inMemoryUserAnswersRepository: inMemoryUserAnswersRepository,
           userAnswersBeforeStart: wrongUserAnswers,
         ),
       );

  QuestionsService._bookmarked({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository userAnswersRepository,
    required List<int> bookmarkedQuestionDbIndexes,
  }) : this(
         questionsHandler: CustomQuestionListQuestionHandler(
           questionsRepository: questionsRepository,
           sortedQuestionDbIndexes: bookmarkedQuestionDbIndexes..sort(),
         ),
         userAnswersHandler: DirectUserAnswersHandler(
           userAnswersRepository: userAnswersRepository,
         ),
       );

  QuestionsService._exam({
    required QuestionsRepository questionsRepository,
    required UserAnswersRepository inMemoryUserAnswersRepository,
    required Exam exam,
  }) : this(
         questionsHandler: CustomQuestionListQuestionHandler(
           questionsRepository: questionsRepository,
           sortedQuestionDbIndexes: exam.questionDbIndexes.sorted(
             (a, b) => a - b,
           ),
         ),
         userAnswersHandler: DirectUserAnswersHandler(
           userAnswersRepository: inMemoryUserAnswersRepository,
         ),
       );

  final QuestionsHandler questionsHandler;
  final UserAnswersHandler userAnswersHandler;
}

extension QuestionsServiceMethods on QuestionsService {
  Future<Question> getQuestion(int questionIndex) async =>
      questionsHandler.getQuestion(questionIndex);

  Future<List<Question>> getQuestionsPage(int pageIndex) async =>
      questionsHandler.getQuestionsPage(pageIndex);

  Future<int> getQuestionCount() async => questionsHandler.getQuestionCount();

  Future<void> saveUserAnswer(Question question, int selectedAnswerIndex) =>
      userAnswersHandler.saveUserAnswer(question, selectedAnswerIndex);

  Future<void> clearUserAnswer(Question question) =>
      userAnswersHandler.clearUserAnswer(question);

  Future<void> clearAllUserAnswers() =>
      userAnswersHandler.clearAllUserAnswers();

  Stream<int?> watchUserSelectedAnswerIndex(Question question) =>
      userAnswersHandler.watchUserSelectedAnswerIndex(question);

  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  ) => userAnswersHandler.getAnswersByQuestionDbIndexes(dbIndexes);
}

@riverpod
FutureOr<QuestionsService> questionsService(Ref ref) async {
  final currentMode = ref.watch(currentQuestionsServiceModeProvider);
  final license = await ref.watch(userSelectedLicenseProvider.future);
  final questionsRepository = ref.watch(questionsRepositoryProvider);
  final bookmarksRepository = ref.watch(bookmarksRepositoryProvider);
  final userAnswersRepository = ref.watch(userAnswersRepositoryProvider);

  switch (currentMode) {
    case FullOperatingMode():
      return QuestionsService._full(
        questionsRepository: questionsRepository,
        userAnswersRepository: userAnswersRepository,
      );

    case ChapterOperatingMode(:final chapter):
      return QuestionsService._chapter(
        questionsRepository: questionsRepository,
        userAnswersRepository: userAnswersRepository,
        license: license,
        chapter: chapter,
      );

    case DangerOperatingMode():
      return QuestionsService._danger(
        questionsRepository: questionsRepository,
        userAnswersRepository: userAnswersRepository,
        license: license,
      );

    case DifficultOperatingMode():
      final difficultQuestionUserAnswers = await userAnswersRepository
          .getAllAnswers(license, filterDifficultAnswers: true);

      return QuestionsService._difficult(
        questionsRepository: questionsRepository,
        userAnswersRepository: userAnswersRepository,
        inMemoryUserAnswersRepository: await ref.refresh(
          inMemoryUserAnswersRepositoryProvider.future,
        ),
        difficultQuestionUserAnswers: difficultQuestionUserAnswers,
        license: license,
      );

    case WrongAnswersOperatingMode():
      final wrongUserAnswers = await userAnswersRepository.getAllAnswers(
        license,
        filterWrongAnswers: true,
      );

      return QuestionsService._wrongAnswers(
        questionsRepository: questionsRepository,
        userAnswersRepository: userAnswersRepository,
        inMemoryUserAnswersRepository: await ref.refresh(
          inMemoryUserAnswersRepositoryProvider.future,
        ),
        wrongUserAnswers: wrongUserAnswers,
      );

    case BookmarkOperatingMode():
      final bookmarks = await bookmarksRepository.getAllBookmarksByLicense(
        license,
      );
      final bookmarkQuestionDbIndexes = bookmarks
          .map((e) => e.questionDbIndex)
          .toList();

      return QuestionsService._bookmarked(
        questionsRepository: questionsRepository,
        userAnswersRepository: userAnswersRepository,
        bookmarkedQuestionDbIndexes: bookmarkQuestionDbIndexes,
      );

    case ExamOperatingMode(:final exam):
      return QuestionsService._exam(
        questionsRepository: questionsRepository,
        inMemoryUserAnswersRepository: await ref.refresh(
          inMemoryUserAnswersRepositoryProvider.future,
        ),
        exam: exam,
      );
  }
}

/// A provider that controls the current mode of the questions service.
@Riverpod(keepAlive: true)
class CurrentQuestionsServiceMode extends _$CurrentQuestionsServiceMode {
  @override
  QuestionsServiceMode build() => const FullOperatingMode();

  set mode(QuestionsServiceMode mode) {
    state = mode;
    ref.notifyListeners();
  }
}

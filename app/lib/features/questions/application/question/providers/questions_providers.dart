import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_providers.g.dart';

@riverpod
FutureOr<Question> questionFuture(Ref ref, int questionIndex) async {
  final pageNumber = questionIndex ~/ QuestionsRepository.pageSize;

  // Typically, when questionPreloadPagesFuture is used, the page
  // (questionsPageFutureProvider(pageNumber)) which contains the question
  // is already loaded, so we can just get the question from it directly without
  // making additional requests to the database.
  if (ref.exists(questionsPageFutureProvider(pageNumber))) {
    final questionPage = await ref.watch(
      questionsPageFutureProvider(pageNumber).future,
    );

    // debugPrint('Fetching question from cache...');
    return questionPage[questionIndex % QuestionsRepository.pageSize];
  }

  // debugPrint('Fetching question from database...');
  final questionsService = await ref.watch(questionsServiceProvider.future);
  return questionsService.getQuestion(questionIndex);
}

@riverpod
FutureOr<List<Question>> questionsPageFuture(Ref ref, int pageIndex) async {
  final questionsService = await ref.watch(questionsServiceProvider.future);
  return questionsService.getQuestionsPage(pageIndex);
}

@riverpod
FutureOr<int> questionCountFuture(Ref ref) async {
  final questionsService = await ref.watch(questionsServiceProvider.future);
  return questionsService.getQuestionCount();
}

// Leverage Riverpod caching system to build "lazy-load/pagination" data
// getting mechanism.
//
// This is useful when we have a large number of questions and we don't want to
// load all of them at once.
//
// When combined with ListView.builder, it is much faster compared to loading
// individual questions (questionFutureProvider) by loading them in pages. It
// also preloads the next and previous pages to make the user experience
// smoother.
//
// Note that it should be used only in the ListView.builder, if you want to load
// one question only, use questionFutureProvider instead to save memory.
@riverpod
FutureOr<Question> questionPreloadPagesFuture(
  Ref ref,
  int questionIndex,
) async {
  final pageNumber = questionIndex ~/ QuestionsRepository.pageSize;
  final questionPage = await ref.watch(
    questionsPageFutureProvider(pageNumber).future,
  );
  final questionCount = await ref.watch(questionCountFutureProvider.future);

  // Preload database data of the previous page
  if (pageNumber > 0) {
    ref.listen(questionsPageFutureProvider(pageNumber - 1), (_, _) {});
  }

  // Preload database data of the next page
  if (pageNumber < questionCount ~/ QuestionsRepository.pageSize) {
    ref.listen(questionsPageFutureProvider(pageNumber + 1), (_, _) {});
  }

  // Return the question
  return questionPage[questionIndex % QuestionsRepository.pageSize];
}

@riverpod
Stream<int?> userSelectedAnswerIndex(Ref ref, Question question) async* {
  final questionsService = await ref.watch(questionsServiceProvider.future);
  yield* questionsService.watchUserSelectedAnswerIndex(question);
}

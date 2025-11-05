import 'dart:async';

import 'package:collection/collection.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';

sealed class QuestionsHandler {
  FutureOr<Question> getQuestion(int questionIndex);
  FutureOr<List<Question>> getQuestionsPage(int pageIndex);
  FutureOr<int> getQuestionCount();
}

class FullQuestionsHandler implements QuestionsHandler {
  FullQuestionsHandler({required this.questionsRepository});
  final QuestionsRepository questionsRepository;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestion(License.all, questionIndex);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPage(License.all, pageIndex);
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionsCount(License.all);
  }
}

class ChapterQuestionsHandler implements QuestionsHandler {

  ChapterQuestionsHandler({
    required this.questionsRepository,
    required this.license,
    required this.chapter,
  });
  final QuestionsRepository questionsRepository;
  final License license;
  final Chapter chapter;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestion(
      license,
      questionIndex,
      chapter: chapter,
    );
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPage(
      license,
      pageIndex,
      chapter: chapter,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionsCount(
      license,
      chapter: chapter,
    );
  }
}

class DangerQuestionsHandler implements QuestionsHandler {

  DangerQuestionsHandler({
    required this.questionsRepository,
    required this.license,
  });
  final QuestionsRepository questionsRepository;
  final License license;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestion(
      license,
      questionIndex,
      filterDangerQuestions: true,
    );
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPage(
      license,
      pageIndex,
      filterDangerQuestions: true,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionsCount(
      license,
      filterDangerQuestions: true,
    );
  }
}

class DifficultQuestionsHandler implements QuestionsHandler {

  DifficultQuestionsHandler({
    required this.questionsRepository,
    required this.license,
  });
  final QuestionsRepository questionsRepository;
  final License license;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository.getQuestion(
      license,
      questionIndex,
      filterDifficultQuestions: true,
    );
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPage(
      license,
      pageIndex,
      filterDifficultQuestions: true,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return questionsRepository.getQuestionsCount(
      license,
      filterDifficultQuestions: true,
    );
  }
}

class CustomQuestionListQuestionHandler implements QuestionsHandler {

  CustomQuestionListQuestionHandler({
    required this.questionsRepository,
    required this.sortedQuestionDbIndexes,
  }) : assert(sortedQuestionDbIndexes.isSorted((a, b) => a - b));
  final QuestionsRepository questionsRepository;
  final List<int> sortedQuestionDbIndexes;

  @override
  FutureOr<Question> getQuestion(int questionIndex) {
    return questionsRepository
        .getQuestionByDbIndex(sortedQuestionDbIndexes[questionIndex]);
  }

  @override
  FutureOr<List<Question>> getQuestionsPage(int pageIndex) {
    return questionsRepository.getQuestionsPageByDbIndexes(
      sortedQuestionDbIndexes,
      pageIndex,
    );
  }

  @override
  FutureOr<int> getQuestionCount() {
    return Future.value(sortedQuestionDbIndexes.length);
  }
}

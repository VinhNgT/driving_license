import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:flutter/material.dart';

@immutable
sealed class UserAnswersHandler {
  const UserAnswersHandler();

  Future<void> saveUserAnswer(Question question, int selectedAnswerIndex);
  Future<void> clearUserAnswer(Question question);
  Future<void> clearAllUserAnswers();
  Stream<int?> watchUserSelectedAnswerIndex(Question question);
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  );
}

class DirectUserAnswersHandler extends UserAnswersHandler {
  const DirectUserAnswersHandler({
    required this.userAnswersRepository,
  });
  final UserAnswersRepository userAnswersRepository;

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    return userAnswersRepository.saveAnswer(question, selectedAnswerIndex);
  }

  @override
  Future<void> clearUserAnswer(Question question) async {
    return userAnswersRepository.clearAnswer(question);
  }

  @override
  Future<void> clearAllUserAnswers() async {
    return userAnswersRepository.clearDatabase();
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return userAnswersRepository.watchUserSelectedAnswerIndex(question);
  }

  @override
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  ) async {
    return userAnswersRepository.getAnswersByQuestionDbIndexes(dbIndexes);
  }
}

class HidePreviousUserAnswersHandler extends UserAnswersHandler {
  const HidePreviousUserAnswersHandler({
    required this.userAnswersRepository,
    required this.inMemoryUserAnswersRepository,
    required this.userAnswersBeforeStart,
  });
  final UserAnswersRepository userAnswersRepository;
  final UserAnswersRepository inMemoryUserAnswersRepository;
  final UserAnswersMap userAnswersBeforeStart;

  @override
  Future<void> saveUserAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    await userAnswersRepository.saveAnswer(question, selectedAnswerIndex);
    await inMemoryUserAnswersRepository.saveAnswer(
      question,
      selectedAnswerIndex,
    );
  }

  @override
  Future<void> clearUserAnswer(Question question) async {
    final userAnswerAtStart = userAnswersBeforeStart[question.questionDbIndex];

    // Restore the user's answer from the start of the session
    if (userAnswerAtStart != null) {
      await userAnswersRepository.saveAnswer(
        question,
        userAnswerAtStart.selectedAnswerIndex,
      );
    }
    await inMemoryUserAnswersRepository.clearAnswer(question);
  }

  @override
  Future<void> clearAllUserAnswers() async {
    // We don't need to implement this for now
    throw UnimplementedError('clearAllUserAnswers is not implemented');
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    return inMemoryUserAnswersRepository.watchUserSelectedAnswerIndex(question);
  }

  @override
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  ) async {
    return inMemoryUserAnswersRepository
        .getAnswersByQuestionDbIndexes(dbIndexes);
  }
}

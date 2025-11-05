import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_state_checkbox.dart';
import 'package:driving_license/features/questions/presentation/answer/eval_answer_state_delegate.dart';
import 'package:flutter/material.dart';

@immutable
sealed class AnswerCardListDelegate {
  const AnswerCardListDelegate();

  /// Evaluates the state of an answer card based on the provided parameters.
  ///
  /// The [answerIndex] parameter represents the index of the answer card being
  /// evaluated.
  ///
  /// The [selectedAnswerIndex] parameter represents the index of the answer
  /// card that is currently selected.
  ///
  /// The [correctAnswerIndex] parameter represents the index of the correct
  /// answer card.
  ///
  /// Returns the state of the answer card, which can be one of the following:
  ///   - [AnswerState.correct]: If the answer card is the correct answer.
  ///   - [AnswerState.incorrect]: If the answer card is not the correct answer.
  ///   - [AnswerState.selected]: If the answer card is currently selected.
  ///   - [AnswerState.unselected]: If the answer card is not selected.
  AnswerState evaluateAnswerCardState({
    required int answerIndex,
    required int? selectedAnswerIndex,
    required int correctAnswerIndex,
  });

  /// Callback function that is triggered when an answer is selected.
  ///
  /// The [question] parameter represents the question for which the answer
  /// is being selected.
  ///
  /// The [oldAnswerIndex] parameter represents the index of the previously
  /// selected answer (if any).
  ///
  /// The [newAnswerIndex] parameter represents the index of the newly selected
  /// answer.
  ///
  /// The [saveAnswerDbCallback] parameter is a function that takes a [Question]
  /// andan [answerOptionIndex] as parameters to save the selected answer to the
  /// database.
  ///
  /// It is responsible for selecting the answer for the given question.
  ///
  /// Example usage:
  /// ```dart
  /// onAnswerSelected(
  ///   question: myQuestion,
  ///   oldAnswerIndex: previousAnswerIndex,
  ///   newAnswerIndex: selectedAnswerIndex,
  ///   saveAnswerDbCallback: (question, answerOptionIndex) async {
  ///     // Perform the logic to select the answer for the question
  ///   },
  /// );
  /// ```
  void onAnswerSelected({
    required Question question,
    required int? oldAnswerIndex,
    required int newAnswerIndex,
    required Future<void> Function(Question question, int answerOptionIndex)
        saveAnswerDbCallback,
  });
}

class PracticeModeAnswerCardListDelegate extends AnswerCardListDelegate {
  const PracticeModeAnswerCardListDelegate();
  final _evalAnswerStateDelegate = const ShowResultEvalAnswerStateDelegate();

  @override
  AnswerState evaluateAnswerCardState({
    required int answerIndex,
    required int? selectedAnswerIndex,
    required int correctAnswerIndex,
  }) {
    // If no answer is selected, hide everything
    if (selectedAnswerIndex == null) {
      return AnswerState.unchecked;
    }

    // The answer state of this card, it can only be AnswerState.correct or
    // AnswerState.incorrect because answerIndex != null
    final answerState = _evalAnswerStateDelegate.evaluateAnswerState(
      answerIndex,
      correctAnswerIndex,
    );

    // Only reveal the answer result of this card if this card is selected or
    // it is the correct answer
    final bool isSelected = (answerIndex == selectedAnswerIndex);
    final bool isCorrect = (answerIndex == correctAnswerIndex);
    if (isSelected || isCorrect) {
      return answerState;
    }
    return AnswerState.unchecked;
  }

  @override
  void onAnswerSelected({
    required Question question,
    int? oldAnswerIndex,
    required int newAnswerIndex,
    required Future<void> Function(Question question, int answerOptionIndex)
        saveAnswerDbCallback,
  }) async {
    // In practice mode, only allow selecting answer 1 time
    if (oldAnswerIndex == null) {
      await saveAnswerDbCallback(question, newAnswerIndex);
    }
  }
}

class ExamModeAnswerCardListDelegate extends AnswerCardListDelegate {
  const ExamModeAnswerCardListDelegate();

  @override
  AnswerState evaluateAnswerCardState({
    required int answerIndex,
    int? selectedAnswerIndex,
    required int correctAnswerIndex,
  }) {
    // The state of this card is simply depend on whether it is selected or not
    final bool isSelected = (answerIndex == selectedAnswerIndex);
    return isSelected ? AnswerState.checked : AnswerState.unchecked;
  }

  @override
  void onAnswerSelected({
    required Question question,
    int? oldAnswerIndex,
    required int newAnswerIndex,
    required Future<void> Function(Question question, int answerOptionIndex)
        saveAnswerDbCallback,
  }) async {
    await saveAnswerDbCallback(question, newAnswerIndex);
  }
}

import 'package:driving_license/features/questions/presentation/answer/answer_state_checkbox.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

@immutable
sealed class EvalAnswerStateDelegate {
  const EvalAnswerStateDelegate();

  AnswerState evaluateAnswerState(
    int? evalAnswerIndex,
    int correctAnswerIndex,
  );
}

class ShowResultEvalAnswerStateDelegate extends EvalAnswerStateDelegate {
  const ShowResultEvalAnswerStateDelegate();

  @override
  AnswerState evaluateAnswerState(
    int? evalAnswerIndex,
    int correctAnswerIndex,
  ) {
    final bool noAnswerSelected = (evalAnswerIndex == null);
    final bool isCorrect = (evalAnswerIndex == correctAnswerIndex);

    if (noAnswerSelected) {
      return AnswerState.unchecked;
    }

    return isCorrect ? AnswerState.correct : AnswerState.incorrect;
  }
}

class HideResultEvalAnswerStateDelegate extends EvalAnswerStateDelegate {
  const HideResultEvalAnswerStateDelegate();

  @override
  AnswerState evaluateAnswerState(
    int? evalAnswerIndex,
    int correctAnswerIndex,
  ) {
    final bool answerSelected = (evalAnswerIndex != null);
    return answerSelected ? AnswerState.checked : AnswerState.unchecked;
  }
}

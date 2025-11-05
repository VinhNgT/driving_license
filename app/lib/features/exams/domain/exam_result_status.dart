import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';

sealed class ExamResultStatus {
  ExamResultStatus({
    required this.exam,
    required this.userAnswersSummary,
  }) {
    assert(correctAnswersCount + wrongAnswersCount <= totalQuestionsCount);
  }

  factory ExamResultStatus.grade({
    required Exam exam,
    required UserAnswersSummary userAnswersSummary,
  }) {
    // User has answered an isDanger question wrong.
    final bool hasWrongDangerAnswers = userAnswersSummary.wrongIsDanger > 0;

    // User did not answer isDanger questions.
    final bool hasUnansweredDangerQuestions =
        userAnswersSummary.isDanger < exam.dangerQuestionsCount;

    // User has skill issue.
    final bool notEnoughScore =
        userAnswersSummary.correct < exam.minimumPassingScore;

    if (hasWrongDangerAnswers ||
        hasUnansweredDangerQuestions ||
        notEnoughScore) {
      return ExamResultStatusFailed(
        exam: exam,
        userAnswersSummary: userAnswersSummary,
      );
    }

    return ExamResultStatusPassed(
      exam: exam,
      userAnswersSummary: userAnswersSummary,
    );
  }
  final Exam exam;
  final UserAnswersSummary userAnswersSummary;

  int get totalQuestionsCount => exam.questionsCount;
  int get correctAnswersCount => userAnswersSummary.correct;
  int get wrongAnswersCount => userAnswersSummary.wrong;
  int get wrongAnswersIsDangerCount => userAnswersSummary.wrongIsDanger;
  int get isDangerCount => userAnswersSummary.isDanger;
}

class ExamResultStatusPassed extends ExamResultStatus {
  ExamResultStatusPassed({
    required super.exam,
    required super.userAnswersSummary,
  });

  bool get isPerfect => correctAnswersCount == totalQuestionsCount;
}

class ExamResultStatusFailed extends ExamResultStatus {
  ExamResultStatusFailed({
    required super.exam,
    required super.userAnswersSummary,
  });

  bool get isDanger => wrongAnswersIsDangerCount > 0;
  bool get isDangerNotAnswered => isDangerCount < exam.dangerQuestionsCount;
}

import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_answers_map.freezed.dart';
part 'user_answers_map.g.dart';

/// Represents a map of user answers.
///
/// This class is used to store user answers for a set of questions.
/// It contains a map of question indices to user answers, as well as a summary
/// of the user's performance.
@freezed
abstract class UserAnswersMap with _$UserAnswersMap {
  const factory UserAnswersMap({
    required Map<int, UserAnswer> answersMap,
    required UserAnswersSummary summary,
  }) = _UserAnswersMap;

  factory UserAnswersMap.fromJson(Map<String, dynamic> json) =>
      _$UserAnswersMapFromJson(json);

  /// Constructs a [UserAnswersMap] from a list of [UserAnswer] objects.
  ///
  /// The [userAnswers] parameter is an iterable of [UserAnswer] objects
  /// representing the user's answers.
  /// The method calculates the summary of the user's performance based on the
  /// answers provided.
  factory UserAnswersMap.fromUserAnswers(Iterable<UserAnswer> userAnswers) {
    final Map<int, UserAnswer> resultAnswersMap = {};

    int correctAnswers = 0;
    int wrongAnswers = 0;
    int wrongAnswersIsDanger = 0;
    int isDanger = 0;

    for (final userAnswer in userAnswers) {
      resultAnswersMap[userAnswer.questionMetadata.questionDbIndex] =
          userAnswer;

      if (userAnswer.questionMetadata.correctAnswerIndex ==
          userAnswer.selectedAnswerIndex) {
        correctAnswers++;
      } else {
        wrongAnswers++;
        if (userAnswer.questionMetadata.isDanger) {
          wrongAnswersIsDanger++;
        }
      }

      if (userAnswer.questionMetadata.isDanger) {
        isDanger++;
      }
    }

    return UserAnswersMap(
      answersMap: resultAnswersMap,
      summary: UserAnswersSummary(
        correct: correctAnswers,
        wrong: wrongAnswers,
        wrongIsDanger: wrongAnswersIsDanger,
        isDanger: isDanger,
      ),
    );
  }

  /// An empty [UserAnswersMap] instance.
  ///
  /// This instance has an empty answers map and a summary with all counts set
  /// to zero.
  static const empty = UserAnswersMap(
    answersMap: {},
    summary: UserAnswersSummary.empty,
  );
}

extension UserAnswersMapOperations on UserAnswersMap {
  UserAnswer? operator [](int index) => answersMap[index];
  int get length => answersMap.length;
  List<int> get questionDbIndexes => answersMap.keys.toList();
}

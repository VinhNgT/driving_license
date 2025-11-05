import 'package:driving_license/features/exams/domain/exam_result_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_answers_summary.freezed.dart';
part 'user_answers_summary.g.dart';

/// A summary of an user answers list. We show this in the ChapterCards in the
/// home screen. It's also used in the grading logic of [ExamResultStatus].
@freezed
abstract class UserAnswersSummary with _$UserAnswersSummary {
  const factory UserAnswersSummary({
    /// Number of correct answers in an UserAnswers list.
    required int correct,

    /// Number of wrong answers in an UserAnswers list.
    required int wrong,

    /// Number of isDanger questions in an UserAnswers list.
    required int isDanger,

    /// Number of wrong answers in isDanger questions in an UserAnswers list.
    required int wrongIsDanger,
  }) = _UserAnswersSummary;
  const UserAnswersSummary._();

  factory UserAnswersSummary.fromJson(Map<String, dynamic> json) =>
      _$UserAnswersSummaryFromJson(json);

  /// An empty UserAnswersSummary.
  static const empty = UserAnswersSummary(
    correct: 0,
    wrong: 0,
    isDanger: 0,
    wrongIsDanger: 0,
  );

  /// Total number of questions in an UserAnswers list.
  int get total => correct + wrong;
}

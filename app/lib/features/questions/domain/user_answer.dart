import 'package:driving_license/features/questions/domain/question_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_answer.freezed.dart';
part 'user_answer.g.dart';

/// A user's answer to a question.
@freezed
abstract class UserAnswer with _$UserAnswer {
  const factory UserAnswer({
    required QuestionMetadata questionMetadata,
    required int selectedAnswerIndex,
  }) = _UserAnswer;

  factory UserAnswer.fromJson(Map<String, dynamic> json) =>
      _$UserAnswerFromJson(json);
}

extension UserAnswerOperations on UserAnswer {
  bool get isCorrect =>
      selectedAnswerIndex == questionMetadata.correctAnswerIndex;
}

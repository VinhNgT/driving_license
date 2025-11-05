import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question_metadata.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

/// A question in the database.
@freezed
abstract class Question with _$Question {
  const factory Question({
    required int questionDbIndex,
    required int chapterDbIndex,
    int? subChapterDbIndex,
    required String title,
    String? questionImagePath,
    required bool isDanger,
    required bool isDifficult,
    required List<String> answers,
    required int correctAnswerIndex,
    String? explanation,
    String? rememberTip,
    required Set<License> includedLicenses,
  }) = _Question;
  const Question._();

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  static const prototype = Question(
    questionDbIndex: -1,
    chapterDbIndex: -1,
    subChapterDbIndex: -1,
    title: 'Prototype\nPrototype',
    isDanger: false,
    isDifficult: false,
    correctAnswerIndex: 0,
    answers: ['0'],
    includedLicenses: {},
  );

  /// Returns a [QuestionMetadata] object with the metadata of this question.
  ///
  /// This method is useful when you want to save the metadata of a question
  /// without saving the whole question object.
  QuestionMetadata get metadata => QuestionMetadata(
        questionDbIndex: questionDbIndex,
        chapterDbIndex: chapterDbIndex,
        subChapterDbIndex: subChapterDbIndex,
        isDanger: isDanger,
        isDifficult: isDifficult,
        correctAnswerIndex: correctAnswerIndex,
        includedLicenses: includedLicenses,
      );
}

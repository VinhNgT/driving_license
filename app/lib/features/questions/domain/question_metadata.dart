import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'question_metadata.freezed.dart';
part 'question_metadata.g.dart';

/// Metadata of a question, use this if you don't need the entire question
/// itself.
@freezed
abstract class QuestionMetadata with _$QuestionMetadata {
  const factory QuestionMetadata({
    required int questionDbIndex,
    required int chapterDbIndex,
    int? subChapterDbIndex,
    required bool isDanger,
    required bool isDifficult,
    required int correctAnswerIndex,
    required Set<License> includedLicenses,
  }) = _QuestionMetadata;

  factory QuestionMetadata.fromJson(Map<String, dynamic> json) =>
      _$QuestionMetadataFromJson(json);
}

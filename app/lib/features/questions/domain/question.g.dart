// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionImpl _$$QuestionImplFromJson(Map<String, dynamic> json) =>
    _$QuestionImpl(
      questionDbIndex: (json['questionDbIndex'] as num).toInt(),
      chapterDbIndex: (json['chapterDbIndex'] as num).toInt(),
      subChapterDbIndex: (json['subChapterDbIndex'] as num?)?.toInt(),
      title: json['title'] as String,
      questionImagePath: json['questionImagePath'] as String?,
      isDanger: json['isDanger'] as bool,
      isDifficult: json['isDifficult'] as bool,
      answers: (json['answers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      correctAnswerIndex: (json['correctAnswerIndex'] as num).toInt(),
      explanation: json['explanation'] as String?,
      rememberTip: json['rememberTip'] as String?,
      includedLicenses: (json['includedLicenses'] as List<dynamic>)
          .map((e) => $enumDecode(_$LicenseEnumMap, e))
          .toSet(),
    );

Map<String, dynamic> _$$QuestionImplToJson(_$QuestionImpl instance) =>
    <String, dynamic>{
      'questionDbIndex': instance.questionDbIndex,
      'chapterDbIndex': instance.chapterDbIndex,
      'subChapterDbIndex': instance.subChapterDbIndex,
      'title': instance.title,
      'questionImagePath': instance.questionImagePath,
      'isDanger': instance.isDanger,
      'isDifficult': instance.isDifficult,
      'answers': instance.answers,
      'correctAnswerIndex': instance.correctAnswerIndex,
      'explanation': instance.explanation,
      'rememberTip': instance.rememberTip,
      'includedLicenses': instance.includedLicenses
          .map((e) => _$LicenseEnumMap[e]!)
          .toList(),
    };

const _$LicenseEnumMap = {
  License.all: 'all',
  License.a1: 'a1',
  License.a2: 'a2',
  License.a3: 'a3',
  License.a4: 'a4',
  License.b1: 'b1',
  License.b2: 'b2',
};

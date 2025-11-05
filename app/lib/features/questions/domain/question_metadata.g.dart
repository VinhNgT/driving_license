// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuestionMetadataImpl _$$QuestionMetadataImplFromJson(
  Map<String, dynamic> json,
) => _$QuestionMetadataImpl(
  questionDbIndex: (json['questionDbIndex'] as num).toInt(),
  chapterDbIndex: (json['chapterDbIndex'] as num).toInt(),
  subChapterDbIndex: (json['subChapterDbIndex'] as num?)?.toInt(),
  isDanger: json['isDanger'] as bool,
  isDifficult: json['isDifficult'] as bool,
  correctAnswerIndex: (json['correctAnswerIndex'] as num).toInt(),
  includedLicenses: (json['includedLicenses'] as List<dynamic>)
      .map((e) => $enumDecode(_$LicenseEnumMap, e))
      .toSet(),
);

Map<String, dynamic> _$$QuestionMetadataImplToJson(
  _$QuestionMetadataImpl instance,
) => <String, dynamic>{
  'questionDbIndex': instance.questionDbIndex,
  'chapterDbIndex': instance.chapterDbIndex,
  'subChapterDbIndex': instance.subChapterDbIndex,
  'isDanger': instance.isDanger,
  'isDifficult': instance.isDifficult,
  'correctAnswerIndex': instance.correctAnswerIndex,
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answers_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAnswersMapImpl _$$UserAnswersMapImplFromJson(
  Map<String, dynamic> json,
) => _$UserAnswersMapImpl(
  answersMap: (json['answersMap'] as Map<String, dynamic>).map(
    (k, e) =>
        MapEntry(int.parse(k), UserAnswer.fromJson(e as Map<String, dynamic>)),
  ),
  summary: UserAnswersSummary.fromJson(json['summary'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$UserAnswersMapImplToJson(
  _$UserAnswersMapImpl instance,
) => <String, dynamic>{
  'answersMap': instance.answersMap.map(
    (k, e) => MapEntry(k.toString(), e.toJson()),
  ),
  'summary': instance.summary.toJson(),
};

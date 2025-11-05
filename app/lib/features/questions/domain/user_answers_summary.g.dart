// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answers_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAnswersSummaryImpl _$$UserAnswersSummaryImplFromJson(
  Map<String, dynamic> json,
) => _$UserAnswersSummaryImpl(
  correct: (json['correct'] as num).toInt(),
  wrong: (json['wrong'] as num).toInt(),
  isDanger: (json['isDanger'] as num).toInt(),
  wrongIsDanger: (json['wrongIsDanger'] as num).toInt(),
);

Map<String, dynamic> _$$UserAnswersSummaryImplToJson(
  _$UserAnswersSummaryImpl instance,
) => <String, dynamic>{
  'correct': instance.correct,
  'wrong': instance.wrong,
  'isDanger': instance.isDanger,
  'wrongIsDanger': instance.wrongIsDanger,
};

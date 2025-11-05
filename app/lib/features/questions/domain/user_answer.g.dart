// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserAnswerImpl _$$UserAnswerImplFromJson(Map<String, dynamic> json) =>
    _$UserAnswerImpl(
      questionMetadata: QuestionMetadata.fromJson(
        json['questionMetadata'] as Map<String, dynamic>,
      ),
      selectedAnswerIndex: (json['selectedAnswerIndex'] as num).toInt(),
    );

Map<String, dynamic> _$$UserAnswerImplToJson(_$UserAnswerImpl instance) =>
    <String, dynamic>{
      'questionMetadata': instance.questionMetadata.toJson(),
      'selectedAnswerIndex': instance.selectedAnswerIndex,
    };

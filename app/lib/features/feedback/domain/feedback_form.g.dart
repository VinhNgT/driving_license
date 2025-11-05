// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FeedbackFormImpl _$$FeedbackFormImplFromJson(Map<String, dynamic> json) =>
    _$FeedbackFormImpl(
      dateTime: DateTime.parse(json['dateTime'] as String),
      version: json['version'] as String,
      email: json['email'] as String?,
      feedback: json['feedback'] as String,
    );

Map<String, dynamic> _$$FeedbackFormImplToJson(_$FeedbackFormImpl instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'version': instance.version,
      'email': instance.email,
      'feedback': instance.feedback,
    };

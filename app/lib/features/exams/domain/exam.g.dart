// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExamImpl _$$ExamImplFromJson(Map<String, dynamic> json) => _$ExamImpl(
  examId: json['examId'] as String? ?? '000000000000000000000000000',
  name: json['name'] as String,
  createdUtcTime: DateTime.parse(json['createdUtcTime'] as String),
  questionDbIndexes: (json['questionDbIndexes'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  license: $enumDecode(_$LicenseEnumMap, json['license']),
  userAnswers: json['userAnswers'] == null
      ? UserAnswersMap.empty
      : UserAnswersMap.fromJson(json['userAnswers'] as Map<String, dynamic>),
  lastAttemptedUtcTime: json['lastAttemptedUtcTime'] == null
      ? null
      : DateTime.parse(json['lastAttemptedUtcTime'] as String),
);

Map<String, dynamic> _$$ExamImplToJson(_$ExamImpl instance) =>
    <String, dynamic>{
      'examId': instance.examId,
      'name': instance.name,
      'createdUtcTime': instance.createdUtcTime.toIso8601String(),
      'questionDbIndexes': instance.questionDbIndexes,
      'license': _$LicenseEnumMap[instance.license]!,
      'userAnswers': instance.userAnswers.toJson(),
      'lastAttemptedUtcTime': instance.lastAttemptedUtcTime?.toIso8601String(),
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

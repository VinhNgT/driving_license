// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookmarkImpl _$$BookmarkImplFromJson(Map<String, dynamic> json) =>
    _$BookmarkImpl(
      questionDbIndex: (json['questionDbIndex'] as num).toInt(),
      questionMetadata: QuestionMetadata.fromJson(
        json['questionMetadata'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$$BookmarkImplToJson(_$BookmarkImpl instance) =>
    <String, dynamic>{
      'questionDbIndex': instance.questionDbIndex,
      'questionMetadata': instance.questionMetadata.toJson(),
    };

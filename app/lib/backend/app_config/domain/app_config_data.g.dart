// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppConfigDataImpl _$$AppConfigDataImplFromJson(Map<String, dynamic> json) =>
    _$AppConfigDataImpl(
      gsFeedbackPostLink: json['gs_feedback_post_link'] as String,
      disableDonationCard: json['disable_donation_card'] as bool,
      unlockAllFeatures: json['unlock_all_features'] as bool,
    );

Map<String, dynamic> _$$AppConfigDataImplToJson(_$AppConfigDataImpl instance) =>
    <String, dynamic>{
      'gs_feedback_post_link': instance.gsFeedbackPostLink,
      'disable_donation_card': instance.disableDonationCard,
      'unlock_all_features': instance.unlockAllFeatures,
    };

// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_config_data.freezed.dart';
part 'app_config_data.g.dart';

@freezed
class AppConfigData with _$AppConfigData {
  const factory AppConfigData({
    @JsonKey(name: 'gs_feedback_post_link') required String gsFeedbackPostLink,
    @JsonKey(name: 'disable_donation_card') required bool disableDonationCard,
    @JsonKey(name: 'unlock_all_features') required bool unlockAllFeatures,
  }) = _AppConfigData;

  factory AppConfigData.fromJson(Map<String, dynamic> json) =>
      _$AppConfigDataFromJson(json);
}

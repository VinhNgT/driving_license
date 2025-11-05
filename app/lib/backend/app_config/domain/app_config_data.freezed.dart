// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_config_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

AppConfigData _$AppConfigDataFromJson(Map<String, dynamic> json) {
  return _AppConfigData.fromJson(json);
}

/// @nodoc
mixin _$AppConfigData {
  @JsonKey(name: 'gs_feedback_post_link')
  String get gsFeedbackPostLink => throw _privateConstructorUsedError;
  @JsonKey(name: 'disable_donation_card')
  bool get disableDonationCard => throw _privateConstructorUsedError;
  @JsonKey(name: 'unlock_all_features')
  bool get unlockAllFeatures => throw _privateConstructorUsedError;

  /// Serializes this AppConfigData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppConfigData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppConfigDataCopyWith<AppConfigData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppConfigDataCopyWith<$Res> {
  factory $AppConfigDataCopyWith(
    AppConfigData value,
    $Res Function(AppConfigData) then,
  ) = _$AppConfigDataCopyWithImpl<$Res, AppConfigData>;
  @useResult
  $Res call({
    @JsonKey(name: 'gs_feedback_post_link') String gsFeedbackPostLink,
    @JsonKey(name: 'disable_donation_card') bool disableDonationCard,
    @JsonKey(name: 'unlock_all_features') bool unlockAllFeatures,
  });
}

/// @nodoc
class _$AppConfigDataCopyWithImpl<$Res, $Val extends AppConfigData>
    implements $AppConfigDataCopyWith<$Res> {
  _$AppConfigDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppConfigData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsFeedbackPostLink = null,
    Object? disableDonationCard = null,
    Object? unlockAllFeatures = null,
  }) {
    return _then(
      _value.copyWith(
            gsFeedbackPostLink: null == gsFeedbackPostLink
                ? _value.gsFeedbackPostLink
                : gsFeedbackPostLink // ignore: cast_nullable_to_non_nullable
                      as String,
            disableDonationCard: null == disableDonationCard
                ? _value.disableDonationCard
                : disableDonationCard // ignore: cast_nullable_to_non_nullable
                      as bool,
            unlockAllFeatures: null == unlockAllFeatures
                ? _value.unlockAllFeatures
                : unlockAllFeatures // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AppConfigDataImplCopyWith<$Res>
    implements $AppConfigDataCopyWith<$Res> {
  factory _$$AppConfigDataImplCopyWith(
    _$AppConfigDataImpl value,
    $Res Function(_$AppConfigDataImpl) then,
  ) = __$$AppConfigDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'gs_feedback_post_link') String gsFeedbackPostLink,
    @JsonKey(name: 'disable_donation_card') bool disableDonationCard,
    @JsonKey(name: 'unlock_all_features') bool unlockAllFeatures,
  });
}

/// @nodoc
class __$$AppConfigDataImplCopyWithImpl<$Res>
    extends _$AppConfigDataCopyWithImpl<$Res, _$AppConfigDataImpl>
    implements _$$AppConfigDataImplCopyWith<$Res> {
  __$$AppConfigDataImplCopyWithImpl(
    _$AppConfigDataImpl _value,
    $Res Function(_$AppConfigDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AppConfigData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gsFeedbackPostLink = null,
    Object? disableDonationCard = null,
    Object? unlockAllFeatures = null,
  }) {
    return _then(
      _$AppConfigDataImpl(
        gsFeedbackPostLink: null == gsFeedbackPostLink
            ? _value.gsFeedbackPostLink
            : gsFeedbackPostLink // ignore: cast_nullable_to_non_nullable
                  as String,
        disableDonationCard: null == disableDonationCard
            ? _value.disableDonationCard
            : disableDonationCard // ignore: cast_nullable_to_non_nullable
                  as bool,
        unlockAllFeatures: null == unlockAllFeatures
            ? _value.unlockAllFeatures
            : unlockAllFeatures // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AppConfigDataImpl implements _AppConfigData {
  const _$AppConfigDataImpl({
    @JsonKey(name: 'gs_feedback_post_link') required this.gsFeedbackPostLink,
    @JsonKey(name: 'disable_donation_card') required this.disableDonationCard,
    @JsonKey(name: 'unlock_all_features') required this.unlockAllFeatures,
  });

  factory _$AppConfigDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppConfigDataImplFromJson(json);

  @override
  @JsonKey(name: 'gs_feedback_post_link')
  final String gsFeedbackPostLink;
  @override
  @JsonKey(name: 'disable_donation_card')
  final bool disableDonationCard;
  @override
  @JsonKey(name: 'unlock_all_features')
  final bool unlockAllFeatures;

  @override
  String toString() {
    return 'AppConfigData(gsFeedbackPostLink: $gsFeedbackPostLink, disableDonationCard: $disableDonationCard, unlockAllFeatures: $unlockAllFeatures)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppConfigDataImpl &&
            (identical(other.gsFeedbackPostLink, gsFeedbackPostLink) ||
                other.gsFeedbackPostLink == gsFeedbackPostLink) &&
            (identical(other.disableDonationCard, disableDonationCard) ||
                other.disableDonationCard == disableDonationCard) &&
            (identical(other.unlockAllFeatures, unlockAllFeatures) ||
                other.unlockAllFeatures == unlockAllFeatures));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    gsFeedbackPostLink,
    disableDonationCard,
    unlockAllFeatures,
  );

  /// Create a copy of AppConfigData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppConfigDataImplCopyWith<_$AppConfigDataImpl> get copyWith =>
      __$$AppConfigDataImplCopyWithImpl<_$AppConfigDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppConfigDataImplToJson(this);
  }
}

abstract class _AppConfigData implements AppConfigData {
  const factory _AppConfigData({
    @JsonKey(name: 'gs_feedback_post_link')
    required final String gsFeedbackPostLink,
    @JsonKey(name: 'disable_donation_card')
    required final bool disableDonationCard,
    @JsonKey(name: 'unlock_all_features') required final bool unlockAllFeatures,
  }) = _$AppConfigDataImpl;

  factory _AppConfigData.fromJson(Map<String, dynamic> json) =
      _$AppConfigDataImpl.fromJson;

  @override
  @JsonKey(name: 'gs_feedback_post_link')
  String get gsFeedbackPostLink;
  @override
  @JsonKey(name: 'disable_donation_card')
  bool get disableDonationCard;
  @override
  @JsonKey(name: 'unlock_all_features')
  bool get unlockAllFeatures;

  /// Create a copy of AppConfigData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppConfigDataImplCopyWith<_$AppConfigDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

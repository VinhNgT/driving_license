// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'env_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

EnvData _$EnvDataFromJson(Map<String, dynamic> json) {
  return _EnvData.fromJson(json);
}

/// @nodoc
mixin _$EnvData {
  Level get loggerLevel => throw _privateConstructorUsedError;
  bool get showDetailedError => throw _privateConstructorUsedError;
  bool get enableRemoteConfig => throw _privateConstructorUsedError;
  bool get treatGoogleIapNonConsumableAsConsumable =>
      throw _privateConstructorUsedError;

  /// Serializes this EnvData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnvData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnvDataCopyWith<EnvData> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvDataCopyWith<$Res> {
  factory $EnvDataCopyWith(EnvData value, $Res Function(EnvData) then) =
      _$EnvDataCopyWithImpl<$Res, EnvData>;
  @useResult
  $Res call({
    Level loggerLevel,
    bool showDetailedError,
    bool enableRemoteConfig,
    bool treatGoogleIapNonConsumableAsConsumable,
  });
}

/// @nodoc
class _$EnvDataCopyWithImpl<$Res, $Val extends EnvData>
    implements $EnvDataCopyWith<$Res> {
  _$EnvDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnvData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggerLevel = null,
    Object? showDetailedError = null,
    Object? enableRemoteConfig = null,
    Object? treatGoogleIapNonConsumableAsConsumable = null,
  }) {
    return _then(
      _value.copyWith(
            loggerLevel: null == loggerLevel
                ? _value.loggerLevel
                : loggerLevel // ignore: cast_nullable_to_non_nullable
                      as Level,
            showDetailedError: null == showDetailedError
                ? _value.showDetailedError
                : showDetailedError // ignore: cast_nullable_to_non_nullable
                      as bool,
            enableRemoteConfig: null == enableRemoteConfig
                ? _value.enableRemoteConfig
                : enableRemoteConfig // ignore: cast_nullable_to_non_nullable
                      as bool,
            treatGoogleIapNonConsumableAsConsumable:
                null == treatGoogleIapNonConsumableAsConsumable
                ? _value.treatGoogleIapNonConsumableAsConsumable
                : treatGoogleIapNonConsumableAsConsumable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$EnvDataImplCopyWith<$Res> implements $EnvDataCopyWith<$Res> {
  factory _$$EnvDataImplCopyWith(
    _$EnvDataImpl value,
    $Res Function(_$EnvDataImpl) then,
  ) = __$$EnvDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Level loggerLevel,
    bool showDetailedError,
    bool enableRemoteConfig,
    bool treatGoogleIapNonConsumableAsConsumable,
  });
}

/// @nodoc
class __$$EnvDataImplCopyWithImpl<$Res>
    extends _$EnvDataCopyWithImpl<$Res, _$EnvDataImpl>
    implements _$$EnvDataImplCopyWith<$Res> {
  __$$EnvDataImplCopyWithImpl(
    _$EnvDataImpl _value,
    $Res Function(_$EnvDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of EnvData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loggerLevel = null,
    Object? showDetailedError = null,
    Object? enableRemoteConfig = null,
    Object? treatGoogleIapNonConsumableAsConsumable = null,
  }) {
    return _then(
      _$EnvDataImpl(
        loggerLevel: null == loggerLevel
            ? _value.loggerLevel
            : loggerLevel // ignore: cast_nullable_to_non_nullable
                  as Level,
        showDetailedError: null == showDetailedError
            ? _value.showDetailedError
            : showDetailedError // ignore: cast_nullable_to_non_nullable
                  as bool,
        enableRemoteConfig: null == enableRemoteConfig
            ? _value.enableRemoteConfig
            : enableRemoteConfig // ignore: cast_nullable_to_non_nullable
                  as bool,
        treatGoogleIapNonConsumableAsConsumable:
            null == treatGoogleIapNonConsumableAsConsumable
            ? _value.treatGoogleIapNonConsumableAsConsumable
            : treatGoogleIapNonConsumableAsConsumable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$EnvDataImpl implements _EnvData {
  const _$EnvDataImpl({
    required this.loggerLevel,
    required this.showDetailedError,
    required this.enableRemoteConfig,
    required this.treatGoogleIapNonConsumableAsConsumable,
  });

  factory _$EnvDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnvDataImplFromJson(json);

  @override
  final Level loggerLevel;
  @override
  final bool showDetailedError;
  @override
  final bool enableRemoteConfig;
  @override
  final bool treatGoogleIapNonConsumableAsConsumable;

  @override
  String toString() {
    return 'EnvData(loggerLevel: $loggerLevel, showDetailedError: $showDetailedError, enableRemoteConfig: $enableRemoteConfig, treatGoogleIapNonConsumableAsConsumable: $treatGoogleIapNonConsumableAsConsumable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvDataImpl &&
            (identical(other.loggerLevel, loggerLevel) ||
                other.loggerLevel == loggerLevel) &&
            (identical(other.showDetailedError, showDetailedError) ||
                other.showDetailedError == showDetailedError) &&
            (identical(other.enableRemoteConfig, enableRemoteConfig) ||
                other.enableRemoteConfig == enableRemoteConfig) &&
            (identical(
                  other.treatGoogleIapNonConsumableAsConsumable,
                  treatGoogleIapNonConsumableAsConsumable,
                ) ||
                other.treatGoogleIapNonConsumableAsConsumable ==
                    treatGoogleIapNonConsumableAsConsumable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    loggerLevel,
    showDetailedError,
    enableRemoteConfig,
    treatGoogleIapNonConsumableAsConsumable,
  );

  /// Create a copy of EnvData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvDataImplCopyWith<_$EnvDataImpl> get copyWith =>
      __$$EnvDataImplCopyWithImpl<_$EnvDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnvDataImplToJson(this);
  }
}

abstract class _EnvData implements EnvData {
  const factory _EnvData({
    required final Level loggerLevel,
    required final bool showDetailedError,
    required final bool enableRemoteConfig,
    required final bool treatGoogleIapNonConsumableAsConsumable,
  }) = _$EnvDataImpl;

  factory _EnvData.fromJson(Map<String, dynamic> json) = _$EnvDataImpl.fromJson;

  @override
  Level get loggerLevel;
  @override
  bool get showDetailedError;
  @override
  bool get enableRemoteConfig;
  @override
  bool get treatGoogleIapNonConsumableAsConsumable;

  /// Create a copy of EnvData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnvDataImplCopyWith<_$EnvDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

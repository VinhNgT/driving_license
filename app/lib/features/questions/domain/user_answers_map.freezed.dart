// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_answers_map.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserAnswersMap _$UserAnswersMapFromJson(Map<String, dynamic> json) {
  return _UserAnswersMap.fromJson(json);
}

/// @nodoc
mixin _$UserAnswersMap {
  Map<int, UserAnswer> get answersMap => throw _privateConstructorUsedError;
  UserAnswersSummary get summary => throw _privateConstructorUsedError;

  /// Serializes this UserAnswersMap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAnswersMap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAnswersMapCopyWith<UserAnswersMap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAnswersMapCopyWith<$Res> {
  factory $UserAnswersMapCopyWith(
    UserAnswersMap value,
    $Res Function(UserAnswersMap) then,
  ) = _$UserAnswersMapCopyWithImpl<$Res, UserAnswersMap>;
  @useResult
  $Res call({Map<int, UserAnswer> answersMap, UserAnswersSummary summary});

  $UserAnswersSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class _$UserAnswersMapCopyWithImpl<$Res, $Val extends UserAnswersMap>
    implements $UserAnswersMapCopyWith<$Res> {
  _$UserAnswersMapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAnswersMap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? answersMap = null, Object? summary = null}) {
    return _then(
      _value.copyWith(
            answersMap: null == answersMap
                ? _value.answersMap
                : answersMap // ignore: cast_nullable_to_non_nullable
                      as Map<int, UserAnswer>,
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as UserAnswersSummary,
          )
          as $Val,
    );
  }

  /// Create a copy of UserAnswersMap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAnswersSummaryCopyWith<$Res> get summary {
    return $UserAnswersSummaryCopyWith<$Res>(_value.summary, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserAnswersMapImplCopyWith<$Res>
    implements $UserAnswersMapCopyWith<$Res> {
  factory _$$UserAnswersMapImplCopyWith(
    _$UserAnswersMapImpl value,
    $Res Function(_$UserAnswersMapImpl) then,
  ) = __$$UserAnswersMapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<int, UserAnswer> answersMap, UserAnswersSummary summary});

  @override
  $UserAnswersSummaryCopyWith<$Res> get summary;
}

/// @nodoc
class __$$UserAnswersMapImplCopyWithImpl<$Res>
    extends _$UserAnswersMapCopyWithImpl<$Res, _$UserAnswersMapImpl>
    implements _$$UserAnswersMapImplCopyWith<$Res> {
  __$$UserAnswersMapImplCopyWithImpl(
    _$UserAnswersMapImpl _value,
    $Res Function(_$UserAnswersMapImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserAnswersMap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? answersMap = null, Object? summary = null}) {
    return _then(
      _$UserAnswersMapImpl(
        answersMap: null == answersMap
            ? _value._answersMap
            : answersMap // ignore: cast_nullable_to_non_nullable
                  as Map<int, UserAnswer>,
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as UserAnswersSummary,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAnswersMapImpl implements _UserAnswersMap {
  const _$UserAnswersMapImpl({
    required final Map<int, UserAnswer> answersMap,
    required this.summary,
  }) : _answersMap = answersMap;

  factory _$UserAnswersMapImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAnswersMapImplFromJson(json);

  final Map<int, UserAnswer> _answersMap;
  @override
  Map<int, UserAnswer> get answersMap {
    if (_answersMap is EqualUnmodifiableMapView) return _answersMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_answersMap);
  }

  @override
  final UserAnswersSummary summary;

  @override
  String toString() {
    return 'UserAnswersMap(answersMap: $answersMap, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAnswersMapImpl &&
            const DeepCollectionEquality().equals(
              other._answersMap,
              _answersMap,
            ) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_answersMap),
    summary,
  );

  /// Create a copy of UserAnswersMap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAnswersMapImplCopyWith<_$UserAnswersMapImpl> get copyWith =>
      __$$UserAnswersMapImplCopyWithImpl<_$UserAnswersMapImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAnswersMapImplToJson(this);
  }
}

abstract class _UserAnswersMap implements UserAnswersMap {
  const factory _UserAnswersMap({
    required final Map<int, UserAnswer> answersMap,
    required final UserAnswersSummary summary,
  }) = _$UserAnswersMapImpl;

  factory _UserAnswersMap.fromJson(Map<String, dynamic> json) =
      _$UserAnswersMapImpl.fromJson;

  @override
  Map<int, UserAnswer> get answersMap;
  @override
  UserAnswersSummary get summary;

  /// Create a copy of UserAnswersMap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAnswersMapImplCopyWith<_$UserAnswersMapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

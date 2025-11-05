// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_answers_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserAnswersSummary _$UserAnswersSummaryFromJson(Map<String, dynamic> json) {
  return _UserAnswersSummary.fromJson(json);
}

/// @nodoc
mixin _$UserAnswersSummary {
  /// Number of correct answers in an UserAnswers list.
  int get correct => throw _privateConstructorUsedError;

  /// Number of wrong answers in an UserAnswers list.
  int get wrong => throw _privateConstructorUsedError;

  /// Number of isDanger questions in an UserAnswers list.
  int get isDanger => throw _privateConstructorUsedError;

  /// Number of wrong answers in isDanger questions in an UserAnswers list.
  int get wrongIsDanger => throw _privateConstructorUsedError;

  /// Serializes this UserAnswersSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAnswersSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserAnswersSummaryCopyWith<UserAnswersSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserAnswersSummaryCopyWith<$Res> {
  factory $UserAnswersSummaryCopyWith(
    UserAnswersSummary value,
    $Res Function(UserAnswersSummary) then,
  ) = _$UserAnswersSummaryCopyWithImpl<$Res, UserAnswersSummary>;
  @useResult
  $Res call({int correct, int wrong, int isDanger, int wrongIsDanger});
}

/// @nodoc
class _$UserAnswersSummaryCopyWithImpl<$Res, $Val extends UserAnswersSummary>
    implements $UserAnswersSummaryCopyWith<$Res> {
  _$UserAnswersSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserAnswersSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correct = null,
    Object? wrong = null,
    Object? isDanger = null,
    Object? wrongIsDanger = null,
  }) {
    return _then(
      _value.copyWith(
            correct: null == correct
                ? _value.correct
                : correct // ignore: cast_nullable_to_non_nullable
                      as int,
            wrong: null == wrong
                ? _value.wrong
                : wrong // ignore: cast_nullable_to_non_nullable
                      as int,
            isDanger: null == isDanger
                ? _value.isDanger
                : isDanger // ignore: cast_nullable_to_non_nullable
                      as int,
            wrongIsDanger: null == wrongIsDanger
                ? _value.wrongIsDanger
                : wrongIsDanger // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserAnswersSummaryImplCopyWith<$Res>
    implements $UserAnswersSummaryCopyWith<$Res> {
  factory _$$UserAnswersSummaryImplCopyWith(
    _$UserAnswersSummaryImpl value,
    $Res Function(_$UserAnswersSummaryImpl) then,
  ) = __$$UserAnswersSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int correct, int wrong, int isDanger, int wrongIsDanger});
}

/// @nodoc
class __$$UserAnswersSummaryImplCopyWithImpl<$Res>
    extends _$UserAnswersSummaryCopyWithImpl<$Res, _$UserAnswersSummaryImpl>
    implements _$$UserAnswersSummaryImplCopyWith<$Res> {
  __$$UserAnswersSummaryImplCopyWithImpl(
    _$UserAnswersSummaryImpl _value,
    $Res Function(_$UserAnswersSummaryImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserAnswersSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? correct = null,
    Object? wrong = null,
    Object? isDanger = null,
    Object? wrongIsDanger = null,
  }) {
    return _then(
      _$UserAnswersSummaryImpl(
        correct: null == correct
            ? _value.correct
            : correct // ignore: cast_nullable_to_non_nullable
                  as int,
        wrong: null == wrong
            ? _value.wrong
            : wrong // ignore: cast_nullable_to_non_nullable
                  as int,
        isDanger: null == isDanger
            ? _value.isDanger
            : isDanger // ignore: cast_nullable_to_non_nullable
                  as int,
        wrongIsDanger: null == wrongIsDanger
            ? _value.wrongIsDanger
            : wrongIsDanger // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserAnswersSummaryImpl extends _UserAnswersSummary {
  const _$UserAnswersSummaryImpl({
    required this.correct,
    required this.wrong,
    required this.isDanger,
    required this.wrongIsDanger,
  }) : super._();

  factory _$UserAnswersSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserAnswersSummaryImplFromJson(json);

  /// Number of correct answers in an UserAnswers list.
  @override
  final int correct;

  /// Number of wrong answers in an UserAnswers list.
  @override
  final int wrong;

  /// Number of isDanger questions in an UserAnswers list.
  @override
  final int isDanger;

  /// Number of wrong answers in isDanger questions in an UserAnswers list.
  @override
  final int wrongIsDanger;

  @override
  String toString() {
    return 'UserAnswersSummary(correct: $correct, wrong: $wrong, isDanger: $isDanger, wrongIsDanger: $wrongIsDanger)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserAnswersSummaryImpl &&
            (identical(other.correct, correct) || other.correct == correct) &&
            (identical(other.wrong, wrong) || other.wrong == wrong) &&
            (identical(other.isDanger, isDanger) ||
                other.isDanger == isDanger) &&
            (identical(other.wrongIsDanger, wrongIsDanger) ||
                other.wrongIsDanger == wrongIsDanger));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, correct, wrong, isDanger, wrongIsDanger);

  /// Create a copy of UserAnswersSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserAnswersSummaryImplCopyWith<_$UserAnswersSummaryImpl> get copyWith =>
      __$$UserAnswersSummaryImplCopyWithImpl<_$UserAnswersSummaryImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserAnswersSummaryImplToJson(this);
  }
}

abstract class _UserAnswersSummary extends UserAnswersSummary {
  const factory _UserAnswersSummary({
    required final int correct,
    required final int wrong,
    required final int isDanger,
    required final int wrongIsDanger,
  }) = _$UserAnswersSummaryImpl;
  const _UserAnswersSummary._() : super._();

  factory _UserAnswersSummary.fromJson(Map<String, dynamic> json) =
      _$UserAnswersSummaryImpl.fromJson;

  /// Number of correct answers in an UserAnswers list.
  @override
  int get correct;

  /// Number of wrong answers in an UserAnswers list.
  @override
  int get wrong;

  /// Number of isDanger questions in an UserAnswers list.
  @override
  int get isDanger;

  /// Number of wrong answers in isDanger questions in an UserAnswers list.
  @override
  int get wrongIsDanger;

  /// Create a copy of UserAnswersSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserAnswersSummaryImplCopyWith<_$UserAnswersSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Exam _$ExamFromJson(Map<String, dynamic> json) {
  return _Exam.fromJson(json);
}

/// @nodoc
mixin _$Exam {
  String get examId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdUtcTime => throw _privateConstructorUsedError;
  List<int> get questionDbIndexes => throw _privateConstructorUsedError;
  License get license => throw _privateConstructorUsedError;
  UserAnswersMap get userAnswers => throw _privateConstructorUsedError;
  DateTime? get lastAttemptedUtcTime => throw _privateConstructorUsedError;

  /// Serializes this Exam to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExamCopyWith<Exam> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamCopyWith<$Res> {
  factory $ExamCopyWith(Exam value, $Res Function(Exam) then) =
      _$ExamCopyWithImpl<$Res, Exam>;
  @useResult
  $Res call({
    String examId,
    String name,
    DateTime createdUtcTime,
    List<int> questionDbIndexes,
    License license,
    UserAnswersMap userAnswers,
    DateTime? lastAttemptedUtcTime,
  });

  $UserAnswersMapCopyWith<$Res> get userAnswers;
}

/// @nodoc
class _$ExamCopyWithImpl<$Res, $Val extends Exam>
    implements $ExamCopyWith<$Res> {
  _$ExamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? examId = null,
    Object? name = null,
    Object? createdUtcTime = null,
    Object? questionDbIndexes = null,
    Object? license = null,
    Object? userAnswers = null,
    Object? lastAttemptedUtcTime = freezed,
  }) {
    return _then(
      _value.copyWith(
            examId: null == examId
                ? _value.examId
                : examId // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            createdUtcTime: null == createdUtcTime
                ? _value.createdUtcTime
                : createdUtcTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            questionDbIndexes: null == questionDbIndexes
                ? _value.questionDbIndexes
                : questionDbIndexes // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            license: null == license
                ? _value.license
                : license // ignore: cast_nullable_to_non_nullable
                      as License,
            userAnswers: null == userAnswers
                ? _value.userAnswers
                : userAnswers // ignore: cast_nullable_to_non_nullable
                      as UserAnswersMap,
            lastAttemptedUtcTime: freezed == lastAttemptedUtcTime
                ? _value.lastAttemptedUtcTime
                : lastAttemptedUtcTime // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserAnswersMapCopyWith<$Res> get userAnswers {
    return $UserAnswersMapCopyWith<$Res>(_value.userAnswers, (value) {
      return _then(_value.copyWith(userAnswers: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExamImplCopyWith<$Res> implements $ExamCopyWith<$Res> {
  factory _$$ExamImplCopyWith(
    _$ExamImpl value,
    $Res Function(_$ExamImpl) then,
  ) = __$$ExamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String examId,
    String name,
    DateTime createdUtcTime,
    List<int> questionDbIndexes,
    License license,
    UserAnswersMap userAnswers,
    DateTime? lastAttemptedUtcTime,
  });

  @override
  $UserAnswersMapCopyWith<$Res> get userAnswers;
}

/// @nodoc
class __$$ExamImplCopyWithImpl<$Res>
    extends _$ExamCopyWithImpl<$Res, _$ExamImpl>
    implements _$$ExamImplCopyWith<$Res> {
  __$$ExamImplCopyWithImpl(_$ExamImpl _value, $Res Function(_$ExamImpl) _then)
    : super(_value, _then);

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? examId = null,
    Object? name = null,
    Object? createdUtcTime = null,
    Object? questionDbIndexes = null,
    Object? license = null,
    Object? userAnswers = null,
    Object? lastAttemptedUtcTime = freezed,
  }) {
    return _then(
      _$ExamImpl(
        examId: null == examId
            ? _value.examId
            : examId // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        createdUtcTime: null == createdUtcTime
            ? _value.createdUtcTime
            : createdUtcTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        questionDbIndexes: null == questionDbIndexes
            ? _value._questionDbIndexes
            : questionDbIndexes // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        license: null == license
            ? _value.license
            : license // ignore: cast_nullable_to_non_nullable
                  as License,
        userAnswers: null == userAnswers
            ? _value.userAnswers
            : userAnswers // ignore: cast_nullable_to_non_nullable
                  as UserAnswersMap,
        lastAttemptedUtcTime: freezed == lastAttemptedUtcTime
            ? _value.lastAttemptedUtcTime
            : lastAttemptedUtcTime // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ExamImpl extends _Exam {
  const _$ExamImpl({
    this.examId = '000000000000000000000000000',
    required this.name,
    required this.createdUtcTime,
    required final List<int> questionDbIndexes,
    required this.license,
    this.userAnswers = UserAnswersMap.empty,
    this.lastAttemptedUtcTime,
  }) : _questionDbIndexes = questionDbIndexes,
       super._();

  factory _$ExamImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExamImplFromJson(json);

  @override
  @JsonKey()
  final String examId;
  @override
  final String name;
  @override
  final DateTime createdUtcTime;
  final List<int> _questionDbIndexes;
  @override
  List<int> get questionDbIndexes {
    if (_questionDbIndexes is EqualUnmodifiableListView)
      return _questionDbIndexes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionDbIndexes);
  }

  @override
  final License license;
  @override
  @JsonKey()
  final UserAnswersMap userAnswers;
  @override
  final DateTime? lastAttemptedUtcTime;

  @override
  String toString() {
    return 'Exam(examId: $examId, name: $name, createdUtcTime: $createdUtcTime, questionDbIndexes: $questionDbIndexes, license: $license, userAnswers: $userAnswers, lastAttemptedUtcTime: $lastAttemptedUtcTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExamImpl &&
            (identical(other.examId, examId) || other.examId == examId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdUtcTime, createdUtcTime) ||
                other.createdUtcTime == createdUtcTime) &&
            const DeepCollectionEquality().equals(
              other._questionDbIndexes,
              _questionDbIndexes,
            ) &&
            (identical(other.license, license) || other.license == license) &&
            (identical(other.userAnswers, userAnswers) ||
                other.userAnswers == userAnswers) &&
            (identical(other.lastAttemptedUtcTime, lastAttemptedUtcTime) ||
                other.lastAttemptedUtcTime == lastAttemptedUtcTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    examId,
    name,
    createdUtcTime,
    const DeepCollectionEquality().hash(_questionDbIndexes),
    license,
    userAnswers,
    lastAttemptedUtcTime,
  );

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExamImplCopyWith<_$ExamImpl> get copyWith =>
      __$$ExamImplCopyWithImpl<_$ExamImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExamImplToJson(this);
  }
}

abstract class _Exam extends Exam {
  const factory _Exam({
    final String examId,
    required final String name,
    required final DateTime createdUtcTime,
    required final List<int> questionDbIndexes,
    required final License license,
    final UserAnswersMap userAnswers,
    final DateTime? lastAttemptedUtcTime,
  }) = _$ExamImpl;
  const _Exam._() : super._();

  factory _Exam.fromJson(Map<String, dynamic> json) = _$ExamImpl.fromJson;

  @override
  String get examId;
  @override
  String get name;
  @override
  DateTime get createdUtcTime;
  @override
  List<int> get questionDbIndexes;
  @override
  License get license;
  @override
  UserAnswersMap get userAnswers;
  @override
  DateTime? get lastAttemptedUtcTime;

  /// Create a copy of Exam
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExamImplCopyWith<_$ExamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

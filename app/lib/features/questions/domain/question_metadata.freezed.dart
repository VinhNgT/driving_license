// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_metadata.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

QuestionMetadata _$QuestionMetadataFromJson(Map<String, dynamic> json) {
  return _QuestionMetadata.fromJson(json);
}

/// @nodoc
mixin _$QuestionMetadata {
  int get questionDbIndex => throw _privateConstructorUsedError;
  int get chapterDbIndex => throw _privateConstructorUsedError;
  int? get subChapterDbIndex => throw _privateConstructorUsedError;
  bool get isDanger => throw _privateConstructorUsedError;
  bool get isDifficult => throw _privateConstructorUsedError;
  int get correctAnswerIndex => throw _privateConstructorUsedError;
  Set<License> get includedLicenses => throw _privateConstructorUsedError;

  /// Serializes this QuestionMetadata to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of QuestionMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionMetadataCopyWith<QuestionMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionMetadataCopyWith<$Res> {
  factory $QuestionMetadataCopyWith(
    QuestionMetadata value,
    $Res Function(QuestionMetadata) then,
  ) = _$QuestionMetadataCopyWithImpl<$Res, QuestionMetadata>;
  @useResult
  $Res call({
    int questionDbIndex,
    int chapterDbIndex,
    int? subChapterDbIndex,
    bool isDanger,
    bool isDifficult,
    int correctAnswerIndex,
    Set<License> includedLicenses,
  });
}

/// @nodoc
class _$QuestionMetadataCopyWithImpl<$Res, $Val extends QuestionMetadata>
    implements $QuestionMetadataCopyWith<$Res> {
  _$QuestionMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of QuestionMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionDbIndex = null,
    Object? chapterDbIndex = null,
    Object? subChapterDbIndex = freezed,
    Object? isDanger = null,
    Object? isDifficult = null,
    Object? correctAnswerIndex = null,
    Object? includedLicenses = null,
  }) {
    return _then(
      _value.copyWith(
            questionDbIndex: null == questionDbIndex
                ? _value.questionDbIndex
                : questionDbIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            chapterDbIndex: null == chapterDbIndex
                ? _value.chapterDbIndex
                : chapterDbIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            subChapterDbIndex: freezed == subChapterDbIndex
                ? _value.subChapterDbIndex
                : subChapterDbIndex // ignore: cast_nullable_to_non_nullable
                      as int?,
            isDanger: null == isDanger
                ? _value.isDanger
                : isDanger // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDifficult: null == isDifficult
                ? _value.isDifficult
                : isDifficult // ignore: cast_nullable_to_non_nullable
                      as bool,
            correctAnswerIndex: null == correctAnswerIndex
                ? _value.correctAnswerIndex
                : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            includedLicenses: null == includedLicenses
                ? _value.includedLicenses
                : includedLicenses // ignore: cast_nullable_to_non_nullable
                      as Set<License>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$QuestionMetadataImplCopyWith<$Res>
    implements $QuestionMetadataCopyWith<$Res> {
  factory _$$QuestionMetadataImplCopyWith(
    _$QuestionMetadataImpl value,
    $Res Function(_$QuestionMetadataImpl) then,
  ) = __$$QuestionMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int questionDbIndex,
    int chapterDbIndex,
    int? subChapterDbIndex,
    bool isDanger,
    bool isDifficult,
    int correctAnswerIndex,
    Set<License> includedLicenses,
  });
}

/// @nodoc
class __$$QuestionMetadataImplCopyWithImpl<$Res>
    extends _$QuestionMetadataCopyWithImpl<$Res, _$QuestionMetadataImpl>
    implements _$$QuestionMetadataImplCopyWith<$Res> {
  __$$QuestionMetadataImplCopyWithImpl(
    _$QuestionMetadataImpl _value,
    $Res Function(_$QuestionMetadataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of QuestionMetadata
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionDbIndex = null,
    Object? chapterDbIndex = null,
    Object? subChapterDbIndex = freezed,
    Object? isDanger = null,
    Object? isDifficult = null,
    Object? correctAnswerIndex = null,
    Object? includedLicenses = null,
  }) {
    return _then(
      _$QuestionMetadataImpl(
        questionDbIndex: null == questionDbIndex
            ? _value.questionDbIndex
            : questionDbIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        chapterDbIndex: null == chapterDbIndex
            ? _value.chapterDbIndex
            : chapterDbIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        subChapterDbIndex: freezed == subChapterDbIndex
            ? _value.subChapterDbIndex
            : subChapterDbIndex // ignore: cast_nullable_to_non_nullable
                  as int?,
        isDanger: null == isDanger
            ? _value.isDanger
            : isDanger // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDifficult: null == isDifficult
            ? _value.isDifficult
            : isDifficult // ignore: cast_nullable_to_non_nullable
                  as bool,
        correctAnswerIndex: null == correctAnswerIndex
            ? _value.correctAnswerIndex
            : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        includedLicenses: null == includedLicenses
            ? _value._includedLicenses
            : includedLicenses // ignore: cast_nullable_to_non_nullable
                  as Set<License>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuestionMetadataImpl implements _QuestionMetadata {
  const _$QuestionMetadataImpl({
    required this.questionDbIndex,
    required this.chapterDbIndex,
    this.subChapterDbIndex,
    required this.isDanger,
    required this.isDifficult,
    required this.correctAnswerIndex,
    required final Set<License> includedLicenses,
  }) : _includedLicenses = includedLicenses;

  factory _$QuestionMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionMetadataImplFromJson(json);

  @override
  final int questionDbIndex;
  @override
  final int chapterDbIndex;
  @override
  final int? subChapterDbIndex;
  @override
  final bool isDanger;
  @override
  final bool isDifficult;
  @override
  final int correctAnswerIndex;
  final Set<License> _includedLicenses;
  @override
  Set<License> get includedLicenses {
    if (_includedLicenses is EqualUnmodifiableSetView) return _includedLicenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_includedLicenses);
  }

  @override
  String toString() {
    return 'QuestionMetadata(questionDbIndex: $questionDbIndex, chapterDbIndex: $chapterDbIndex, subChapterDbIndex: $subChapterDbIndex, isDanger: $isDanger, isDifficult: $isDifficult, correctAnswerIndex: $correctAnswerIndex, includedLicenses: $includedLicenses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionMetadataImpl &&
            (identical(other.questionDbIndex, questionDbIndex) ||
                other.questionDbIndex == questionDbIndex) &&
            (identical(other.chapterDbIndex, chapterDbIndex) ||
                other.chapterDbIndex == chapterDbIndex) &&
            (identical(other.subChapterDbIndex, subChapterDbIndex) ||
                other.subChapterDbIndex == subChapterDbIndex) &&
            (identical(other.isDanger, isDanger) ||
                other.isDanger == isDanger) &&
            (identical(other.isDifficult, isDifficult) ||
                other.isDifficult == isDifficult) &&
            (identical(other.correctAnswerIndex, correctAnswerIndex) ||
                other.correctAnswerIndex == correctAnswerIndex) &&
            const DeepCollectionEquality().equals(
              other._includedLicenses,
              _includedLicenses,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    questionDbIndex,
    chapterDbIndex,
    subChapterDbIndex,
    isDanger,
    isDifficult,
    correctAnswerIndex,
    const DeepCollectionEquality().hash(_includedLicenses),
  );

  /// Create a copy of QuestionMetadata
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionMetadataImplCopyWith<_$QuestionMetadataImpl> get copyWith =>
      __$$QuestionMetadataImplCopyWithImpl<_$QuestionMetadataImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionMetadataImplToJson(this);
  }
}

abstract class _QuestionMetadata implements QuestionMetadata {
  const factory _QuestionMetadata({
    required final int questionDbIndex,
    required final int chapterDbIndex,
    final int? subChapterDbIndex,
    required final bool isDanger,
    required final bool isDifficult,
    required final int correctAnswerIndex,
    required final Set<License> includedLicenses,
  }) = _$QuestionMetadataImpl;

  factory _QuestionMetadata.fromJson(Map<String, dynamic> json) =
      _$QuestionMetadataImpl.fromJson;

  @override
  int get questionDbIndex;
  @override
  int get chapterDbIndex;
  @override
  int? get subChapterDbIndex;
  @override
  bool get isDanger;
  @override
  bool get isDifficult;
  @override
  int get correctAnswerIndex;
  @override
  Set<License> get includedLicenses;

  /// Create a copy of QuestionMetadata
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionMetadataImplCopyWith<_$QuestionMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

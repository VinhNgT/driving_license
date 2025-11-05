// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Question _$QuestionFromJson(Map<String, dynamic> json) {
  return _Question.fromJson(json);
}

/// @nodoc
mixin _$Question {
  int get questionDbIndex => throw _privateConstructorUsedError;
  int get chapterDbIndex => throw _privateConstructorUsedError;
  int? get subChapterDbIndex => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get questionImagePath => throw _privateConstructorUsedError;
  bool get isDanger => throw _privateConstructorUsedError;
  bool get isDifficult => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  int get correctAnswerIndex => throw _privateConstructorUsedError;
  String? get explanation => throw _privateConstructorUsedError;
  String? get rememberTip => throw _privateConstructorUsedError;
  Set<License> get includedLicenses => throw _privateConstructorUsedError;

  /// Serializes this Question to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $QuestionCopyWith<Question> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionCopyWith<$Res> {
  factory $QuestionCopyWith(Question value, $Res Function(Question) then) =
      _$QuestionCopyWithImpl<$Res, Question>;
  @useResult
  $Res call({
    int questionDbIndex,
    int chapterDbIndex,
    int? subChapterDbIndex,
    String title,
    String? questionImagePath,
    bool isDanger,
    bool isDifficult,
    List<String> answers,
    int correctAnswerIndex,
    String? explanation,
    String? rememberTip,
    Set<License> includedLicenses,
  });
}

/// @nodoc
class _$QuestionCopyWithImpl<$Res, $Val extends Question>
    implements $QuestionCopyWith<$Res> {
  _$QuestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionDbIndex = null,
    Object? chapterDbIndex = null,
    Object? subChapterDbIndex = freezed,
    Object? title = null,
    Object? questionImagePath = freezed,
    Object? isDanger = null,
    Object? isDifficult = null,
    Object? answers = null,
    Object? correctAnswerIndex = null,
    Object? explanation = freezed,
    Object? rememberTip = freezed,
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
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            questionImagePath: freezed == questionImagePath
                ? _value.questionImagePath
                : questionImagePath // ignore: cast_nullable_to_non_nullable
                      as String?,
            isDanger: null == isDanger
                ? _value.isDanger
                : isDanger // ignore: cast_nullable_to_non_nullable
                      as bool,
            isDifficult: null == isDifficult
                ? _value.isDifficult
                : isDifficult // ignore: cast_nullable_to_non_nullable
                      as bool,
            answers: null == answers
                ? _value.answers
                : answers // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            correctAnswerIndex: null == correctAnswerIndex
                ? _value.correctAnswerIndex
                : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            explanation: freezed == explanation
                ? _value.explanation
                : explanation // ignore: cast_nullable_to_non_nullable
                      as String?,
            rememberTip: freezed == rememberTip
                ? _value.rememberTip
                : rememberTip // ignore: cast_nullable_to_non_nullable
                      as String?,
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
abstract class _$$QuestionImplCopyWith<$Res>
    implements $QuestionCopyWith<$Res> {
  factory _$$QuestionImplCopyWith(
    _$QuestionImpl value,
    $Res Function(_$QuestionImpl) then,
  ) = __$$QuestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int questionDbIndex,
    int chapterDbIndex,
    int? subChapterDbIndex,
    String title,
    String? questionImagePath,
    bool isDanger,
    bool isDifficult,
    List<String> answers,
    int correctAnswerIndex,
    String? explanation,
    String? rememberTip,
    Set<License> includedLicenses,
  });
}

/// @nodoc
class __$$QuestionImplCopyWithImpl<$Res>
    extends _$QuestionCopyWithImpl<$Res, _$QuestionImpl>
    implements _$$QuestionImplCopyWith<$Res> {
  __$$QuestionImplCopyWithImpl(
    _$QuestionImpl _value,
    $Res Function(_$QuestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? questionDbIndex = null,
    Object? chapterDbIndex = null,
    Object? subChapterDbIndex = freezed,
    Object? title = null,
    Object? questionImagePath = freezed,
    Object? isDanger = null,
    Object? isDifficult = null,
    Object? answers = null,
    Object? correctAnswerIndex = null,
    Object? explanation = freezed,
    Object? rememberTip = freezed,
    Object? includedLicenses = null,
  }) {
    return _then(
      _$QuestionImpl(
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
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        questionImagePath: freezed == questionImagePath
            ? _value.questionImagePath
            : questionImagePath // ignore: cast_nullable_to_non_nullable
                  as String?,
        isDanger: null == isDanger
            ? _value.isDanger
            : isDanger // ignore: cast_nullable_to_non_nullable
                  as bool,
        isDifficult: null == isDifficult
            ? _value.isDifficult
            : isDifficult // ignore: cast_nullable_to_non_nullable
                  as bool,
        answers: null == answers
            ? _value._answers
            : answers // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        correctAnswerIndex: null == correctAnswerIndex
            ? _value.correctAnswerIndex
            : correctAnswerIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        explanation: freezed == explanation
            ? _value.explanation
            : explanation // ignore: cast_nullable_to_non_nullable
                  as String?,
        rememberTip: freezed == rememberTip
            ? _value.rememberTip
            : rememberTip // ignore: cast_nullable_to_non_nullable
                  as String?,
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
class _$QuestionImpl extends _Question {
  const _$QuestionImpl({
    required this.questionDbIndex,
    required this.chapterDbIndex,
    this.subChapterDbIndex,
    required this.title,
    this.questionImagePath,
    required this.isDanger,
    required this.isDifficult,
    required final List<String> answers,
    required this.correctAnswerIndex,
    this.explanation,
    this.rememberTip,
    required final Set<License> includedLicenses,
  }) : _answers = answers,
       _includedLicenses = includedLicenses,
       super._();

  factory _$QuestionImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuestionImplFromJson(json);

  @override
  final int questionDbIndex;
  @override
  final int chapterDbIndex;
  @override
  final int? subChapterDbIndex;
  @override
  final String title;
  @override
  final String? questionImagePath;
  @override
  final bool isDanger;
  @override
  final bool isDifficult;
  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  final int correctAnswerIndex;
  @override
  final String? explanation;
  @override
  final String? rememberTip;
  final Set<License> _includedLicenses;
  @override
  Set<License> get includedLicenses {
    if (_includedLicenses is EqualUnmodifiableSetView) return _includedLicenses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_includedLicenses);
  }

  @override
  String toString() {
    return 'Question(questionDbIndex: $questionDbIndex, chapterDbIndex: $chapterDbIndex, subChapterDbIndex: $subChapterDbIndex, title: $title, questionImagePath: $questionImagePath, isDanger: $isDanger, isDifficult: $isDifficult, answers: $answers, correctAnswerIndex: $correctAnswerIndex, explanation: $explanation, rememberTip: $rememberTip, includedLicenses: $includedLicenses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuestionImpl &&
            (identical(other.questionDbIndex, questionDbIndex) ||
                other.questionDbIndex == questionDbIndex) &&
            (identical(other.chapterDbIndex, chapterDbIndex) ||
                other.chapterDbIndex == chapterDbIndex) &&
            (identical(other.subChapterDbIndex, subChapterDbIndex) ||
                other.subChapterDbIndex == subChapterDbIndex) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.questionImagePath, questionImagePath) ||
                other.questionImagePath == questionImagePath) &&
            (identical(other.isDanger, isDanger) ||
                other.isDanger == isDanger) &&
            (identical(other.isDifficult, isDifficult) ||
                other.isDifficult == isDifficult) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.correctAnswerIndex, correctAnswerIndex) ||
                other.correctAnswerIndex == correctAnswerIndex) &&
            (identical(other.explanation, explanation) ||
                other.explanation == explanation) &&
            (identical(other.rememberTip, rememberTip) ||
                other.rememberTip == rememberTip) &&
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
    title,
    questionImagePath,
    isDanger,
    isDifficult,
    const DeepCollectionEquality().hash(_answers),
    correctAnswerIndex,
    explanation,
    rememberTip,
    const DeepCollectionEquality().hash(_includedLicenses),
  );

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      __$$QuestionImplCopyWithImpl<_$QuestionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$QuestionImplToJson(this);
  }
}

abstract class _Question extends Question {
  const factory _Question({
    required final int questionDbIndex,
    required final int chapterDbIndex,
    final int? subChapterDbIndex,
    required final String title,
    final String? questionImagePath,
    required final bool isDanger,
    required final bool isDifficult,
    required final List<String> answers,
    required final int correctAnswerIndex,
    final String? explanation,
    final String? rememberTip,
    required final Set<License> includedLicenses,
  }) = _$QuestionImpl;
  const _Question._() : super._();

  factory _Question.fromJson(Map<String, dynamic> json) =
      _$QuestionImpl.fromJson;

  @override
  int get questionDbIndex;
  @override
  int get chapterDbIndex;
  @override
  int? get subChapterDbIndex;
  @override
  String get title;
  @override
  String? get questionImagePath;
  @override
  bool get isDanger;
  @override
  bool get isDifficult;
  @override
  List<String> get answers;
  @override
  int get correctAnswerIndex;
  @override
  String? get explanation;
  @override
  String? get rememberTip;
  @override
  Set<License> get includedLicenses;

  /// Create a copy of Question
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuestionImplCopyWith<_$QuestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

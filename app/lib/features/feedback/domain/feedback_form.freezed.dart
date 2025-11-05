// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

FeedbackForm _$FeedbackFormFromJson(Map<String, dynamic> json) {
  return _FeedbackForm.fromJson(json);
}

/// @nodoc
mixin _$FeedbackForm {
  DateTime get dateTime => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String get feedback => throw _privateConstructorUsedError;

  /// Serializes this FeedbackForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FeedbackFormCopyWith<FeedbackForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackFormCopyWith<$Res> {
  factory $FeedbackFormCopyWith(
    FeedbackForm value,
    $Res Function(FeedbackForm) then,
  ) = _$FeedbackFormCopyWithImpl<$Res, FeedbackForm>;
  @useResult
  $Res call({
    DateTime dateTime,
    String version,
    String? email,
    String feedback,
  });
}

/// @nodoc
class _$FeedbackFormCopyWithImpl<$Res, $Val extends FeedbackForm>
    implements $FeedbackFormCopyWith<$Res> {
  _$FeedbackFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? version = null,
    Object? email = freezed,
    Object? feedback = null,
  }) {
    return _then(
      _value.copyWith(
            dateTime: null == dateTime
                ? _value.dateTime
                : dateTime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            version: null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            feedback: null == feedback
                ? _value.feedback
                : feedback // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$FeedbackFormImplCopyWith<$Res>
    implements $FeedbackFormCopyWith<$Res> {
  factory _$$FeedbackFormImplCopyWith(
    _$FeedbackFormImpl value,
    $Res Function(_$FeedbackFormImpl) then,
  ) = __$$FeedbackFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    DateTime dateTime,
    String version,
    String? email,
    String feedback,
  });
}

/// @nodoc
class __$$FeedbackFormImplCopyWithImpl<$Res>
    extends _$FeedbackFormCopyWithImpl<$Res, _$FeedbackFormImpl>
    implements _$$FeedbackFormImplCopyWith<$Res> {
  __$$FeedbackFormImplCopyWithImpl(
    _$FeedbackFormImpl _value,
    $Res Function(_$FeedbackFormImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
    Object? version = null,
    Object? email = freezed,
    Object? feedback = null,
  }) {
    return _then(
      _$FeedbackFormImpl(
        dateTime: null == dateTime
            ? _value.dateTime
            : dateTime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        version: null == version
            ? _value.version
            : version // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        feedback: null == feedback
            ? _value.feedback
            : feedback // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$FeedbackFormImpl implements _FeedbackForm {
  _$FeedbackFormImpl({
    required this.dateTime,
    required this.version,
    this.email,
    required this.feedback,
  });

  factory _$FeedbackFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$FeedbackFormImplFromJson(json);

  @override
  final DateTime dateTime;
  @override
  final String version;
  @override
  final String? email;
  @override
  final String feedback;

  @override
  String toString() {
    return 'FeedbackForm(dateTime: $dateTime, version: $version, email: $email, feedback: $feedback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackFormImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, dateTime, version, email, feedback);

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackFormImplCopyWith<_$FeedbackFormImpl> get copyWith =>
      __$$FeedbackFormImplCopyWithImpl<_$FeedbackFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FeedbackFormImplToJson(this);
  }
}

abstract class _FeedbackForm implements FeedbackForm {
  factory _FeedbackForm({
    required final DateTime dateTime,
    required final String version,
    final String? email,
    required final String feedback,
  }) = _$FeedbackFormImpl;

  factory _FeedbackForm.fromJson(Map<String, dynamic> json) =
      _$FeedbackFormImpl.fromJson;

  @override
  DateTime get dateTime;
  @override
  String get version;
  @override
  String? get email;
  @override
  String get feedback;

  /// Create a copy of FeedbackForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FeedbackFormImplCopyWith<_$FeedbackFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

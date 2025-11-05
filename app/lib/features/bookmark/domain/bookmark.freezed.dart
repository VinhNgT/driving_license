// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Bookmark _$BookmarkFromJson(Map<String, dynamic> json) {
  return _Bookmark.fromJson(json);
}

/// @nodoc
mixin _$Bookmark {
  int get questionDbIndex => throw _privateConstructorUsedError;
  QuestionMetadata get questionMetadata => throw _privateConstructorUsedError;

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookmarkCopyWith<Bookmark> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookmarkCopyWith<$Res> {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) then) =
      _$BookmarkCopyWithImpl<$Res, Bookmark>;
  @useResult
  $Res call({int questionDbIndex, QuestionMetadata questionMetadata});

  $QuestionMetadataCopyWith<$Res> get questionMetadata;
}

/// @nodoc
class _$BookmarkCopyWithImpl<$Res, $Val extends Bookmark>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? questionDbIndex = null, Object? questionMetadata = null}) {
    return _then(
      _value.copyWith(
            questionDbIndex: null == questionDbIndex
                ? _value.questionDbIndex
                : questionDbIndex // ignore: cast_nullable_to_non_nullable
                      as int,
            questionMetadata: null == questionMetadata
                ? _value.questionMetadata
                : questionMetadata // ignore: cast_nullable_to_non_nullable
                      as QuestionMetadata,
          )
          as $Val,
    );
  }

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $QuestionMetadataCopyWith<$Res> get questionMetadata {
    return $QuestionMetadataCopyWith<$Res>(_value.questionMetadata, (value) {
      return _then(_value.copyWith(questionMetadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BookmarkImplCopyWith<$Res>
    implements $BookmarkCopyWith<$Res> {
  factory _$$BookmarkImplCopyWith(
    _$BookmarkImpl value,
    $Res Function(_$BookmarkImpl) then,
  ) = __$$BookmarkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int questionDbIndex, QuestionMetadata questionMetadata});

  @override
  $QuestionMetadataCopyWith<$Res> get questionMetadata;
}

/// @nodoc
class __$$BookmarkImplCopyWithImpl<$Res>
    extends _$BookmarkCopyWithImpl<$Res, _$BookmarkImpl>
    implements _$$BookmarkImplCopyWith<$Res> {
  __$$BookmarkImplCopyWithImpl(
    _$BookmarkImpl _value,
    $Res Function(_$BookmarkImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? questionDbIndex = null, Object? questionMetadata = null}) {
    return _then(
      _$BookmarkImpl(
        questionDbIndex: null == questionDbIndex
            ? _value.questionDbIndex
            : questionDbIndex // ignore: cast_nullable_to_non_nullable
                  as int,
        questionMetadata: null == questionMetadata
            ? _value.questionMetadata
            : questionMetadata // ignore: cast_nullable_to_non_nullable
                  as QuestionMetadata,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookmarkImpl implements _Bookmark {
  const _$BookmarkImpl({
    required this.questionDbIndex,
    required this.questionMetadata,
  });

  factory _$BookmarkImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookmarkImplFromJson(json);

  @override
  final int questionDbIndex;
  @override
  final QuestionMetadata questionMetadata;

  @override
  String toString() {
    return 'Bookmark(questionDbIndex: $questionDbIndex, questionMetadata: $questionMetadata)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarkImpl &&
            (identical(other.questionDbIndex, questionDbIndex) ||
                other.questionDbIndex == questionDbIndex) &&
            (identical(other.questionMetadata, questionMetadata) ||
                other.questionMetadata == questionMetadata));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, questionDbIndex, questionMetadata);

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarkImplCopyWith<_$BookmarkImpl> get copyWith =>
      __$$BookmarkImplCopyWithImpl<_$BookmarkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookmarkImplToJson(this);
  }
}

abstract class _Bookmark implements Bookmark {
  const factory _Bookmark({
    required final int questionDbIndex,
    required final QuestionMetadata questionMetadata,
  }) = _$BookmarkImpl;

  factory _Bookmark.fromJson(Map<String, dynamic> json) =
      _$BookmarkImpl.fromJson;

  @override
  int get questionDbIndex;
  @override
  QuestionMetadata get questionMetadata;

  /// Create a copy of Bookmark
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarkImplCopyWith<_$BookmarkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

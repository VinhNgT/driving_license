// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'iap_product_purchase.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

IapProductPurchase _$IapProductPurchaseFromJson(Map<String, dynamic> json) {
  return _IapProductPurchase.fromJson(json);
}

/// @nodoc
mixin _$IapProductPurchase {
  String get id => throw _privateConstructorUsedError;
  IapProductPurchaseState get state => throw _privateConstructorUsedError;

  /// Serializes this IapProductPurchase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of IapProductPurchase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $IapProductPurchaseCopyWith<IapProductPurchase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IapProductPurchaseCopyWith<$Res> {
  factory $IapProductPurchaseCopyWith(
    IapProductPurchase value,
    $Res Function(IapProductPurchase) then,
  ) = _$IapProductPurchaseCopyWithImpl<$Res, IapProductPurchase>;
  @useResult
  $Res call({String id, IapProductPurchaseState state});
}

/// @nodoc
class _$IapProductPurchaseCopyWithImpl<$Res, $Val extends IapProductPurchase>
    implements $IapProductPurchaseCopyWith<$Res> {
  _$IapProductPurchaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of IapProductPurchase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? state = null}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            state: null == state
                ? _value.state
                : state // ignore: cast_nullable_to_non_nullable
                      as IapProductPurchaseState,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$IapProductPurchaseImplCopyWith<$Res>
    implements $IapProductPurchaseCopyWith<$Res> {
  factory _$$IapProductPurchaseImplCopyWith(
    _$IapProductPurchaseImpl value,
    $Res Function(_$IapProductPurchaseImpl) then,
  ) = __$$IapProductPurchaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, IapProductPurchaseState state});
}

/// @nodoc
class __$$IapProductPurchaseImplCopyWithImpl<$Res>
    extends _$IapProductPurchaseCopyWithImpl<$Res, _$IapProductPurchaseImpl>
    implements _$$IapProductPurchaseImplCopyWith<$Res> {
  __$$IapProductPurchaseImplCopyWithImpl(
    _$IapProductPurchaseImpl _value,
    $Res Function(_$IapProductPurchaseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of IapProductPurchase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? state = null}) {
    return _then(
      _$IapProductPurchaseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        state: null == state
            ? _value.state
            : state // ignore: cast_nullable_to_non_nullable
                  as IapProductPurchaseState,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$IapProductPurchaseImpl implements _IapProductPurchase {
  const _$IapProductPurchaseImpl({required this.id, required this.state});

  factory _$IapProductPurchaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$IapProductPurchaseImplFromJson(json);

  @override
  final String id;
  @override
  final IapProductPurchaseState state;

  @override
  String toString() {
    return 'IapProductPurchase(id: $id, state: $state)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IapProductPurchaseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.state, state) || other.state == state));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, state);

  /// Create a copy of IapProductPurchase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IapProductPurchaseImplCopyWith<_$IapProductPurchaseImpl> get copyWith =>
      __$$IapProductPurchaseImplCopyWithImpl<_$IapProductPurchaseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$IapProductPurchaseImplToJson(this);
  }
}

abstract class _IapProductPurchase implements IapProductPurchase {
  const factory _IapProductPurchase({
    required final String id,
    required final IapProductPurchaseState state,
  }) = _$IapProductPurchaseImpl;

  factory _IapProductPurchase.fromJson(Map<String, dynamic> json) =
      _$IapProductPurchaseImpl.fromJson;

  @override
  String get id;
  @override
  IapProductPurchaseState get state;

  /// Create a copy of IapProductPurchase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IapProductPurchaseImplCopyWith<_$IapProductPurchaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

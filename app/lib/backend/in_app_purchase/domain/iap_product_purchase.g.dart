// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'iap_product_purchase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$IapProductPurchaseImpl _$$IapProductPurchaseImplFromJson(
  Map<String, dynamic> json,
) => _$IapProductPurchaseImpl(
  id: json['id'] as String,
  state: $enumDecode(_$IapProductPurchaseStateEnumMap, json['state']),
);

Map<String, dynamic> _$$IapProductPurchaseImplToJson(
  _$IapProductPurchaseImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'state': _$IapProductPurchaseStateEnumMap[instance.state]!,
};

const _$IapProductPurchaseStateEnumMap = {
  IapProductPurchaseState.pending: 'pending',
  IapProductPurchaseState.purchased: 'purchased',
};

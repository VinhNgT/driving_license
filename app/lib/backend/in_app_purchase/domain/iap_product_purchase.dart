import 'package:freezed_annotation/freezed_annotation.dart';

part 'iap_product_purchase.freezed.dart';
part 'iap_product_purchase.g.dart';

enum IapProductPurchaseState {
  pending,
  purchased,
}

@freezed
abstract class IapProductPurchase with _$IapProductPurchase {
  /// An object to represent a purchase of an iap product.
  const factory IapProductPurchase({
    required String id,
    required IapProductPurchaseState state,
  }) = _IapProductPurchase;

  factory IapProductPurchase.fromJson(Map<String, dynamic> json) =>
      _$IapProductPurchaseFromJson(json);
}

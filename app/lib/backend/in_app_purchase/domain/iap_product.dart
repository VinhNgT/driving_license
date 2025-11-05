import 'package:in_app_purchase/in_app_purchase.dart';

/// Represents a product entry in the in-app purchase catalog.
///
/// We use this to query and get [IapProduct].
abstract interface class IapProductEntry {
  String get id;
}

/// Represents an actual product that can be purchased.
class IapProduct<T extends IapProductEntry> {
  /// A product that can be purchased.
  const IapProduct(this.productDetails, this.entry);

  final ProductDetails productDetails;
  final T entry;

  String get id => productDetails.id;
  String get title => productDetails.title;
  String get description => productDetails.description;
  String get price => productDetails.price;
}

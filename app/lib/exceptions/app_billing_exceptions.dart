import 'package:driving_license/exceptions/app_exception.dart';

abstract class AppBillingException extends AppException {
  const AppBillingException(super.message);
}

class UserCancelPurchaseException extends AppBillingException {
  const UserCancelPurchaseException(this.productId)
      : super('User canceled the purchase of $productId');

  final String productId;
}

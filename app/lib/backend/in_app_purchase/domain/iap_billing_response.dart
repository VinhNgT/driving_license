// flutter/packages/in_app_purchase/in_app_purchase_android/lib/src/billing_client_wrappers/billing_client_wrapper.g.dart

// const _$BillingResponseEnumMap = {
//   BillingResponse.serviceTimeout: -3,
//   BillingResponse.featureNotSupported: -2,
//   BillingResponse.serviceDisconnected: -1,
//   BillingResponse.ok: 0,
//   BillingResponse.userCanceled: 1,
//   BillingResponse.serviceUnavailable: 2,
//   BillingResponse.billingUnavailable: 3,
//   BillingResponse.itemUnavailable: 4,
//   BillingResponse.developerError: 5,
//   BillingResponse.error: 6,
//   BillingResponse.itemAlreadyOwned: 7,
//   BillingResponse.itemNotOwned: 8,
//   BillingResponse.networkError: 12,
// };

enum IapBillingResponse {
  serviceTimeout,
  featureNotSupported,
  serviceDisconnected,
  ok,
  userCanceled,
  serviceUnavailable,
  billingUnavailable,
  itemUnavailable,
  developerError,
  error,
  itemAlreadyOwned,
  itemNotOwned,
  networkError;

  static IapBillingResponse byString(String string) {
    for (final value in values) {
      if ('BillingResponse.${value.name}' == string) {
        return value;
      }
    }
    throw ArgumentError.value(
      string,
      'string',
      'Invalid BillingResponse string',
    );
  }
}

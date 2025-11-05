import 'dart:async';

import 'package:driving_license/backend/in_app_purchase/data/iap_providers.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_billing_response.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product_purchase.dart';
import 'package:driving_license/backend/in_app_purchase/iap_service.dart';
import 'package:driving_license/exceptions/app_billing_exceptions.dart';
import 'package:driving_license/features/donate/domain/donate_product_entry.dart';
import 'package:driving_license/logging/logger_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'donate_screen_controller.g.dart';

class PurchaseItemsListController {
  PurchaseItemsListController({required this.iapService, required this.logger});

  final IapService iapService;
  final Logger logger;

  Future<IapProductPurchaseState> buyProduct(IapProduct product) async {
    try {
      return await iapService.buyProduct(product);
    } catch (e, st) {
      if (e is! IAPError) {
        rethrow;
      }

      final billingError = IapBillingResponse.byString(e.message);
      switch (billingError) {
        case IapBillingResponse.userCanceled:
          return Future.error(UserCancelPurchaseException(product.id), st);

        default:
          rethrow;
      }
    }
  }
}

@riverpod
PurchaseItemsListController purchaseItemsListController(Ref ref) {
  final iapService = ref.watch(iapServiceProvider);
  final logger = ref.watch(loggerProvider);

  return PurchaseItemsListController(iapService: iapService, logger: logger);
}

@riverpod
FutureOr<bool> isUserDonated(Ref ref) async {
  // final isAnyPending =
  //     await ref.watch(isAnyPurchasePendingStreamProvider.future);
  final isAnyCompleted = await ref.watch(
    isAnyPurchaseCompletedStreamProvider.future,
  );

  // return isAnyPending || isAnyCompleted;
  return isAnyCompleted;
}

//! This is madness, waiting to change this to generic type once Riverpod 3.0 is
//! released.
@riverpod
FutureOr<List<IapProduct<DonateProductEntry>>> donateProductListFuture(
  Ref ref,
) async {
  // final iapProductsList = await ref
  //    .watch(iapProductsListFutureProvider(DonateProductEntry.values).future);

  final iapProductsList = await ref.watch(
    mockIapProductsListFutureProvider.future,
  );

  return iapProductsList
      .map(
        (e) => IapProduct<DonateProductEntry>(
          e.productDetails,
          e.entry as DonateProductEntry,
        ),
      )
      .toList();
}

import 'dart:async';

import 'package:collection/collection.dart';
import 'package:driving_license/backend/env/application/env_provider.dart';
import 'package:driving_license/backend/in_app_purchase/data/iap_providers.dart';
import 'package:driving_license/backend/in_app_purchase/data/purchases_repository.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product_purchase.dart';
import 'package:driving_license/logging/logger_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'iap_service.g.dart';

class IapService {
  IapService({
    required this.iap,
    required this.purchasesRepository,
    required this.logger,
    this.treatGoogleIapNonConsumableAsConsumable = false,
  });

  final InAppPurchase iap;
  final SembastPurchasesRepository purchasesRepository;
  final Logger logger;

  // Whether to treat Google IAP non-consumable as consumable.
  // This is only for testing purposes. Must be false in production.
  final bool treatGoogleIapNonConsumableAsConsumable;

  /// A completer to handle pending purchase.
  ///
  /// Return a [bool] that indicate whether the purchase is in pending state
  /// or purchased state.
  ///
  /// Only one purchase can be in progress at a time due to API limitations.
  Completer<IapProductPurchaseState>? _purchaseInProgress;

  Future<List<IapProduct>> loadPurchases(
    List<IapProductEntry> productEntries,
  ) async {
    // Get product details from the store.
    final response = await iap.queryProductDetails(
      productEntries.map((e) => e.id).toSet(),
    );

    // Log not found products.
    for (final element in response.notFoundIDs) {
      debugPrint('Purchase $element not found');
    }

    // A map to help sort the returned product details in the order of
    // [IapProductEntry.values].
    final productEntryOrderMap = <String, int>{};

    // A map to match product details with product entries.
    final productEntryMap = <String, IapProductEntry>{};

    for (var i = 0; i < productEntries.length; i++) {
      productEntryOrderMap[productEntries[i].id] = i;
      productEntryMap[productEntries[i].id] = productEntries[i];
    }

    return response.productDetails
        .map((e) => IapProduct(e, productEntryMap[e.id]!))
        .sorted(
          (a, b) => productEntryOrderMap[a.id]! - productEntryOrderMap[b.id]!,
        )
        .toList();
  }

  /// Buy an iap product.
  ///
  /// Until https://github.com/flutter/flutter/issues/96775 is resolved, it is
  /// impossible to implement buying multiple products at once because there is
  /// no way to diffrentiate between purchases that are failed/canceled.
  Future<IapProductPurchaseState> buyProduct(IapProduct product) async {
    if (_purchaseInProgress != null) {
      throw StateError('A purchase is already in progress');
    }

    final purchaseParam = PurchaseParam(productDetails: product.productDetails);

    if (treatGoogleIapNonConsumableAsConsumable) {
      // This part of the code must not be executed in production, it is only
      // for testing purposes.
      //
      // Only non-consumable products are supported by IapService at this time.
      logger.w(
        'Treating Google IAP non-consumable as consumable so we don\'t '
        'have to deal with refunding purchases in testing',
      );

      await iap.buyConsumable(purchaseParam: purchaseParam);
    } else {
      await iap.buyNonConsumable(purchaseParam: purchaseParam);
    }

    _purchaseInProgress = Completer();
    return _purchaseInProgress!.future;
  }

  Future<void> handlePurchase(PurchaseDetails purchaseDetails) async {
    switch (purchaseDetails.status) {
      case PurchaseStatus.pending:
        debugPrint('Pending: ${purchaseDetails.productID}');
        _purchaseInProgress?.completeError(
          'Pending purchases are no longer supported',
          StackTrace.current,
        );

      // await purchasesRepository.savePurchaseOfId(
      //   purchaseDetails.productID,
      //   isPending: true,
      // );
      // _purchaseInProgress?.complete(IapProductPurchaseState.pending);

      case PurchaseStatus.error || PurchaseStatus.canceled:
        debugPrint('Error: ${purchaseDetails.error}');
        _purchaseInProgress?.completeError(
          purchaseDetails.error!,
          StackTrace.current,
        );

      case PurchaseStatus.purchased || PurchaseStatus.restored:
        debugPrint('Purchased: ${purchaseDetails.productID}');
        await purchasesRepository.savePurchaseOfId(
          purchaseDetails.productID,
          isPending: false,
        );
        _purchaseInProgress?.complete(IapProductPurchaseState.purchased);
    }

    _purchaseInProgress = null;
    if (purchaseDetails.status != PurchaseStatus.pending &&
        purchaseDetails.pendingCompletePurchase) {
      await iap.completePurchase(purchaseDetails);
    }
  }
}

@Riverpod(keepAlive: true)
IapService iapService(Ref ref) {
  final iap = ref.watch(iapProvider);
  final purchasesRepository = ref.watch(purchasesRepositoryProvider);
  final logger = ref.watch(loggerProvider);
  final treatGoogleIapNonConsumableAsConsumable = ref.watch(
    envProvider.select(
      (value) => value.treatGoogleIapNonConsumableAsConsumable,
    ),
  );

  final iapService = IapService(
    iap: iap,
    purchasesRepository: purchasesRepository,
    logger: logger,
    treatGoogleIapNonConsumableAsConsumable:
        treatGoogleIapNonConsumableAsConsumable,
  );

  ref.listen(
    purchaseDetailsListStreamProvider,
    (_, next) => next.whenData((purchaseDetails) {
      if (purchaseDetails.length > 1) {
        throw UnsupportedError(
          'Multiple purchase detail events at once are not supported',
        );
      }

      iapService.handlePurchase(purchaseDetails.first);
    }),
  );

  return iapService;
}

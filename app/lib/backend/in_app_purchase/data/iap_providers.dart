import 'package:driving_license/backend/in_app_purchase/data/purchases_repository.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';
import 'package:driving_license/backend/in_app_purchase/iap_service.dart';
import 'package:driving_license/features/donate/domain/donate_product_entry.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'iap_providers.g.dart';

@Riverpod(keepAlive: true)
InAppPurchase iap(Ref ref) {
  return InAppPurchase.instance;
}

@Riverpod(keepAlive: true)
Stream<List<PurchaseDetails>> purchaseDetailsListStream(Ref ref) {
  final iap = ref.watch(iapProvider);
  return iap.purchaseStream;
}

@riverpod
FutureOr<bool> isIapAvailable(Ref ref) {
  final iap = ref.watch(iapProvider);
  return iap.isAvailable();
}

@riverpod
FutureOr<List<IapProduct>> iapProductsListFuture(
  Ref ref,
  List<IapProductEntry> iapProductEntries,
) async {
  final iapService = ref.watch(iapServiceProvider);
  return iapService.loadPurchases(iapProductEntries);
}

@riverpod
FutureOr<List<IapProduct>> mockIapProductsListFuture(Ref ref) async {
  return [
    for (final entry in DonateProductEntry.values)
      IapProduct(
        ProductDetails(
          id: entry.id,
          title: entry.name,
          description: 'Mock description ${entry.name}',
          currencyCode: 'USD',
          rawPrice: 0.99,
          price: '0.99',
        ),
        entry,
      ),
  ];
}

// @riverpod
// Stream<bool> isAnyPurchasePendingStream(IsAnyPurchasePendingStreamRef ref) {
//   final purchasesRepository = ref.watch(purchasesRepositoryProvider);
//   return purchasesRepository.watchIsAnyPending();
// }

@riverpod
Stream<bool> isAnyPurchaseCompletedStream(Ref ref) {
  final purchasesRepository = ref.watch(purchasesRepositoryProvider);
  return purchasesRepository.watchIsAnyPurchased();
}

import 'package:driving_license/backend/database/sembast_provider.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';
import 'package:driving_license/backend/in_app_purchase/domain/iap_product_purchase.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast.dart';

part 'purchases_repository.g.dart';

/// Repository to save user purchase history.
class SembastPurchasesRepository {
  SembastPurchasesRepository(this.db);

  final Database db;
  final purchasesStore = stringMapStoreFactory.store('purchases');

  Future<void> savePurchaseOfId(String productId, {bool isPending = true}) {
    final purchase = IapProductPurchase(
      id: productId,
      state: isPending
          ? IapProductPurchaseState.pending
          : IapProductPurchaseState.purchased,
    );

    return purchasesStore.record(purchase.id).put(db, purchase.toJson());
  }

  Future<void> removePurchaseOf(IapProduct product) {
    return purchasesStore.record(product.id).delete(db);
  }

  Stream<bool> watchIsAnyPending() {
    final recordCountStream = purchasesStore
        .query(finder: Finder(filter: Filter.equals('state', 'pending')))
        .onCount(db);

    return recordCountStream.map((snapshot) => snapshot > 0);
  }

  Stream<bool> watchIsAnyPurchased() {
    final recordCountStream = purchasesStore
        .query(finder: Finder(filter: Filter.equals('state', 'purchased')))
        .onCount(db);

    return recordCountStream.map((snapshot) => snapshot > 0);
  }
}

extension SembastPurchasesRepositoryDebugX on SembastPurchasesRepository {
  void printAllPurchases() async {
    final allPurchases = await purchasesStore.find(db);
    if (allPurchases.isEmpty) {
      debugPrint('No purchases found');
      return;
    }

    for (final purchase in allPurchases) {
      debugPrint('Purchase: ${purchase.key} - ${purchase.value}');
    }
  }

  Future<void> clearAllPurchases() {
    debugPrint('Clearing all purchases...');
    return purchasesStore.delete(db);
  }
}

@Riverpod(keepAlive: true)
SembastPurchasesRepository purchasesRepository(Ref ref) {
  final db = ref.watch(sembastProvider).requireValue;
  return SembastPurchasesRepository(db);
}

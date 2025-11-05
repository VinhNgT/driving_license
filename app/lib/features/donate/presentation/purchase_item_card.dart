import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';
import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/donate/domain/donate_product_entry.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PurchaseItemCard extends HookConsumerWidget {
  const PurchaseItemCard({
    super.key,
    required this.product,
    required this.purchaseProductCallback,
  });

  final IapProduct<DonateProductEntry> product;
  final VoidCallback? purchaseProductCallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ButtonCard(
      surfaceColor: context.materialScheme.surfaceContainerHigh,
      onSurfaceColor: context.materialScheme.onSurface,
      borderRadius: kSize_16,
      onPressed: purchaseProductCallback,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_20,
          vertical: kSize_16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.price,
                  style: context.textTheme.titleLarge,
                ),
                kGap_4,
                Text(
                  _getProductMessage(product.entry),
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.materialScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
            Image.asset(
              product.entry.iconPath,
              height: kSize_64,
            ),
          ],
        ),
      ),
    );
  }

  String _getProductMessage(DonateProductEntry entry) => switch (entry) {
        DonateProductEntry.unlockFullAccess10k => 'Đóng góp nhỏ',
        DonateProductEntry.unlockFullAccess20k => 'Đóng góp vừa',
        DonateProductEntry.unlockFullAccess50k => 'Đóng góp kha khá',
        DonateProductEntry.unlockFullAccess100k => 'Đóng góp lớn',
        DonateProductEntry.unlockFullAccess200k => 'Đóng góp rất lớn',
        DonateProductEntry.unlockFullAccess500k => '??? 😱',
      };
}

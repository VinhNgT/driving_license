import 'package:driving_license/backend/in_app_purchase/domain/iap_product.dart';

enum DonateProductEntry implements IapProductEntry {
  unlockFullAccess10k(
    id: 'unlock_full_access_10k',
    iconPath: 'assets/icons/donation/coin.png',
  ),
  unlockFullAccess20k(
    id: 'unlock_full_access_20k',
    iconPath: 'assets/icons/donation/coin_bag.png',
  ),
  unlockFullAccess50k(
    id: 'unlock_full_access_50k',
    iconPath: 'assets/icons/donation/banknotes_coins.png',
  ),
  unlockFullAccess100k(
    id: 'unlock_full_access_100k',
    iconPath: 'assets/icons/donation/banknotes.png',
  ),
  unlockFullAccess200k(
    id: 'unlock_full_access_200k',
    iconPath: 'assets/icons/donation/diamond_gold.png',
  ),
  unlockFullAccess500k(
    id: 'unlock_full_access_500k',
    iconPath: 'assets/icons/donation/diamond_blue.png',
  );

  const DonateProductEntry({required this.id, required this.iconPath});

  @override
  final String id;
  final String iconPath;
}

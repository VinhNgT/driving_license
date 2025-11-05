import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'admob_provider.g.dart';

@Riverpod(keepAlive: true)
MobileAds adMob(Ref ref) {
  final mobileAds = MobileAds.instance;
  mobileAds.initialize();
  return mobileAds;
}

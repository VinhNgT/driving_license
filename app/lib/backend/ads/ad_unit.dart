import 'package:google_mobile_ads/google_mobile_ads.dart';

enum AdUnit {
  homeBanner(
    // id: 'ca-app-pub-8207177478479841/2899096006',
    id: 'ca-app-pub-3940256099942544/9214589741', // Test
    type: BannerAd,
  ),
  createNewExam(
    id: 'ca-app-pub-8207177478479841/5336104383',
    type: RewardedAd,
  );

  const AdUnit({
    required this.id,
    required this.type,
  });
  final String id;
  final Type type;
}

enum AndroidTestAdUnit {
  openApp(
    id: 'ca-app-pub-3940256099942544/9257395921',
    type: AppOpenAd,
  ),
  adaptiveBanner(
    id: 'ca-app-pub-3940256099942544/9214589741',
    type: BannerAd,
  ),
  fixedSizeBanner(
    id: 'ca-app-pub-3940256099942544/6300978111',
    type: BannerAd,
  ),
  interstitial(
    id: 'ca-app-pub-3940256099942544/1033173712',
    type: InterstitialAd,
  ),
  interstitialVideo(
    id: 'ca-app-pub-3940256099942544/8691691433',
    type: InterstitialAd,
  ),
  rewarded(
    id: 'ca-app-pub-3940256099942544/5224354917',
    type: RewardedAd,
  ),
  rewardedInterstitial(
    id: 'ca-app-pub-3940256099942544/5354046379',
    type: RewardedInterstitialAd,
  ),
  nativeAdvanced(
    id: 'ca-app-pub-3940256099942544/2247696110',
    type: NativeAd,
  ),
  nativeAdvancedVideo(
    id: 'ca-app-pub-3940256099942544/1044960115',
    type: NativeAd,
  );

  const AndroidTestAdUnit({
    required this.id,
    required this.type,
  });
  final String id;
  final Type type;
}

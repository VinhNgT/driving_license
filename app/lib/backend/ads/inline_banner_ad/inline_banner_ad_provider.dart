import 'dart:async';

import 'package:driving_license/backend/ads/ad_status_logger.dart';
import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:driving_license/logging/logger_providers.dart';
import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'inline_banner_ad_provider.g.dart';

@Riverpod(keepAlive: true)
class InlineBannerAdStream extends _$InlineBannerAdStream with AdStatusLogger {
  Logger get _logger => ref.read(loggerProvider);

  @override
  Stream<PlatformBannerAd> build(AdUnit adUnit, InLineBannerAdConfig? config) {
    listenSelf((previous, next) {
      log(_logger, adUnit, previous, next);
    });

    return _getAd();
  }

  Stream<PlatformBannerAd> _getAd() {
    final controller = StreamController<PlatformBannerAd>.broadcast();
    final requestAdSize = config?.bannerAdSize ?? AdSize.banner;

    final bannerAd = BannerAd(
      adUnitId: adUnit.id,
      request: const AdRequest(),
      size: requestAdSize,
      listener: BannerAdListener(
        onAdLoaded: (ad) async {
          final BannerAd bannerAd = ad as BannerAd;
          final AdSize? platformAdSize = await bannerAd.getPlatformAdSize();

          if (platformAdSize == null) {
            controller.addError(
              StateError('Failed to get ad size'),
              StackTrace.current,
            );
            return;
          }

          controller.add(
            PlatformBannerAd(
              bannerAd: bannerAd,
              platformAdSize: platformAdSize,
            ),
          );
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          controller.addError(err, StackTrace.current);
        },
      ),
    );

    controller.onListen = bannerAd.load;
    controller.onCancel = bannerAd.dispose;

    return controller.stream;
  }
}

class InLineBannerAdConfig extends Equatable {
  InLineBannerAdConfig({required this.width, this.maxHeight}) {
    assert(width > 0);
    assert(maxHeight == null || maxHeight! > 0);
  }

  final double width;
  final double? maxHeight;

  AdSize get bannerAdSize => maxHeight == null
      ? AdSize.getCurrentOrientationInlineAdaptiveBannerAdSize(width.truncate())
      : AdSize.getInlineAdaptiveBannerAdSize(
          width.truncate(),
          maxHeight!.truncate(),
        );

  @override
  List<Object?> get props => [width, maxHeight];
}

class PlatformBannerAd extends Equatable {
  const PlatformBannerAd({
    required this.bannerAd,
    required this.platformAdSize,
  });

  final BannerAd bannerAd;
  final AdSize platformAdSize;

  @override
  List<Object?> get props => [bannerAd, platformAdSize];
}

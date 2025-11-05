import 'package:auto_route/auto_route.dart';
import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:driving_license/backend/ads/rewarded_ad/rewarded_ad_provider.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/exceptions/app_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class RewardedAdScreen extends HookConsumerWidget {
  const RewardedAdScreen({super.key, required this.adUnit});
  final AdUnit adUnit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ad = ref.watch(rewardedAdFutureProvider(adUnit));
    final rewardedEarned = useRef(false);

    return Scaffold(
      appBar: const CommonAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ad.when(
              skipLoadingOnRefresh: false,
              data: (adValue) => Builder(
                builder: (_) {
                  adValue.show(
                    onUserEarnedReward: (ad, reward) {
                      rewardedEarned.value = true;
                    },
                  );

                  adValue.fullScreenContentCallback = adValue
                      .fullScreenContentCallback
                      ?.combine(
                        FullScreenContentCallback(
                          onAdDismissedFullScreenContent: (ad) {
                            context.maybePop<bool>(rewardedEarned.value);
                          },
                        ),
                      );

                  return const SizedBox.shrink();
                },
              ),
              error: (e, _) {
                final errorMessage = switch (e) {
                  LoadAdError(:final message) => message,
                  _ => e.toString(),
                };

                return AppErrorWidget(
                  errorMessage: errorMessage,
                  userFriendlyErrorMessage:
                      'Hiển thị quảng cáo thất bại, vui lòng thử lại sau',
                );
              },
              loading: () => const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  kGap_16,
                  Text('Đang tải quảng cáo'),
                ],
              ),
            ),
            const Gap(kAppBarHeight),
          ],
        ),
      ),
    );
  }
}

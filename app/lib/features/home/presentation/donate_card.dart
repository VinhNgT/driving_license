import 'package:auto_route/auto_route.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vector_graphics/vector_graphics.dart';

class DonateCard extends StatelessWidget {
  const DonateCard({super.key, required this.isUserDonated});
  final bool isUserDonated;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.materialScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.only(
          left: kSize_20,
          right: kSize_20,
          top: kSize_12,
          bottom: kSize_16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const SvgPicture(
                  AssetBytesLoader(
                    'assets/icons/home_screen/_compiled/heart.svg.vec',
                  ),
                ),
                kGap_16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isUserDonated ? 'Cảm ơn bạn đã đóng góp' : 'Đóng góp',
                        style: context.textTheme.titleMedium,
                      ),
                      kGap_2,
                      Text(
                        isUserDonated
                            ? 'Toàn bộ quảng cáo đã được loại bỏ'
                            : 'Ủng hộ nhà phát triển phần mềm',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (!isUserDonated) ...[
              kGap_16,
              SizedBox(
                width: double.infinity,
                child: FilledButton.tonal(
                  onPressed: () => context.navigateTo(const DonateRoute()),
                  child: const Text('Mở khoá tất cả tính năng'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class DonateCardReview extends StatelessWidget {
  const DonateCardReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.materialScheme.surfaceContainer,
      child: Padding(
        padding: const EdgeInsets.only(
          left: kSize_20,
          right: kSize_20,
          top: kSize_12,
          bottom: kSize_16,
        ),
        child: Column(
          children: [
            Row(
              children: [
                const SvgPicture(
                  AssetBytesLoader(
                    'assets/icons/home_screen/_compiled/heart.svg.vec',
                  ),
                ),
                kGap_16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cảm ơn bạn đã sử dụng ứng dụng',
                        style: context.textTheme.titleMedium,
                      ),
                      kGap_2,
                      Text(
                        'Hãy dành thời gian đánh giá 5 sao trên Cửa hàng Play '
                        'để ủng hộ nhà phát triển!',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // kGap_16,
            // SizedBox(
            //   width: double.infinity,
            //   child: FilledButton.tonal(
            //     onPressed: () {},
            //     child: const Text('Mở khoá tất cả tính năng'),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

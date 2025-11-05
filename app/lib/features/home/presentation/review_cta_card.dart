import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/home/presentation/review_cta_card_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:material_symbols_icons/symbols.dart';

class ReviewCtaCard extends HookConsumerWidget {
  const ReviewCtaCard({super.key, this.onDismissPressed});

  final VoidCallback? onDismissPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                const Icon(
                  Symbols.star,
                  size: 36,
                  color: Color(0xFFFDD835),
                  fill: 1,
                ),
                kGap_16,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bạn hài lòng với trải nghiệm?',
                        style: context.textTheme.titleMedium,
                      ),
                      kGap_2,
                      Text(
                        'Hãy dành chút thời gian đánh giá ứng dụng nhé!',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: context.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            kGap_16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: onDismissPressed,
                  child: const Text('Bỏ qua'),
                ),
                FilledButton.tonal(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      context.materialScheme.tertiaryContainer,
                    ),
                    foregroundColor: WidgetStateProperty.all(
                      context.materialScheme.onTertiaryContainer,
                    ),
                  ),
                  onPressed: () async {
                    await InAppReview.instance.openStoreListing();
                    // Wait for Play Store transition animation
                    await Future.delayed(const Duration(milliseconds: 300));
                    ref
                        .read(reviewCtaCardControllerFutureProvider)
                        .hideReviewCtaCard();
                  },
                  child: const Text('Đến cửa hàng Play'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedReviewCtaCard extends HookConsumerWidget {
  const AnimatedReviewCtaCard({
    super.key,
    required this.isShow,
    required this.builder,
    this.onDismissPressed,
    this.animationDuration,
  });

  final bool isShow;
  final Widget Function(Widget card) builder;
  final VoidCallback? onDismissPressed;
  final Duration? animationDuration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedCrossFade(
      crossFadeState: isShow
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: animationDuration ?? Durations.short4,
      sizeCurve: Curves.easeOutCubic,
      firstCurve: Curves.easeOutCubic,
      secondCurve: Curves.easeOutCubic,
      alignment: Alignment.topCenter,
      firstChild: builder(ReviewCtaCard(onDismissPressed: onDismissPressed)),
      secondChild: Container(width: double.infinity),
    );
  }
}

class AsyncAnimatedReviewCtaCard extends HookConsumerWidget {
  const AsyncAnimatedReviewCtaCard({
    super.key,
    required this.builder,
    this.animationDuration,
  });

  final Widget Function(Widget card) builder;
  final Duration? animationDuration;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showReviewCtaCard = ref.watch(shouldShowReviewCtaCardFutureProvider);

    return switch (showReviewCtaCard) {
      AsyncValue(value: final showCard) when showCard != null =>
        AnimatedReviewCtaCard(
          isShow: showCard,
          animationDuration: animationDuration,
          onDismissPressed: () {
            ref.read(reviewCtaCardControllerFutureProvider).hideReviewCtaCard();
          },
          builder: builder,
        ),
      _ => const SizedBox.shrink(),
    };
  }
}

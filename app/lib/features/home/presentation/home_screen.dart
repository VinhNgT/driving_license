import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:driving_license/backend/ads/admob_provider.dart';
import 'package:driving_license/backend/ads/inline_banner_ad/inline_banner_ad_builder.dart';
import 'package:driving_license/backend/app_config/app_config.dart';
import 'package:driving_license/common_widgets/async_value/async_value_scaffold.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/common_widgets/notify_scroll_size_changes.dart';
import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/chapters/application/providers/chapters_providers.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/donate/presentation/donate_screen_controller.dart';
import 'package:driving_license/features/home/presentation/chapter_card.dart';
import 'package:driving_license/features/home/presentation/dialogs/bookmarks_empty_dialog.dart';
import 'package:driving_license/features/home/presentation/dialogs/clear_chapter_completion_dialog.dart';
import 'package:driving_license/features/home/presentation/dialogs/no_wrong_answers_dialog.dart';
import 'package:driving_license/features/home/presentation/donate_card.dart';
import 'package:driving_license/features/home/presentation/feature_card.dart';
import 'package:driving_license/features/home/presentation/review_cta_card.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/user_progress/application/providers/user_progress_providers.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/list_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final licenseName = ref.watch(userSelectedLicenseProvider);
    final scrollController = useScrollController();
    final isUserDonated = ref.watch(isUserDonatedProvider);

    final isDonationCardDisabledByAppConfig = ref.watch(
      appConfigProvider.select(
        (value) => value.requireValue.disableDonationCard,
      ),
    );

    final isAdHiddenByAppConfig = ref.watch(
      appConfigProvider.select((value) => value.requireValue.unlockAllFeatures),
    );

    return AsyncValueScaffold(
      value: licenseName,
      builder: (licenseNameValue) => Scaffold(
        appBar: CommonAppBar(
          leading: IconButton(
            icon: const Icon(Symbols.rule_settings),
            onPressed: () {
              context.navigateTo(LicenseSelectionRoute());
            },
          ),
          title: GestureDetector(
            onLongPress: () => ref.read(adMobProvider).openAdInspector((_) {}),
            child: Text(_getLicenseName(licenseNameValue)),
          ),
          actions: [
            TextButton(
              child: const Text('Báo lỗi'),
              onPressed: () {
                context.navigateTo(const SendFeedbackRoute());
              },
            ),
          ],
          rightPadding: AppBarRightPadding.normalButton,
          scaffoldBodyScrollController: scrollController,
        ),
        body: WidgetDeadzone(
          deadzone: EdgeInsets.only(bottom: context.systemGestureInsets.bottom),
          child: NotifyScrollSizeChanges(
            scrollController: scrollController,
            child: SingleChildScrollView(
              controller: scrollController,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: kSize_16,
                    right: kSize_16,
                    top: kSize_4,
                    bottom: kSize_24,
                  ),
                  child: AsyncValueWidget(
                    value: isUserDonated,
                    builder: (isUserDonatedValue) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        !isDonationCardDisabledByAppConfig
                            ? DonateCard(isUserDonated: isUserDonatedValue)
                            : const DonateCardReview(),
                        kGap_20,
                        const FeatureSelection(),
                        AsyncAnimatedReviewCtaCard(
                          builder: (card) => Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [kGap_32, card],
                          ),
                        ),
                        kGap_32,
                        const ChapterSelection(),
                        if (!isUserDonatedValue && !isAdHiddenByAppConfig)
                          InlineBannerAdBuilder(
                            adUnit: AdUnit.homeBanner,
                            builder: (adWidget) {
                              return Column(
                                children: [
                                  kGap_24,
                                  Center(child: adWidget),
                                ],
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getLicenseName(License license) {
    final StringBuffer buffer = StringBuffer(
      'Giấy phép lái xe'
      ' ',
    );
    final licenseCode = license.name.toUpperCase();
    buffer.write(licenseCode);
    return buffer.toString();
  }
}

class FeatureSelection extends HookConsumerWidget {
  const FeatureSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutGrid(
      columnSizes: [1.fr, 1.fr],
      rowSizes: const [auto, auto],
      rowGap: kSize_12,
      // This weird looking columnGap value is for fixing a random LayoutGrid
      // bug happens during app launches while screen is off
      columnGap: context.width > kSize_12 ? kSize_12 : 0,
      children: [
        SizedBox.expand(
          child: FeatureCard(
            title: 'Thi thử',
            subhead: 'Bộ đề được tạo ra ngẫu nhiên',
            onPressed: () async {
              await context.navigateTo(const ExamsListRoute());
            },
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Các câu khó',
            subhead: 'Các câu hỏi dễ bị nhầm lẫn',
            onPressed: () async {
              ref.read(currentQuestionsServiceModeProvider.notifier).mode =
                  const DifficultOperatingMode();

              await context.navigateTo(QuestionRoute());
            },
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Đã lưu',
            subhead: 'Những câu hỏi được đánh dấu lưu',
            onPressed: () async {
              ref.read(currentQuestionsServiceModeProvider.notifier).mode =
                  const BookmarkOperatingMode();

              final questionCount = await ref.read(
                questionCountFutureProvider.future,
              );

              if (context.mounted) {
                if (questionCount == 0) {
                  await showDialog(
                    context: context,
                    builder: (context) => const BookmarksEmptyDialog(),
                  );
                  return;
                }

                await context.navigateTo(QuestionRoute());
              }
            },
          ),
        ),
        SizedBox.expand(
          child: FeatureCard(
            title: 'Đã làm sai',
            subhead: 'Những câu hỏi bạn đã làm sai',
            onPressed: () async {
              ref.read(currentQuestionsServiceModeProvider.notifier).mode =
                  const WrongAnswersOperatingMode();

              final questionCount = await ref.read(
                questionCountFutureProvider.future,
              );

              if (context.mounted) {
                if (questionCount == 0) {
                  await showDialog(
                    context: context,
                    builder: (context) => const NoWrongAnswersDialog(),
                  );
                  return;
                }

                await context.navigateTo(QuestionRoute());
              }
            },
          ),
        ),
      ],
    );
  }
}

class ChapterSelection extends HookConsumerWidget {
  const ChapterSelection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notEmptyChapters = ref.watch(notEmptyChaptersProvider);

    return AsyncValueWidget(
      value: notEmptyChapters,
      builder: (chaptersHasQuestionValue) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ôn tập chương', style: context.textTheme.titleLarge),
          kGap_16,
          Consumer(
            builder: (context, ref, child) {
              final dangerCompletionStatus = ref.watch(
                completionStatusProvider(filterDangerQuestions: true),
              );

              return AsyncValueWidget(
                value: dangerCompletionStatus,
                builder: (dangerCompletionStatusValue) => ChapterCard(
                  iconAssetPath:
                      'assets/icons/home_screen/_compiled/danger_fire.svg.vec',
                  chapterName: 'Các câu hỏi điểm liệt',
                  completionStatus: dangerCompletionStatusValue,
                  onPressed: () async {
                    await _setupAndNavigateToDanger(ref);
                  },
                ),
              );
            },
          ),
          kGap_12,
          ...<Widget>[
            for (final chapter in chaptersHasQuestionValue)
              Consumer(
                builder: (context, ref, child) {
                  final chapterCompletionStatus = ref.watch(
                    completionStatusProvider(chapter: chapter),
                  );

                  return AsyncValueWidget(
                    value: chapterCompletionStatus,
                    builder: (completionStatusValue) => ChapterCard(
                      iconAssetPath: chapter.iconAssetPath,
                      chapterName: chapter.chapterName,
                      completionStatus: completionStatusValue,
                      onPressed: () async {
                        await _setupAndNavigateToChapter(ref, chapter);
                      },
                    ),
                  );
                },
              ),
          ].separated(kGap_12),
          kGap_4,
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              child: Text(
                'Xoá tiến độ hoàn thành',
                style: TextStyle(color: context.materialScheme.error),
              ),
              onPressed: () async => _clearChaptersCompletion(context, ref),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _clearChaptersCompletion(
    BuildContext context,
    WidgetRef ref,
  ) async {
    unawaited(
      showDialog<bool>(
        context: context,
        builder: (context) => const ClearChapterCompletionDialog(),
      ),
    );
  }
}

extension ChapterSelectionX on ChapterSelection {
  Future<void> _setupAndNavigateToDanger(WidgetRef ref) async {
    final context = ref.context;
    ref.read(currentQuestionsServiceModeProvider.notifier).mode =
        const DangerOperatingMode();

    final chapterFirstUnansweredQuestionIndex = await ref.read(
      firstUnansweredQuestionIndexProvider(filterDangerQuestions: true).future,
    );

    if (context.mounted) {
      unawaited(
        context.navigateTo(
          QuestionRoute(
            initialPageIndex: chapterFirstUnansweredQuestionIndex ?? 0,
          ),
        ),
      );
    }
  }

  Future<void> _setupAndNavigateToChapter(
    WidgetRef ref,
    Chapter chapter,
  ) async {
    final context = ref.context;
    ref.read(currentQuestionsServiceModeProvider.notifier).mode =
        ChapterOperatingMode(chapter);

    final chapterFirstUnansweredQuestionIndex = await ref.read(
      firstUnansweredQuestionIndexProvider(chapter: chapter).future,
    );

    if (context.mounted) {
      unawaited(
        context.navigateTo(
          QuestionRoute(
            initialPageIndex: chapterFirstUnansweredQuestionIndex ?? 0,
          ),
        ),
      );
    }
  }
}

class HomeRouteGuard extends AutoRouteGuard {
  /// Only allow user to access HomeRoute if they have selected a license
  HomeRouteGuard(this.ref);
  Ref ref;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final userSelectedLicense = await ref.read(
      userSelectedLicenseProvider.future,
    );

    if (userSelectedLicense != License.all) {
      resolver.next(true);
      return;
    }

    await resolver.redirectUntil(
      LicenseSelectionRoute(
        afterLicenseSelected: () => resolver.next(true),
        navigateToHomeAfterLicenseSelected: false,
      ),
    );
  }
}

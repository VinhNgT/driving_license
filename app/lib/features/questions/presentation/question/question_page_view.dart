import 'package:driving_license/common_widgets/misc/fast_scroll_physics.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/features/questions/presentation/question/question_page.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QuestionPageView extends HookConsumerWidget {
  const QuestionPageView({
    super.key,
    required this.questionCount,
    required this.pageController,
  });

  final int questionCount;
  final PageController pageController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExamMode = ref.watch(
      currentQuestionsServiceModeProvider
          .select((value) => value is ExamOperatingMode),
    );

    return PageView.builder(
      controller: pageController,
      itemCount: questionCount,
      onPageChanged: (nextPageIndex) {
        setNewCurrentPageIndex(ref, nextPageIndex);
      },
      physics: const FastPageViewScrollPhysics(),
      itemBuilder: (context, index) {
        return QuestionPage(
          questionPageIndex: index,
          showRightWrong: !isExamMode,
          showNotes: !isExamMode,
          padding: const EdgeInsets.only(
            left: kSize_16,
            right: kSize_16,
            bottom: kSize_48,
          ),
        );
      },
    );
  }

  void setNewCurrentPageIndex(WidgetRef ref, int newPageIndex) {
    ref.read(currentPageIndexProvider.notifier).value = newPageIndex;
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/misc/ink_well_overlay_color.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/constants/opacity.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_exam_providers.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:driving_license/features/questions/presentation/appbar_navbar/dialogs/confirm_submit_exam_dialog.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class QuestionBottomNavigationBar extends HookConsumerWidget {
  const QuestionBottomNavigationBar({
    super.key,
    required this.questionCount,
    this.onPreviousPressed,
    this.onNextPressed,
    this.onShowAllPressed,
  });

  factory QuestionBottomNavigationBar.createBasedOnExamMode({
    bool isExamMode = false,
    required questionCount,
    VoidCallback? onPreviousPressed,
    VoidCallback? onNextPressed,
    VoidCallback? onShowAllPressed,
  }) {
    if (isExamMode) {
      return ExamBottomNavigationBar(
        questionCount: questionCount,
        onPreviousPressed: onPreviousPressed,
        onNextPressed: onNextPressed,
        onShowAllPressed: onShowAllPressed,
      );
    }

    return QuestionBottomNavigationBar(
      questionCount: questionCount,
      onPreviousPressed: onPreviousPressed,
      onNextPressed: onNextPressed,
      onShowAllPressed: onShowAllPressed,
    );
  }
  final int questionCount;
  final VoidCallback? onPreviousPressed;
  final VoidCallback? onNextPressed;
  final VoidCallback? onShowAllPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final previousButtonActive = ref.watch(
      currentPageIndexProvider
          .select((currentPageIndex) => currentPageIndex > 0),
    );
    final nextButtonActive = ref.watch(
      currentPageIndexProvider
          .select((currentPageIndex) => currentPageIndex < questionCount - 1),
    );

    return BottomAppBar(
      height: kBottomAppBarHeight,
      padding: const EdgeInsets.all(kSize_0),
      child: Row(
        children: [
          Flexible(
            flex: 2,
            child: _PreviousQuestion(
              onPressed: previousButtonActive ? onPreviousPressed : null,
            ),
          ),
          Flexible(
            flex: 3,
            child: _ShowAllQuestion(
              onPressed: onShowAllPressed,
            ),
          ),
          Flexible(
            flex: 2,
            child: _NextQuestion(
              onPressed: nextButtonActive ? onNextPressed : null,
            ),
          ),
        ],
      ),
    );
  }
}

class ExamBottomNavigationBar extends QuestionBottomNavigationBar {
  const ExamBottomNavigationBar({
    super.key,
    required super.questionCount,
    super.onPreviousPressed,
    super.onNextPressed,
    super.onShowAllPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentExam = ref.watch(currentExamProvider);

    return AsyncValueWidget(
      value: currentExam,
      builder: (currentExamValue) => Container(
        color: context.theme.bottomAppBarTheme.color,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: kSize_16,
                right: kSize_4,
              ),
              height: kBottomAppBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _ExamTimer(
                    duration: currentExamValue.examDuration,
                    onTimeout: () async {
                      await _submitExam(context, ref, showConfimation: false);
                    },
                  ),
                  TextButton(
                    onPressed: () async {
                      await _submitExam(context, ref, showConfimation: true);
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.only(
                        left: kSize_16,
                        right: kSize_12,
                      ),
                      textStyle: context.textTheme.titleMedium,
                    ),
                    child: const Row(
                      children: [
                        Text('Nộp bài'),
                        kGap_8,
                        Icon(
                          Symbols.upload_file,
                          size: kSize_20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              indent: kSize_16,
              endIndent: kSize_16,
            ),
            super.build(context, ref),
          ],
        ),
      ),
    );
  }

  Future<void> _submitExam(
    BuildContext context,
    WidgetRef ref, {
    bool showConfimation = true,
  }) async {
    final questionsService = await ref.read(questionsServiceProvider.future);
    final examsRepository = ref.read(examsRepositoryProvider);
    final currentExam = await ref.read(currentExamProvider.future);
    final userAnswers = await questionsService.getAnswersByQuestionDbIndexes(
      currentExam.questionDbIndexes,
    );

    if (showConfimation && context.mounted) {
      final isConfirm = await showDialog<bool>(
        context: context,
        builder: (context) => ConfirmSubmitExamDialog(
          remainingQuestionsCount:
              currentExam.questionsCount - userAnswers.length,
        ),
      );

      // The user canceled the exam submission
      if (isConfirm != true) {
        return;
      }
    }

    await examsRepository.saveExamUserAnswers(
      currentExam,
      userAnswers,
    );

    if (context.mounted) {
      await context.navigateTo(const ExamResultRoute());
    }
  }
}

class _ExamTimer extends HookConsumerWidget {
  _ExamTimer({
    required this.duration,
    this.onTimeout,
  });

  final Duration duration;
  final VoidCallback? onTimeout;

  final timerFormat = DateFormat('HH:mm');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final remainingTime = useState(duration);

    useEffect(
      () {
        final timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          remainingTime.value =
              remainingTime.value - const Duration(seconds: 1);

          if (remainingTime.value.inSeconds == 0) {
            timer.cancel();
            onTimeout?.call();
          }
        });

        return timer.cancel;
      },
      const [],
    );

    final String twoDigitMinutes =
        remainingTime.value.inMinutes.toString().padLeft(2, '0');
    final String twoDigitSeconds =
        remainingTime.value.inSeconds.remainder(60).toString().padLeft(2, '0');

    return Text(
      '$twoDigitMinutes:$twoDigitSeconds',
      style: context.textTheme.titleLarge!.copyWith(
        color: context.materialScheme.onSurfaceVariant,
      ),
    );
  }
}

enum _IconPosition { left, right }

class _QuestionNavBarButton extends StatelessWidget {
  const _QuestionNavBarButton({
    this.icon,
    required this.label,
    this.iconPosition = _IconPosition.left,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.onPressed,
  });

  final Icon? icon;
  final Widget label;
  final _IconPosition iconPosition;
  final MainAxisAlignment mainAxisAlignment;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    var content = [
      if (icon != null) ...[icon!, kGap_8],
      label,
    ];

    if (iconPosition == _IconPosition.right) {
      content = content.reversed.toList();
    }

    return InkWell(
      overlayColor: InkWellBackgroundColor(context.materialScheme.onSurface),
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(
          left: (iconPosition == _IconPosition.left && icon != null)
              ? kSize_12
              : kSize_16,
          right: (iconPosition == _IconPosition.right && icon != null)
              ? kSize_12
              : kSize_16,
          top: kSize_10,
          bottom: kSize_10,
        ),
        child: Opacity(
          // Lower the opacity when button is disabled (when onPressed == null)
          opacity: onPressed != null ? kOpacityFull : kOpacityDisabled,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: content,
          ),
        ),
      ),
    );
  }
}

class _PreviousQuestion extends StatelessWidget {
  const _PreviousQuestion({this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: _QuestionNavBarButton(
        icon: Icon(
          Symbols.arrow_back_ios_new,
          size: kSize_20,
          color: context.materialScheme.onSurface,
        ),
        label: Text('Trước', style: context.textTheme.titleMedium),
        iconPosition: _IconPosition.left,
        mainAxisAlignment: MainAxisAlignment.start,
        onPressed: onPressed,
      ),
    );
  }
}

class _NextQuestion extends StatelessWidget {
  const _NextQuestion({this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: _QuestionNavBarButton(
        icon: Icon(
          Symbols.arrow_forward_ios,
          size: kSize_20,
          color: context.materialScheme.onSurface,
        ),
        label: Text('Sau', style: context.textTheme.titleMedium),
        iconPosition: _IconPosition.right,
        mainAxisAlignment: MainAxisAlignment.end,
        onPressed: onPressed,
      ),
    );
  }
}

class _ShowAllQuestion extends StatelessWidget {
  const _ShowAllQuestion({this.onPressed});
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      child: _QuestionNavBarButton(
        label: Text('Tất cả câu hỏi', style: context.textTheme.titleMedium),
        mainAxisAlignment: MainAxisAlignment.center,
        onPressed: onPressed,
      ),
    );
  }
}

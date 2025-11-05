import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/common_widgets/hooks/build_off_stage_overlay.dart';
import 'package:driving_license/common_widgets/hooks/did_change_metric_rebuild.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/exams/domain/exam_result_status.dart';
import 'package:driving_license/features/exams/presentation/exams_list/exam_card_controller.dart';
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/exams_list_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/ref_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class ExamCard extends StatelessWidget {
  const ExamCard({
    super.key,
    required this.exam,
    this.state = ExamsListState.view,
    this.customCompletionStatusText,
    this.onPressed,
  });

  final Exam exam;
  final ExamsListState state;
  final String? customCompletionStatusText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonCard(
      surfaceColor: context.materialScheme.surfaceContainerHigh,
      onSurfaceColor: context.materialScheme.onSurface,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_16,
          vertical: kSize_12,
        ),
        child: LayoutBuilder(
          builder: (context, constraints) => IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: ConstrainedBox(
                    // Holy shit this took a while to figure it out
                    constraints:
                        BoxConstraints(minHeight: constraints.minHeight),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Bằng ${exam.license.name.toUpperCase()}',
                              style: context.textTheme.bodySmall!.copyWith(
                                color: context.colorScheme.onSurfaceVariant,
                              ),
                            ),
                            kGap_4,
                            Text(
                              exam.name,
                              style: context.textTheme.titleMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        kGap_6,
                        Text(
                          _getCompletionStatus(),
                          style: context.textTheme.bodySmall!.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedSwitcher(
                    duration: Durations.short1,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                    child: switch (state) {
                      ExamsListState.view => const SizedBox.shrink(),
                      ExamsListState.edit => const _EditIcon(),
                      ExamsListState.delete => const _DeleteIcon(),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getCompletionStatus() {
    if (customCompletionStatusText != null) {
      return customCompletionStatusText!;
    }

    if (exam.lastAttemptedUtcTime == null) {
      return 'Chưa làm';
    }

    switch (exam.examResult) {
      case ExamResultStatusPassed(:final correctAnswersCount):
        return '$correctAnswersCount điểm - Đỗ';

      case ExamResultStatusFailed(isDanger: true) ||
            ExamResultStatusFailed(isDangerNotAnswered: true):
        return 'Sai câu điểm liệt - Trượt';

      case ExamResultStatusFailed(:final correctAnswersCount):
        return '$correctAnswersCount điểm - Trượt';
    }
  }
}

class _DeleteIcon extends StatelessWidget {
  const _DeleteIcon();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        kGap_12,
        Icon(
          Symbols.delete,
          color: context.materialScheme.error,
        ),
      ],
    );
  }
}

class _EditIcon extends StatelessWidget {
  const _EditIcon();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        kGap_12,
        Icon(
          Symbols.edit,
          color: context.materialScheme.secondary,
        ),
      ],
    );
  }
}

class PrototypeExamCard extends HookConsumerWidget {
  const PrototypeExamCard({super.key, this.shouldUpdateProvider = false});
  final bool shouldUpdateProvider;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (shouldUpdateProvider) {
      ref.keepProviderAlive(examCardPrototypeHeightProvider);
      useDidChangeMetricRebuild();

      WidgetsBinding.instance.addPostFrameCallback((_) {
        final widgetHeight = context.size?.height ?? 0;
        ref.read(examCardPrototypeHeightProvider.notifier).value = widgetHeight;
      });
    }

    return ExamCard(
      exam: Exam.prototype,
      customCompletionStatusText: 'Prototype\nPrototype',
    );
  }

  /// Builds an invisible PrototypeExamCard to calculate the height of
  /// ExamCard for ExamCardPrototypeHeightProvider.
  static void buildOffstageOverlay() {
    useBuildOffstageOverlay(
      const PrototypeExamCard(shouldUpdateProvider: true),
    );
  }
}

import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/exams/presentation/dialogs/delete_confirm_dialog.dart';
import 'package:driving_license/features/exams/presentation/dialogs/rename_dialog.dart';
import 'package:driving_license/features/exams/presentation/exams_list/exam_card.dart';
import 'package:driving_license/features/exams/presentation/exams_list/exam_card_controller.dart';
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/exams_list_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExamsList extends HookConsumerWidget {
  const ExamsList({
    super.key,
    required this.examsList,
    this.onExamCardPressed,
  });

  final List<Exam> examsList;
  final void Function(int index)? onExamCardPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PrototypeExamCard.buildOffstageOverlay();
    final examCardHeight = ref.watch(examCardPrototypeHeightProvider);

    if (examCardHeight == null) {
      return const SizedBox.shrink();
    }

    return Scrollbar(
      child: WidgetDeadzone(
        deadzone: EdgeInsets.only(
          bottom: context.systemGestureInsets.bottom,
        ),
        child: GridView.builder(
          physics: const ClampingScrollPhysics(),
          itemCount: examsList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: examCardHeight,
            crossAxisSpacing: kSize_12,
            mainAxisSpacing: kSize_12,
          ),
          padding: const EdgeInsets.only(
            top: kSize_16,
            left: kSize_16,
            right: kSize_16,
            bottom: kSize_16 + kSize_96,
          ),
          itemBuilder: (context, index) => Consumer(
            builder: (context, ref, child) {
              final state = ref.watch(examsListScreenStateProvider);

              return ExamCard(
                key: ValueKey(examsList[index].examId),
                exam: examsList[index],
                state: state,
                onPressed: () async {
                  switch (state) {
                    case ExamsListState.view:
                      onExamCardPressed?.call(index);

                    case ExamsListState.edit:
                      await _handleRename(
                        context,
                        ref,
                        examsList[index],
                      );

                    case ExamsListState.delete:
                      await _handleDelete(
                        context,
                        ref,
                        examsList[index],
                      );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

extension on ExamsList {
  Future<void> _handleRename(
    BuildContext context,
    WidgetRef ref,
    Exam exam,
  ) async {
    final newName = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => RenameDialog(
        examName: exam.name,
      ),
    );

    if (newName != null && newName != exam.name) {
      ref.read(examsRepositoryProvider).renameExam(exam, newName);
    }
  }

  Future<void> _handleDelete(
    BuildContext context,
    WidgetRef ref,
    Exam exam,
  ) async {
    final shouldDelete = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) => DeleteConfirmDialog(
            examName: exam.name,
          ),
        ) ??
        false;

    if (shouldDelete) {
      ref.read(examsRepositoryProvider).deleteExam(exam);
    }
  }
}

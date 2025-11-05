import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_bottom_sheet.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/presentation/question/question_page.dart';
import 'package:driving_license/features/questions/presentation/question_list/question_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExamQuestionBottomSheet extends CommonBottomSheet {
  ExamQuestionBottomSheet({
    super.key,
    required this.questionPageIndex,
  }) : super(
          title: _Title(questionPageIndex: questionPageIndex),
          child: QuestionPage(
            questionPageIndex: questionPageIndex,
            showNotes: false,
            allowAnswering: false,
            padding: const EdgeInsets.only(
              top: kSize_12,
              bottom: kSize_48,
              left: kSize_16,
              right: kSize_16,
            ),
          ),
        );
  final int questionPageIndex;
}

class _Title extends HookConsumerWidget {
  const _Title({required this.questionPageIndex});
  final int questionPageIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question = ref.watch(questionFutureProvider(questionPageIndex));

    return AsyncValueWidget(
      value: question,
      builder: (questionValue) => QuestionCardTitle(
        questionPageIndex: questionPageIndex,
        question: questionValue,
      ),
    );
  }
}

import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_card.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_card_list_controller.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_card_list_delegate.dart';
import 'package:driving_license/utils/list_extention.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnswerCardList extends HookConsumerWidget {

  const AnswerCardList._({
    required this.question,
    required this.delegate,
    this.allowInteraction = true,
  });

  const AnswerCardList.showRightWrong({
    required Question question,
    bool allowInteraction = true,
  }) : this._(
          question: question,
          delegate: const PracticeModeAnswerCardListDelegate(),
          allowInteraction: allowInteraction,
        );

  const AnswerCardList.showSelected({
    required Question question,
    bool allowInteraction = true,
  }) : this._(
          question: question,
          delegate: const ExamModeAnswerCardListDelegate(),
          allowInteraction: allowInteraction,
        );
  final Question question;
  final AnswerCardListDelegate delegate;
  final bool allowInteraction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controllerState = ref.watch(answerCardListControllerProvider);

    final selectedAnswerIndex =
        ref.watch(userSelectedAnswerIndexProvider(question));

    return AsyncValueWidget(
      value: selectedAnswerIndex,
      builder: (selectedAnswerIndexValue) => Column(
        children: <Widget>[
          for (var answerOptionIndex = 0;
              answerOptionIndex < question.answers.length;
              answerOptionIndex++)
            AnswerCard(
              answer: question.answers[answerOptionIndex],
              state: delegate.evaluateAnswerCardState(
                answerIndex: answerOptionIndex,
                selectedAnswerIndex: selectedAnswerIndexValue,
                correctAnswerIndex: question.correctAnswerIndex,
              ),
              onPressed: controllerState.isLoading || !allowInteraction
                  ? null
                  : () => delegate.onAnswerSelected(
                        question: question,
                        oldAnswerIndex: selectedAnswerIndexValue,
                        newAnswerIndex: answerOptionIndex,
                        saveAnswerDbCallback: (question, newAnswerIndex) async {
                          return ref
                              .read(answerCardListControllerProvider.notifier)
                              .selectAnswer(
                                question,
                                newAnswerIndex,
                              );
                        },
                      ),
            ),
        ].separated(kGap_12),
      ),
    );
  }
}

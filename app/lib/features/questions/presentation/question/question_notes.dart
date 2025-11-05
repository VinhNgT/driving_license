import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/question/explanation_card.dart';
import 'package:driving_license/features/questions/presentation/question/remember_tip_card.dart';
import 'package:flutter/material.dart';

class QuestionNotes extends StatelessWidget {
  const QuestionNotes({super.key, required this.question});
  final Question question;

  @override
  Widget build(BuildContext context) {
    final content = [
      if (question.explanation != null)
        ExplanationCard(content: question.explanation!),
      if (question.rememberTip != null)
        RememberTipCard(content: question.rememberTip!),
    ];

    return Column(
      children: [
        if (content.isNotEmpty) kGap_24,
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (BuildContext context, int index) => kGap_16,
          itemCount: content.length,
          itemBuilder: (BuildContext _, int index) => content[index],
        ),
      ],
    );
  }
}

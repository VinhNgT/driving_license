import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmSubmitExamDialog extends HookConsumerWidget {
  const ConfirmSubmitExamDialog({
    super.key,
    required this.remainingQuestionsCount,
  });
  final int remainingQuestionsCount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Nộp bài thi'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Bạn có chắc chắn muốn nộp bài không?',
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.colorScheme.onSurfaceVariant,
            ),
          ),
          kGap_2,
          _getRemainingQuestionsText(),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Huỷ'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          child: const Text(
            'Nộp bài',
          ),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }

  Text _getRemainingQuestionsText() {
    final context = useContext();

    return switch (remainingQuestionsCount) {
      0 => Text(
          'Bạn đã trả lời tất cả câu hỏi',
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.tertiary,
          ),
        ),
      _ => Text(
          'Còn $remainingQuestionsCount câu hỏi chưa trả lời',
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.error,
          ),
        ),
    };
  }
}

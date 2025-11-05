import 'package:auto_route/auto_route.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';

class NoWrongAnswersDialog extends StatelessWidget {
  const NoWrongAnswersDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Danh sách câu sai trống'),
      content: const Text(
        'Bạn hiện tại không có câu hỏi nào trả lời sai, hãy cố gắng duy trì '
        'danh sách này trống nhé!',
      ),
      actions: [
        TextButton(
          onPressed: () async => context.maybePop(),
          child: const Text('Tôi đã hiểu'),
        ),
      ],
      contentTextStyle: context.textTheme.bodyMedium!.copyWith(
        color: context.colorScheme.onSurfaceVariant,
      ),
    );
  }
}

import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ConfirmExitExamDialog extends HookConsumerWidget {
  const ConfirmExitExamDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text('Xác nhận thoát'),
      content: Text(
        'Bạn có chắc chắn muốn thoát bài làm không?',
        style: context.textTheme.bodyMedium!.copyWith(
          color: context.colorScheme.onSurfaceVariant,
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Huỷ'),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        TextButton(
          style: ButtonStyle(
            foregroundColor: WidgetStateProperty.all<Color>(
              context.colorScheme.error,
            ),
          ),
          child: const Text('Thoát'),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class BookmarksEmptyDialog extends StatelessWidget {
  const BookmarksEmptyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = context.textTheme.bodyMedium!.copyWith(
      color: context.colorScheme.onSurfaceVariant,
    );

    return AlertDialog(
      title: const Text('Danh sách lưu trống'),
      content: RichText(
        textScaler: context.textScaler,
        text: TextSpan(
          style: textStyle,
          children: [
            const TextSpan(
              text: 'Bạn có thể lưu câu hỏi để dễ dàng xem lại bằng cách nhấn '
                  'vào biểu tượng'
                  ' ',
            ),
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Icon(
                Symbols.bookmark,
                size: textStyle.fontSize! * 1.35,
                color: context.materialScheme.onSurfaceVariant,
              ),
            ),
            const TextSpan(
              text: ' ' 'ở góc trên bên phải của màn hình câu hỏi',
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async => context.maybePop(),
          child: const Text('Tôi đã hiểu'),
        ),
      ],
      contentTextStyle: textStyle,
    );
  }
}

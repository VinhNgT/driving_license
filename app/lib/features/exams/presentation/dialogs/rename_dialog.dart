import 'package:driving_license/common_widgets/providers/keyboard_visibility_provider.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RenameDialog extends HookConsumerWidget {
  const RenameDialog({super.key, required this.examName});
  final String examName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController(text: examName);
    final submitted = useState(false);

    return GestureDetector(
      onTap: () => context.removeFocus(),
      child: Stack(
        children: [
          Consumer(
            builder: (context, ref, child) {
              final isKeyboardVisible = ref.watch(keyboardVisibilityProvider);

              return AbsorbPointer(
                absorbing: isKeyboardVisible,
                child: const ModalBarrier(),
              );
            },
          ),
          AlertDialog(
            title: const Text('Đổi tên bộ đề'),
            content: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: 'Nhập tên mới cho bộ đề',
                // Only show error text when the user presses the submit button
                errorText: submitted.value
                    ? _inputValidator(textController.text)
                    : null,
              ),
              onChanged: (value) => submitted.value = false,
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Huỷ'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Xác nhận'),
                onPressed: () {
                  if (textController.text.isEmpty) {
                    submitted.value = true;
                    return;
                  }

                  Navigator.of(context).pop(textController.text.trim());
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  String? _inputValidator(String value) {
    if (value.isEmpty) {
      return 'Tên không được để trống';
    }
    return null;
  }
}

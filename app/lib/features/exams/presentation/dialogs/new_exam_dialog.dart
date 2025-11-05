import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class NewExamDialog extends StatelessWidget {
  const NewExamDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: const Icon(Symbols.post_add),
      title: const Text('Tạo bộ đề mới'),
      content: const Text('''
Bạn sẽ xem một quảng cáo tối đa 60 giây để tạo 1 bộ đề mới, điều này giúp cho nhà phát triển có kinh phí để phát triển và duy trì ứng dụng.

  •  Nếu bạn xoá ứng dụng hoặc dữ liệu ứng dụng thì tất cả bộ đề đã tạo sẽ bị mất.

  •  Nếu bạn đã thực hiện đóng góp thì chức năng này sẽ không còn yêu cầu xem quảng cáo.'''),
      actions: <Widget>[
        TextButton(
          child: const Text('Huỷ'),
          onPressed: () {
            context.maybePop<bool>(false);
          },
        ),
        TextButton(
          child: const Text('Tôi đồng ý'),
          onPressed: () {
            context.maybePop<bool>(true);
          },
        ),
      ],
    );
  }
}

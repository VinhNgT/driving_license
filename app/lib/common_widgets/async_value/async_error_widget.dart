import 'package:driving_license/constants/app_flavor.dart';
import 'package:flutter/material.dart';

/// Reusable error message widget (just a [Text] with a red color).
class AsyncErrorWidget extends StatelessWidget {
  const AsyncErrorWidget(this.errorMessage, {super.key});
  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    if (isAppBuiltWithFlavor(AppFlavor.prod)) {
      return const Center(child: Text('Đã có lỗi xảy ra'));
    }

    return Text(
      errorMessage,
      style:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red),
    );
  }
}

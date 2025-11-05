import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/placeholder_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueScaffold<T> extends StatelessWidget {

  const AsyncValueScaffold({
    super.key,
    required this.value,
    required this.builder,
  });
  final AsyncValue<T> value;
  final Scaffold Function(T) builder;

  @override
  Widget build(BuildContext context) {
    return value.maybeWhen(
      data: builder,
      orElse: () => PlaceholderScaffold(
        content: AsyncValueWidget(value: value),
      ),
    );
  }
}

import 'dart:math';

import 'package:driving_license/common_widgets/async_value/async_error_widget.dart';
import 'package:driving_license/utils/extensions/async_snapshot_ext.dart';
import 'package:flutter/material.dart';

class AsyncSnapshotWidget<T> extends StatelessWidget {
  const AsyncSnapshotWidget({
    super.key,
    required this.snapshot,
    required this.builder,
  });

  final AsyncSnapshot<T> snapshot;
  final Widget Function(T? data)? builder;

  @override
  Widget build(BuildContext context) {
    return snapshot.when(
      data: builder != null ? builder! : (data) => const SizedBox.shrink(),
      error: (error, stackTrace) =>
          Center(child: AsyncErrorWidget(e.toString())),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

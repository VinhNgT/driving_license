import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/extensions/async_snapshot_ext.dart';
import 'package:flutter/material.dart';

class AsyncSnapshotController<T> extends StatelessWidget {
  const AsyncSnapshotController({
    super.key,
    required this.snapshot,
    required this.child,
  });

  final AsyncSnapshot<T> snapshot;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return snapshot.when(
      data: (_) => child,
      error: (_, _) => child,
      loading: () => Stack(
        children: [
          child,
          Container(
            color: context.materialScheme.background,
            child: const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}

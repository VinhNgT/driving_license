import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/widget_sizes.dart';
import 'package:driving_license/features/exams/application/providers/exams_providers.dart';
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/exams_list_screen_controller.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/ref_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class ExamsListScreenAppBar extends HookConsumerWidget
    implements PreferredSizeWidget {
  const ExamsListScreenAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(examsListScreenStateProvider);
    final isExamListEmpty = ref.watchConvertAsyncValue(
      examsListStreamProvider,
      (exams) => exams.isEmpty,
    );

    return AsyncValueWidget(
      value: isExamListEmpty,
      builder: (isExamListEmptyValue) => Container(
        color: context.materialScheme.surfaceContainer,
        child: AnimatedSwitcher(
          duration: Durations.short3,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          child: switch (state) {
            ExamsListState.view =>
              _ViewAppBar(showActionIcons: !isExamListEmptyValue),
            ExamsListState.edit => const _EditAppBar(),
            ExamsListState.delete => const _DeleteAppBar(),
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kAppBarHeight);
}

class _ViewAppBar extends HookConsumerWidget {
  const _ViewAppBar({this.showActionIcons = true});
  final bool showActionIcons;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonAppBar(
      backgroundColor: context.materialScheme.surfaceContainer,
      title: const Text('Bộ đề thi thử'),
      actions: showActionIcons
          ? [
              IconButton(
                icon: const Icon(Symbols.edit),
                onPressed: () {
                  ref.read(examsListScreenStateProvider.notifier).value =
                      ExamsListState.edit;
                },
              ),
              IconButton(
                icon: const Icon(Symbols.delete),
                onPressed: () {
                  ref.read(examsListScreenStateProvider.notifier).value =
                      ExamsListState.delete;
                },
              ),
            ]
          : List.empty(),
    );
  }
}

class _EditAppBar extends HookConsumerWidget {
  const _EditAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonAppBar(
      backgroundColor: context.materialScheme.surfaceContainer,
      title: const Text('Chọn bộ đề để đổi tên'),
      leading: IconButton(
        icon: const Icon(Symbols.close),
        onPressed: () {
          ref.read(examsListScreenStateProvider.notifier).value =
              ExamsListState.view;
        },
      ),
    );
  }
}

class _DeleteAppBar extends HookConsumerWidget {
  const _DeleteAppBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CommonAppBar(
      backgroundColor: context.materialScheme.surfaceContainer,
      title: const Text('Chọn bộ đề để xoá'),
      leading: IconButton(
        icon: const Icon(Symbols.close),
        onPressed: () {
          ref.read(examsListScreenStateProvider.notifier).value =
              ExamsListState.view;
        },
      ),
    );
  }
}

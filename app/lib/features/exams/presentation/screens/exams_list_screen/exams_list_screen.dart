import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/async_value/async_value_scaffold.dart';
import 'package:driving_license/features/exams/application/providers/exams_providers.dart';
import 'package:driving_license/features/exams/presentation/exams_list/exams_list.dart';
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/create_exam_floating_button.dart';
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/empty_exams_list.dart';
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/exams_list_screen_appbar.dart';
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/exams_list_screen_controller.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ExamsListScreen extends HookConsumerWidget {
  const ExamsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(examsListScreenStateProvider);
    final examsList = ref.watch(examsListStreamProvider);

    ref.listen(examsListStreamProvider, (_, examsList) {
      examsList.whenData((exams) {
        if (exams.isEmpty) {
          ref.read(examsListScreenStateProvider.notifier).value =
              ExamsListState.view;
        }
      });
    });

    return PopScope(
      canPop: state == ExamsListState.view,
      onPopInvokedWithResult: (_, _) {
        ref.read(examsListScreenStateProvider.notifier).value =
            ExamsListState.view;
      },
      child: AsyncValueScaffold(
        value: examsList,
        builder: (examsListValue) => Scaffold(
          appBar: const ExamsListScreenAppBar(),
          body: Visibility(
            visible: examsListValue.isNotEmpty,
            replacement: const EmptyExamsList(),
            child: ExamsList(
              examsList: examsListValue,
              onExamCardPressed: (index) async {
                await context.navigateTo(
                  ExamDetailRoute(exam: examsListValue[index]),
                );
              },
            ),
          ),
          floatingActionButton: AnimatedCreateExamFloatingButton(
            show: state == ExamsListState.view && examsListValue.isNotEmpty,
          ),
        ),
      ),
    );
  }
}

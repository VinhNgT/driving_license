import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/exams/presentation/screens/exams_list_screen/create_exam_floating_button.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EmptyExamsList extends HookConsumerWidget {
  const EmptyExamsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Danh sách trống', style: context.textTheme.titleLarge),
          kGap_4,
          Text(
            'Nhấn nút dưới đây để tạo bộ đề mới',
            style: context.textTheme.bodyLarge!
                .copyWith(color: context.materialScheme.onSurfaceVariant),
          ),
          kGap_16,
          const CreateExamFloatingButton(),
        ],
      ),
    );
  }
}

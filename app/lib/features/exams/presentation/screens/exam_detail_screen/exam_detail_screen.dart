import 'package:auto_route/auto_route.dart';
import 'package:driving_license/common_widgets/common_app_bar.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:driving_license/utils/datetime_formatter.dart';
import 'package:driving_license/utils/list_extention.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

@RoutePage()
class ExamDetailScreen extends HookConsumerWidget {
  const ExamDetailScreen({super.key, required this.exam});
  final Exam exam;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppBar(
        backgroundColor: context.materialScheme.surfaceContainer,
        title: Text(exam.name),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bài thi giấy phép lái xe hạng ${exam.licenseType}',
                  style: context.textTheme.titleLarge,
                ),
                kGap_16,
                Text(
                  '${exam.questionDbIndexes.length} câu hỏi - '
                  '${exam.examDuration.inMinutes} phút',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.materialScheme.onSurfaceVariant,
                  ),
                ),
                kGap_4,
                Text(
                  'Điều kiện đỗ: Đúng tối thiểu ${exam.minimumPassingScore} '
                  '/ ${exam.questionDbIndexes.length} câu và không sai câu điểm liệt',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.materialScheme.onSurfaceVariant,
                  ),
                ),
                kGap_24,
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () async {
                      ref
                          .read(currentQuestionsServiceModeProvider.notifier)
                          .mode = ExamOperatingMode(exam);

                      await context.navigateTo(QuestionRoute());
                    },
                    child: const Text('Bắt đầu làm bài thi'),
                  ),
                ),
                kGap_24,
                Text(
                  'Ngày tạo bộ câu hỏi: '
                  '${DateTimeFormatter.formatLocalTimeDay(
                    exam.createdUtcTime,
                  )}',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.materialScheme.onSurfaceVariant,
                  ),
                ),
                kGap_4,
                Text(
                  'Lần thi gần nhất: ${_getLastAttemptedTime(exam)}',
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.materialScheme.onSurfaceVariant,
                  ),
                ),
                kGap_24,
                const Divider(),
                kGap_24,
                _ExamStructure(exam: exam),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getLastAttemptedTime(Exam exam) {
    return exam.lastAttemptedUtcTime != null
        ? DateTimeFormatter.formatLocalTimeDay(exam.lastAttemptedUtcTime!)
        : 'Chưa thi';
  }
}

class _ExamStructure extends StatelessWidget {
  const _ExamStructure({required this.exam});
  final Exam exam;

  @override
  Widget build(BuildContext context) {
    final chapterQuestionsCount = _getChapterQuestionsCount(exam);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Cấu trúc bộ câu hỏi (${exam.questionDbIndexes.length} câu)',
          style: context.textTheme.titleMedium,
        ),
        kGap_6,

        //  •  Câu điểm liệt: 1 câu ngẫu nhiên trong đề
        Text(
          '  •  Câu điểm liệt: '
          '${exam.license.examInfo.examStructure.dangerQuestionsCount} '
          'câu ngẫu nhiên trong đề',
        ),

        kGap_4,
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: chapterQuestionsCount
              .map<Widget>((entry) {
                //  •  Biển báo đường bộ * : 10 câu
                return Text(
                  '  •  ${entry.chapterName}${entry.isInPool ? ' * ' : ''}: '
                  '${entry.count} câu',
                );
              })
              .toList()
              .separated(kGap_4),
        ),

        if (chapterQuestionsCount.any((element) => element.isInPool)) ...[
          kGap_24,
          Text(
            'Chú thích: chỉ một trong những chương được đánh dấu \' * \' sẽ '
            'được chọn vào bộ đề thi. Tức là chương này được chọn thì '
            'sẽ không có chương kia',
            style: context.textTheme.bodyMedium!.copyWith(
              color: context.materialScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }

  List<({String chapterName, int count, bool isInPool})>
      _getChapterQuestionsCount(Exam exam) {
    final chapterExamDetails =
        exam.license.examInfo.examStructure.chapterExamDetails;

    return chapterExamDetails.entries.map((entry) {
      return (
        chapterName: entry.key.chapterName,
        count: entry.value.chapterQuestionsCount,
        isInPool: entry.value.isInPool
      );
    }).toList()
      // Remove the chapter that has 0 questions
      ..removeWhere((element) => element.count == 0);
  }
}

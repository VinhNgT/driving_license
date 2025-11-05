import 'package:driving_license/common_widgets/async_value/async_value_widget.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/chapters/application/providers/chapters_providers.dart';
import 'package:driving_license/features/home/domain/chapter_dropdown_selection_data.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class ClearChapterCompletionDialog extends HookConsumerWidget {
  const ClearChapterCompletionDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormBuilderState>.new);

    return AlertDialog(
      title: const Text('Xoá tiến độ hoàn thành?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            textScaler: context.textScaler,
            text: TextSpan(
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.colorScheme.onSurfaceVariant,
              ),
              children: const [
                TextSpan(
                  text:
                      'Dữ liệu hoàn thành của tất cả các câu hỏi thuộc '
                      'chương được chọn sẽ bị xoá, bao gồm danh sách các câu '
                      'bạn đã làm sai.',
                ),
                TextSpan(text: '\n\n'),
                TextSpan(
                  text: 'Danh sách các câu hỏi đã lưu sẽ không bị ảnh hưởng.',
                ),
              ],
            ),
          ),
          kGap_24,
          ChapterDropdown(formKey: formKey),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Huỷ'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Xoá tiến độ',
            style: TextStyle(color: context.materialScheme.error),
          ),
          onPressed: () async {
            if (formKey.currentState!.saveAndValidate()) {
              final selected =
                  formKey.currentState!.value['chapter_to_delete']
                      as ChapterDropdownSelectionData;

              _deleteUserAnswersHandler(ref, selected);
              Navigator.of(context).pop();
            }
          },
        ),
      ],
    );
  }

  void _deleteUserAnswersHandler(
    WidgetRef ref,
    ChapterDropdownSelectionData selection,
  ) async {
    final license = await ref.read(userSelectedLicenseProvider.future);
    final userAnswersRepository = ref.read(userAnswersRepositoryProvider);

    switch (selection) {
      case AllChapterSelection():
        userAnswersRepository.clearDatabase();

      case DangerChapterSelection():
        userAnswersRepository.clearAllAnswers(
          license,
          filterDangerAnswers: true,
        );

      case ChapterSelection(:final chapter):
        userAnswersRepository.clearAllAnswers(license, chapter: chapter);
    }
  }
}

class ChapterDropdown extends HookConsumerWidget {
  const ChapterDropdown({super.key, this.formKey});
  final GlobalKey<FormBuilderState>? formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notEmptyChapters = ref.watch(notEmptyChaptersProvider);

    // Simulate the contentPadding resolution from InputDecorator
    final contentPadding = context.theme.inputDecorationTheme.contentPadding!
        .resolve(Directionality.of(context));

    // Simulate the inputGap gapPadding calculation from InputDecorator
    final gapPadding = switch (context.theme.inputDecorationTheme.border) {
      OutlineInputBorder(:final gapPadding) => gapPadding,
      InputBorder(:final isOutline)
          when isOutline || context.theme.inputDecorationTheme.filled =>
        4.0,
      _ => 0.0,
    };

    return AsyncValueWidget(
      value: notEmptyChapters,
      builder: (notEmptyChaptersValue) => FormBuilder(
        key: formKey,
        child: ExcludeFocus(
          excluding: true,
          child: FormBuilderDropdown<ChapterDropdownSelectionData>(
            name: 'chapter_to_delete',
            dropdownColor: context.materialScheme.surfaceContainerHighest,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              border: OutlineInputBorder(gapPadding: 0),
              contentPadding: EdgeInsets.zero,
              // hintText: 'Chọn chương',
              // suffixIcon: Icon(Symbols.expand_more),
            ),
            padding: EdgeInsets.only(
              left: contentPadding.left + gapPadding,
              top: contentPadding.top,
              bottom: contentPadding.bottom,
            ),
            hint: Text(
              'Chọn chương',
              style: context.theme.inputDecorationTheme.hintStyle,
            ),
            icon: Row(
              children: [
                const Gap(4), // simulate _RenderDecoration inputToSuffixGap
                ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: kMinInteractiveDimension,
                    minHeight: kMinInteractiveDimension,
                  ),
                  child: Icon(
                    Symbols.expand_more,
                    opticalSize: context.theme.iconTheme.opticalSize,
                  ),
                ),
              ],
            ),
            items: [
              const DropdownMenuItem(
                value: AllChapterSelection(),
                child: Text('Tất cả các chương'),
              ),
              const DropdownMenuItem(
                value: DangerChapterSelection(),
                child: Text('Các câu hỏi điểm liệt'),
              ),
              ...notEmptyChaptersValue.map(
                (e) => DropdownMenuItem(
                  value: ChapterSelection(e),
                  child: Text(e.chapterName),
                ),
              ),
            ],
            validator: (value) {
              if (value == null) {
                return 'Vui lòng chọn chương để xoá';
              }
              return null;
            },
          ),
        ),
      ),
    );
  }
}

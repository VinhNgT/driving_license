import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:vector_graphics/vector_graphics.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({
    super.key,
    required this.iconAssetPath,
    required this.chapterName,
    required this.completionStatus,
    this.onPressed,
  });

  final String iconAssetPath;
  final String chapterName;
  final ({int questionsCount, UserAnswersSummary summary}) completionStatus;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ButtonCard(
      surfaceColor: context.materialScheme.surfaceContainerHigh,
      onSurfaceColor: context.materialScheme.onSurface,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_16,
          vertical: kSize_12,
        ),
        child: Row(
          children: [
            SvgPicture(AssetBytesLoader(iconAssetPath)),
            kGap_16,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chapterName,
                    style: context.textTheme.titleMedium,
                  ),
                  kGap_2,
                  Text(
                    _buildCompletionStatusText(
                      completionStatus,
                    ),
                    style: context.textTheme.bodyMedium!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            kGap_16,
            Icon(
              Symbols.arrow_forward_ios,
              size: kSize_20,
              color: context.colorScheme.secondary,
            ),
          ],
        ),
      ),
    );
  }

  String _buildCompletionStatusText(
    ({int questionsCount, UserAnswersSummary summary}) status,
  ) {
    final StringBuffer buffer = StringBuffer(
      'Đã hoàn thành ${status.summary.total} / ${status.questionsCount}',
    );

    if (status.summary.wrong > 0) {
      buffer.write(' - Sai ${status.summary.wrong} câu');
    }

    return buffer.toString();
  }
}

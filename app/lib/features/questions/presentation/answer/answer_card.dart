import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/features/questions/presentation/answer/answer_state_checkbox.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  const AnswerCard({
    super.key,
    required this.state,
    required this.answer,
    this.onPressed,
  });
  final String answer;
  final AnswerState state;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final (:containerSurfaceColor, :containerOnSurfaceColor) =
        resolveContainerColor(context, state);

    return ButtonCard(
      surfaceColor: containerSurfaceColor,
      onSurfaceColor: containerOnSurfaceColor,
      onPressed: onPressed,
      reduceSplashOpacity: true,
      child: Padding(
        padding: const EdgeInsets.all(kSize_16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnswerStateCheckbox(state: state),
            kGap_12,
            Expanded(
              child: Text(
                answer,
                style: context.textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension AnswerCardX on AnswerCard {
  ({Color containerSurfaceColor, Color containerOnSurfaceColor})
      resolveContainerColor(
    BuildContext context,
    AnswerState state,
  ) {
    return switch (state) {
      AnswerState.unchecked => (
          containerSurfaceColor: context.materialScheme.surfaceContainer,
          containerOnSurfaceColor: context.materialScheme.onSurface
        ),
      AnswerState.checked => (
          containerSurfaceColor: context.materialScheme.primaryContainer,
          containerOnSurfaceColor: context.materialScheme.onPrimaryContainer
        ),
      AnswerState.correct => (
          containerSurfaceColor: context.materialScheme.tertiaryContainer,
          containerOnSurfaceColor: context.materialScheme.onTertiaryContainer
        ),
      AnswerState.incorrect => (
          containerSurfaceColor: context.materialScheme.errorContainer,
          containerOnSurfaceColor: context.materialScheme.onErrorContainer
        ),
    };
  }
}

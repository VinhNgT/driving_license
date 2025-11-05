import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

enum AnswerState { unchecked, checked, correct, incorrect }

class AnswerStateCheckbox extends StatelessWidget {
  const AnswerStateCheckbox({super.key, required this.state, this.iconSize});
  final AnswerState state;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final iconData = resolveIcon(state);
    final (:iconSurfaceColor, :iconOnSurfaceColor) =
        resolveIconColor(context, state);

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            margin: const EdgeInsets.all(4),
            color: iconOnSurfaceColor,
          ),
        ),
        Icon(
          iconData,
          fill: 1,
          color: iconSurfaceColor,
          size: iconSize,
        ),
      ],
    );
  }
}

extension AnswerStateCheckboxX on AnswerStateCheckbox {
  IconData resolveIcon(AnswerState state) {
    return switch (state) {
      AnswerState.unchecked => Symbols.check_box_outline_blank,
      AnswerState.checked || AnswerState.correct => Symbols.check_box,
      AnswerState.incorrect => Symbols.disabled_by_default,
    };
  }

  ({Color iconSurfaceColor, Color iconOnSurfaceColor}) resolveIconColor(
    BuildContext context,
    AnswerState state,
  ) {
    return switch (state) {
      AnswerState.unchecked => (
          iconSurfaceColor: context.materialScheme.primary,
          iconOnSurfaceColor: Colors.transparent
        ),
      AnswerState.checked => (
          iconSurfaceColor: context.materialScheme.primary,
          iconOnSurfaceColor: context.materialScheme.onPrimary
        ),
      AnswerState.correct => (
          iconSurfaceColor: context.materialScheme.tertiary,
          iconOnSurfaceColor: context.materialScheme.onTertiary
        ),
      AnswerState.incorrect => (
          iconSurfaceColor: context.materialScheme.error,
          iconOnSurfaceColor: context.materialScheme.onError
        ),
    };
  }
}

import 'package:driving_license/common_widgets/button_card.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/constants/gap_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';

class RememberTipCard extends HookConsumerWidget {
  const RememberTipCard({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExpanded = useState(false);

    return ButtonCard(
      surfaceColor: context.materialScheme.secondaryContainer,
      onSurfaceColor: context.materialScheme.onSecondaryContainer,
      child: AnimatedCrossFade(
        //todo: set curve and change duration
        duration: Durations.short2,
        firstChild: const _CollapsedContent(),
        secondChild: _ExpandedContent(content: content),
        crossFadeState: isExpanded.value
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
      ),
      onPressed: () {
        isExpanded.value = !isExpanded.value;
      },
    );
  }
}

class _CollapsedContent extends StatelessWidget {
  const _CollapsedContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: kSize_16,
        right: kSize_24,
        top: kSize_10,
        bottom: kSize_10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Symbols.visibility,
            size: kSize_20,
            color: context.materialScheme.onSecondaryContainer,
          ),
          kGap_8,
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              'Xem mẹo ghi nhớ',
              style: context.textTheme.titleMedium!.copyWith(
                color: context.materialScheme.onSecondaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExpandedContent extends StatelessWidget {
  const _ExpandedContent({required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kSize_16,
        vertical: kSize_12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Mẹo ghi nhớ',
            style: context.textTheme.titleMedium!.copyWith(
              color: context.materialScheme.onSecondaryContainer,
            ),
          ),
          kGap_4,
          Text(
            content,
            style: context.textTheme.bodyLarge!.copyWith(
              color: context.materialScheme.onSecondaryContainer,
            ),
          ),
        ],
      ),
    );
  }
}

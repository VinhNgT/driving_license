import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';

class ExplanationCard extends StatelessWidget {
  const ExplanationCard({super.key, required this.content});
  final String content;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(kSize_8)),
        side: BorderSide(color: context.materialScheme.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kSize_16,
          vertical: kSize_12,
        ),
        child: Text(
          content,
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}

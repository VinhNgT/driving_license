import 'package:driving_license/common_widgets/widget_deadzone.dart';
import 'package:driving_license/constants/app_sizes.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CommonBottomSheet extends StatelessWidget {
  const CommonBottomSheet({
    super.key,
    required this.title,
    required this.child,
  });
  final Widget title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return WidgetDeadzone(
      deadzone: EdgeInsets.only(
        bottom: context.systemGestureInsets.bottom,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _TitleBar(title: title),
          Flexible(child: child),
        ],
      ),
    );
  }
}

class _TitleBar extends StatelessWidget {
  const _TitleBar({required this.title});
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: kSize_8),
              child: _Handle(),
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: kSize_12,
                  horizontal: kSize_16,
                ),
                child: title,
              ),
            ),
            const Divider(),
          ],
        ),
        const Positioned(
          top: 12,
          right: 4,
          child: _CloseButton(),
        ),
      ],
    );
  }
}

class _Handle extends StatelessWidget {
  const _Handle();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 4,
      decoration: BoxDecoration(
        color: context.materialScheme.outline,
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
    );
  }
}

class _CloseButton extends StatelessWidget {
  const _CloseButton();

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Symbols.close,
        color: context.materialScheme.onSurfaceVariant,
      ),
      onPressed: () async => Navigator.of(context).pop(),
    );
  }
}

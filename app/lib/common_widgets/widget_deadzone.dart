import 'package:flutter/material.dart';

class WidgetDeadzone extends StatelessWidget {

  /// A widget that creates a deadzone around a child widget. This is useful
  /// when you want to prevent gestures from being recognized in certain areas
  /// of the screen, like system gesture navigation (back, home, recent apps)
  const WidgetDeadzone({
    super.key,
    required this.child,
    required this.deadzone,
  });
  final Widget child;
  final EdgeInsets deadzone;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (deadzone.left > 0)
          Positioned.fill(
            right: null,
            child: AbsorbPointer(
              child: SizedBox(
                width: deadzone.left,
                height: double.infinity,
              ),
            ),
          ),
        if (deadzone.right > 0)
          Positioned.fill(
            left: null,
            child: AbsorbPointer(
              child: SizedBox(
                width: deadzone.right,
                height: double.infinity,
              ),
            ),
          ),
        if (deadzone.top > 0)
          Positioned.fill(
            bottom: null,
            child: AbsorbPointer(
              child: SizedBox(
                width: double.infinity,
                height: deadzone.top,
              ),
            ),
          ),
        if (deadzone.bottom > 0)
          Positioned.fill(
            top: null,
            child: AbsorbPointer(
              child: SizedBox(
                width: double.infinity,
                height: deadzone.bottom,
              ),
            ),
          ),
      ],
    );
  }
}

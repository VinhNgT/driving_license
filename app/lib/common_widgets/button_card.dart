import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  const ButtonCard({
    super.key,
    required this.surfaceColor,
    required this.onSurfaceColor,
    required this.child,
    this.onPressed,
    this.borderRadius,
    this.reduceSplashOpacity = false,
  });

  final Color surfaceColor;
  final Color onSurfaceColor;
  final Widget child;
  final VoidCallback? onPressed;
  final double? borderRadius;
  final bool reduceSplashOpacity;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: surfaceColor,
      clipBehavior: Clip.antiAlias,
      shape: borderRadius != null
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            )
          : null,
      child: InkWell(
        // overlayColor: InkWellBackgroundColor(onSurfaceColor),
        // splashFactory: NoSplash.splashFactory,
        splashColor: reduceSplashOpacity
            ? onSurfaceColor.withValues(alpha: 0.04)
            : null,
        onTap: onPressed,
        child: child,
      ),
    );
  }
}

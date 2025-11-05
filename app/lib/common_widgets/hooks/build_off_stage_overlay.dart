import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useBuildOffstageOverlay(Widget widget, {bool offstage = true}) {
  final context = useContext();

  useEffect(() {
    final overlaysEntry = OverlayEntry(
      builder: (_) {
        return Align(
          child: Offstage(offstage: offstage, child: widget),
        );
      },
    );

    Future.microtask(() {
      if (!context.mounted) {
        return;
      }
      Overlay.of(context).insert(overlaysEntry);
    });

    return overlaysEntry.remove;
  }, []);
}

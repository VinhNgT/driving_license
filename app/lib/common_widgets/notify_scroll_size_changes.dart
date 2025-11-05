import 'package:flutter/material.dart';

class NotifyScrollSizeChanges extends StatelessWidget {

  const NotifyScrollSizeChanges({
    super.key,
    required this.child,
    required this.scrollController,
  });
  final Widget child;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        if (notification is ScrollMetricsNotification &&
            scrollController.hasClients) {
          scrollController.position.notifyListeners();
        }
        return false;
      },
      child: child,
    );
  }
}

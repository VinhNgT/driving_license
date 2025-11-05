import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// A stateful widget that provides awareness of route changes and transitions.
class AwareRouteState extends StatefulWidget {

  /// Creates a widget that provides awareness of route changes and
  /// transistions.
  const AwareRouteState({
    super.key,
    this.didPopNext,
    this.didPush,
    this.didPop,
    this.didPushNext,
    this.didInitTabRoute,
    this.didChangeTabRoute,
    required this.child,
  });
  /// Called when the top route has been popped off, and the current route
  /// shows up.
  final VoidCallback? didPopNext;

  /// Called when the current route has been pushed.
  final VoidCallback? didPush;

  /// Called when the current route has been popped off.
  final VoidCallback? didPop;

  /// Called when a new route has been pushed, and the current route is no
  /// longer visible.
  final VoidCallback? didPushNext;

  /// Called when a tab route activates.
  final void Function(TabPageRoute? previousRoute)? didInitTabRoute;

  /// Called when tab route reactivates.
  final void Function(TabPageRoute previousRoute)? didChangeTabRoute;

  /// The child widget to display.
  final Widget child;

  @override
  State<AwareRouteState> createState() => _AwareRouteStateState();
}

class _AwareRouteStateState extends State<AwareRouteState>
    with AutoRouteAwareStateMixin<AwareRouteState> {
  @override
  void didPopNext() {
    widget.didPopNext?.call();
  }

  @override
  void didPush() {
    widget.didPush?.call();
  }

  @override
  void didPop() {
    widget.didPop?.call();
  }

  @override
  void didPushNext() {
    widget.didPushNext?.call();
  }

  @override
  void didInitTabRoute(TabPageRoute? previousRoute) {
    widget.didInitTabRoute?.call(previousRoute);
  }

  @override
  void didChangeTabRoute(TabPageRoute previousRoute) {
    widget.didChangeTabRoute?.call(previousRoute);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

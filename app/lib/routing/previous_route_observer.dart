import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'previous_route_observer.g.dart';

/// A custom route observer that keeps track of the previous route.
class PreviousRouteObserver extends AutoRouterObserver {
  /// Constructs a [PreviousRouteObserver] with the given [ref].
  PreviousRouteObserver(this.ref);
  Ref ref;

  /// The name of the previous route.
  String? get name => previousRoute?.settings.name;

  Route? previousRoute;

  @override
  void didPop(Route route, Route? previousRoute) {
    this.previousRoute = route;
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    this.previousRoute = previousRoute;
  }
}

@Riverpod(keepAlive: true)
PreviousRouteObserver previousRouteObserver(Ref ref) {
  return PreviousRouteObserver(ref);
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:driving_license/routing/app_router.dart';
import 'package:driving_license/routing/previous_route_observer.dart';
import 'package:driving_license/routing/router_reevaluate_notifier.dart';
import 'package:driving_license/theme/theme.dart';
import 'package:driving_license/utils/app_ui_overlay.dart';
import 'package:driving_license/utils/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final routerGuardReevaluate = ref.watch(routerReevaluateNotifierProvider);
    final previousRouteObserver = ref.watch(previousRouteObserverProvider);

    // Forcing dark mode for now
    // final brightness = MediaQuery.of(context).platformBrightness;
    const brightness = Brightness.dark;

    return MaterialApp.router(
      title: 'Drive Ready',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return Theme(
          data: switch (brightness) {
            Brightness.light => MaterialTheme(context.theme).light,
            Brightness.dark => MaterialTheme(context.theme).dark,
          },
          child: Builder(
            builder: (context) {
              // We call setSystemChrome here so it can access the themed
              // BuildContext.
              unawaited(setSystemChrome(context));
              return child!;
            },
          ),
        );
      },
      routerConfig: appRouter.config(
        // Initial route with parameter
        // deepLinkBuilder: (_) => const DeepLink([HomeRoute()]),
        reevaluateListenable: routerGuardReevaluate,
        // AwareRouteState widget needs AutoRouteObserver() to function
        navigatorObservers: () => [AutoRouteObserver(), previousRouteObserver],
      ),
    );
  }
}

Future<void> setSystemChrome(BuildContext context) async {
  // Lock device orientation
  unawaited(
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  );

  unawaited(SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge));
  SystemChrome.setSystemUIOverlayStyle(
    AppUiOverlay(context.brightness).navigationBarOverlayStyle,
  );
}

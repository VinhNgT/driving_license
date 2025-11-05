import 'package:animations/animations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:driving_license/features/home/presentation/home_screen.dart';
import 'package:driving_license/routing/app_router.gr.dart';
import 'package:driving_license/routing/previous_route_observer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen,Route')
class AppRouter extends RootStackRouter {
  AppRouter(this.ref) : super();
  final Ref ref;

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LicenseSelectionRoute.page),
    AutoRoute(
      page: HomeRoute.page,
      guards: [HomeRouteGuard(ref)],
      initial: true,
    ),
    AutoRoute(page: QuestionRoute.page),
    AutoRoute(page: ExamsListRoute.page),
    AutoRoute(page: ExamDetailRoute.page),
    AutoRoute(page: ExamResultRoute.page),
    AutoRoute(page: SendFeedbackRoute.page),
    AutoRoute(page: RewardedAdRoute.page),
    AutoRoute(page: DonateRoute.page),
    AutoRoute(page: AppLicenseRoute.page),
  ];

  @override
  RouteType get defaultRouteType =>
      RouteType.custom(transitionsBuilder: _getTransition);
}

extension _TransitionX on AppRouter {
  RouteTransitionsBuilder get _getTransition =>
      (context, animation, secondaryAnimation, child) {
        final previousRouteName = ref.read(previousRouteObserverProvider).name;
        final currentRouteName = context.topRoute.name;
        final ignoreCustomTransitionRoutes = [AppLicenseRoute.name];

        // If the previous or current route is LicenseSelectionRoute,
        // we want to use a different transition
        if ((previousRouteName == LicenseSelectionRoute.name ||
                currentRouteName == LicenseSelectionRoute.name) &&
            !ignoreCustomTransitionRoutes.contains(currentRouteName)) {
          return _licenseSelectionFromToTransition(
            context,
            animation,
            secondaryAnimation,
            child,
          );
        }

        return SharedAxisTransition(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        );
      };

  RouteTransitionsBuilder get _licenseSelectionFromToTransition =>
      (context, animation, secondaryAnimation, child) {
        return FadeThroughTransition(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      };
}

@Riverpod(keepAlive: true)
Raw<AppRouter> appRouter(Ref ref) {
  return AppRouter(ref);
}

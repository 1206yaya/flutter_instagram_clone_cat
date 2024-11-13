import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../views/pages/initialization_page.dart';
import '../views/pages/main/main_page.dart';
import '../views/pages/sign_in_up/sign_in_up_page.dart';
import 'branches/branches.dart';

part 'app_routes.g.dart';

@TypedGoRoute<InitializationRoute>(
  name: InitializationRoute.name,
  path: InitializationRoute.path,
)
class InitializationRoute extends GoRouteData {
  const InitializationRoute();

  static const String name = '/init';
  static const String path = '/init';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: InitializationPage());
  }
}

@TypedGoRoute<SignInUpRouteData>(
  name: SignInUpRouteData.name,
  path: SignInUpRouteData.path,
)
class SignInUpRouteData extends GoRouteData {
  const SignInUpRouteData();

  static const String name = '/signInUp';
  static const String path = '/signInUp';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInUpPage(
      isSignIn: true,
    );
  }
}

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: [
    TypedStatefulShellBranch<HomeShellBranchData>(
      routes: [
        TypedGoRoute<HomeRouteData>(
          name: HomeRouteData.name,
          path: HomeRouteData.path,
        ),
      ],
    ),
  ],
)
class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainPage(navigationShell: navigationShell);
  }
}

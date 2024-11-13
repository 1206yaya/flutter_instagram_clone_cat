import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/presentation/sign_in_up_screen.dart';
import '../features/initialization/presentation/initialization_screen.dart';
import '../features/main/presentation/main_screen.dart';
import 'branches/dashboard_routes.dart';
import 'branches/explore_routes.dart';
import 'branches/post_routes.dart';
import 'branches/settings_routers.dart';
import 'branches/timeline_routes.dart';

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
    return const NoTransitionPage(child: InitializationScreen());
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
    return const SignInUpScreen(
      isSignIn: true,
    );
  }
}

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: [
    TypedStatefulShellBranch<TimelineShellBranchData>(
      routes: [
        TypedGoRoute<TimelineRouteData>(
          name: TimelineRouteData.name,
          path: TimelineRouteData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<ExploreShellBranchData>(
      routes: [
        TypedGoRoute<ExploreRouteData>(
          name: ExploreRouteData.name,
          path: ExploreRouteData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<PostShellBranchData>(
      routes: [
        TypedGoRoute<PostRouteData>(
          name: PostRouteData.name,
          path: PostRouteData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<DashboardShellBranchData>(
      routes: [
        TypedGoRoute<DashboardRouteData>(
          name: DashboardRouteData.name,
          path: DashboardRouteData.path,
        ),
      ],
    ),
    TypedStatefulShellBranch<SettingsShellBranchData>(
      routes: [
        TypedGoRoute<SettingsRouteData>(
          name: SettingsRouteData.name,
          path: SettingsRouteData.path,
          routes: [
            TypedGoRoute<ThemeSelectionRouteData>(
              name: ThemeSelectionRouteData.name,
              path: ThemeSelectionRouteData.path,
            ),
            TypedGoRoute<AccountRouteData>(
              name: AccountRouteData.name,
              path: AccountRouteData.path,
            ),
          ],
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
    return MainScreen(navigationShell: navigationShell);
  }
}

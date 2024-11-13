// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'app_routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $initializationRoute,
      $signInUpRouteData,
      $mainShellRouteData,
    ];

RouteBase get $initializationRoute => GoRouteData.$route(
      path: '/init',
      name: '/init',
      factory: $InitializationRouteExtension._fromState,
    );

extension $InitializationRouteExtension on InitializationRoute {
  static InitializationRoute _fromState(GoRouterState state) =>
      const InitializationRoute();

  String get location => GoRouteData.$location(
        '/init',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signInUpRouteData => GoRouteData.$route(
      path: '/signInUp',
      name: '/signInUp',
      factory: $SignInUpRouteDataExtension._fromState,
    );

extension $SignInUpRouteDataExtension on SignInUpRouteData {
  static SignInUpRouteData _fromState(GoRouterState state) =>
      const SignInUpRouteData();

  String get location => GoRouteData.$location(
        '/signInUp',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
      factory: $MainShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/home',
              name: '/home',
              factory: $HomeRouteDataExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

extension $HomeRouteDataExtension on HomeRouteData {
  static HomeRouteData _fromState(GoRouterState state) => const HomeRouteData();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

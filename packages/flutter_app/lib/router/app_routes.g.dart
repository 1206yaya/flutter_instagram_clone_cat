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
              path: '/timeline',
              name: '/timeline',
              factory: $TimelineRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'stacked-dashboard/:uid',
                  name: '/stacked-dashboard',
                  factory: $StackedDashboardRouteDataExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'stacked-dashboard/follow-list/:uid',
                      name: '/stacked-dashboard/follow-list',
                      factory: $StackedDashboardFollowListRouteDataExtension
                          ._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/explore',
              name: '/explore',
              factory: $ExploreRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/post',
              name: '/post',
              factory: $PostRouteDataExtension._fromState,
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/dashboard',
              name: '/dashboard',
              factory: $DashboardRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'dashboard/follow-list/:uid',
                  name: '/dashboard/follow-list',
                  factory: $DashboardFollowListRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'profile-edit',
                  name: '/profile-edit',
                  factory: $ProfileEditRouteDataExtension._fromState,
                  routes: [
                    GoRouteData.$route(
                      path: 'profile-edit-field/:userId/:title/:fieldType',
                      name: '/profile-edit-field',
                      factory: $ProfileEditFieldRouteDataExtension._fromState,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/settings',
              name: '/settings',
              factory: $SettingsRouteDataExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: 'theme-selection',
                  name: '/theme-selection',
                  factory: $ThemeSelectionRouteDataExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'account',
                  name: '/account',
                  factory: $AccountRouteDataExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

extension $TimelineRouteDataExtension on TimelineRouteData {
  static TimelineRouteData _fromState(GoRouterState state) =>
      const TimelineRouteData();

  String get location => GoRouteData.$location(
        '/timeline',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StackedDashboardRouteDataExtension on StackedDashboardRouteData {
  static StackedDashboardRouteData _fromState(GoRouterState state) =>
      StackedDashboardRouteData(
        uid: state.pathParameters['uid']!,
      );

  String get location => GoRouteData.$location(
        '/timeline/stacked-dashboard/${Uri.encodeComponent(uid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $StackedDashboardFollowListRouteDataExtension
    on StackedDashboardFollowListRouteData {
  static StackedDashboardFollowListRouteData _fromState(GoRouterState state) =>
      StackedDashboardFollowListRouteData(
        uid: state.pathParameters['uid']!,
      );

  String get location => GoRouteData.$location(
        '/timeline/stacked-dashboard/${Uri.encodeComponent(uid)}/stacked-dashboard/follow-list/${Uri.encodeComponent(uid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ExploreRouteDataExtension on ExploreRouteData {
  static ExploreRouteData _fromState(GoRouterState state) =>
      const ExploreRouteData();

  String get location => GoRouteData.$location(
        '/explore',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $PostRouteDataExtension on PostRouteData {
  static PostRouteData _fromState(GoRouterState state) => const PostRouteData();

  String get location => GoRouteData.$location(
        '/post',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DashboardRouteDataExtension on DashboardRouteData {
  static DashboardRouteData _fromState(GoRouterState state) =>
      const DashboardRouteData();

  String get location => GoRouteData.$location(
        '/dashboard',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $DashboardFollowListRouteDataExtension
    on DashboardFollowListRouteData {
  static DashboardFollowListRouteData _fromState(GoRouterState state) =>
      DashboardFollowListRouteData(
        uid: state.pathParameters['uid']!,
      );

  String get location => GoRouteData.$location(
        '/dashboard/dashboard/follow-list/${Uri.encodeComponent(uid)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileEditRouteDataExtension on ProfileEditRouteData {
  static ProfileEditRouteData _fromState(GoRouterState state) =>
      const ProfileEditRouteData();

  String get location => GoRouteData.$location(
        '/dashboard/profile-edit',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProfileEditFieldRouteDataExtension on ProfileEditFieldRouteData {
  static ProfileEditFieldRouteData _fromState(GoRouterState state) =>
      ProfileEditFieldRouteData(
        userId: state.pathParameters['userId']!,
        title: state.pathParameters['title']!,
        fieldType: _$ProfileFieldTypeEnumMap
            ._$fromName(state.pathParameters['fieldType']!),
      );

  String get location => GoRouteData.$location(
        '/dashboard/profile-edit/profile-edit-field/${Uri.encodeComponent(userId)}/${Uri.encodeComponent(title)}/${Uri.encodeComponent(_$ProfileFieldTypeEnumMap[fieldType]!)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

const _$ProfileFieldTypeEnumMap = {
  ProfileFieldType.displayName: 'display-name',
  ProfileFieldType.bio: 'bio',
};

extension $SettingsRouteDataExtension on SettingsRouteData {
  static SettingsRouteData _fromState(GoRouterState state) =>
      const SettingsRouteData();

  String get location => GoRouteData.$location(
        '/settings',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ThemeSelectionRouteDataExtension on ThemeSelectionRouteData {
  static ThemeSelectionRouteData _fromState(GoRouterState state) =>
      const ThemeSelectionRouteData();

  String get location => GoRouteData.$location(
        '/settings/theme-selection',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRouteDataExtension on AccountRouteData {
  static AccountRouteData _fromState(GoRouterState state) =>
      const AccountRouteData();

  String get location => GoRouteData.$location(
        '/settings/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension<T extends Enum> on Map<T, String> {
  T _$fromName(String value) =>
      entries.singleWhere((element) => element.value == value).key;
}

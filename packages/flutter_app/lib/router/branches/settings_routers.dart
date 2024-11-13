import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/settings/presentation/account/account_screen.dart';
import '../../features/settings/presentation/settings/settings_screen.dart';
import '../../features/settings/presentation/theme_selection/theme_selection_screen.dart';

class SettingsShellBranchData extends StatefulShellBranchData {
  const SettingsShellBranchData();
}

class SettingsRouteData extends GoRouteData {
  const SettingsRouteData();

  static const String name = '/settings';
  static const String path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SettingsScreen();
  }
}

class ThemeSelectionRouteData extends GoRouteData {
  const ThemeSelectionRouteData();

  static const String name = '/theme-selection';
  static const String path = 'theme-selection';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ThemeSelectionScreen();
  }
}

class AccountRouteData extends GoRouteData {
  const AccountRouteData();

  static const String name = '/account';
  static const String path = 'account';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountScreen();
  }
}

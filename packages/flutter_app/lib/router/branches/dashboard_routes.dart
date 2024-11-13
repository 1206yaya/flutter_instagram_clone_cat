import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/dashbaord_screen.dart';

class DashboardShellBranchData extends StatefulShellBranchData {
  const DashboardShellBranchData();
}

class DashboardRouteData extends GoRouteData {
  const DashboardRouteData();

  static const String name = '/dashboard';
  static const String path = '/dashboard';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const DashboardScreen();
  }
}

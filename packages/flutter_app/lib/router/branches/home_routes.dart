import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../views/pages/home_page/home_page.dart';

class HomeShellBranchData extends StatefulShellBranchData {
  const HomeShellBranchData();
}

class HomeRouteData extends GoRouteData {
  const HomeRouteData();

  static const String name = '/home';
  static const String path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../explore/presentation/explore_screen.dart';

class ExploreShellBranchData extends StatefulShellBranchData {
  const ExploreShellBranchData();
}

class ExploreRouteData extends GoRouteData {
  const ExploreRouteData();

  static const String name = '/explore';
  static const String path = '/explore';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ExploreScreen();
  }
}

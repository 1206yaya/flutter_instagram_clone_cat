import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/timeline/presentation/timeline_screen.dart';

class TimelineShellBranchData extends StatefulShellBranchData {
  const TimelineShellBranchData();
}

class TimelineRouteData extends GoRouteData {
  const TimelineRouteData();

  static const String name = '/timeline';
  static const String path = '/timeline';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const TimelineScreen();
  }
}

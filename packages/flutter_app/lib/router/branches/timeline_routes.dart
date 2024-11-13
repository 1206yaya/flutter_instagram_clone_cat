import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/dashboard/presentation/follow_list/follow_list_screen.dart';
import '../../features/timeline/presentation/timeline_screen/timeline_screen.dart';
import '../../features/user/domain/user_id_firestore.dart';

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

// ユーザーのプロフィール表示用
class StackedDashboardRouteData extends GoRouteData {
  const StackedDashboardRouteData({required this.uid});

  final String uid;

  static const String name = '/stacked-dashboard';
  static const String path = 'stacked-dashboard/:uid';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DashboardScreen.withUid(uid: UserIdFirestore(value: uid));
  }
}

// フォローワー、フォロー中のユーザー表示用

class StackedDashboardFollowListRouteData extends GoRouteData {
  const StackedDashboardFollowListRouteData({
    required this.uid,
  });

  final String uid;

  static const String name = '/stacked-dashboard/follow-list';
  static const String path = 'stacked-dashboard/follow-list/:uid';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FollowListScreen(uid: UserIdFirestore(value: uid));
  }
}

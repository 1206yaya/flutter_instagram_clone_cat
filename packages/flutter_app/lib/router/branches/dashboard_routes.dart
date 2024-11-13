import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/dashboard/presentation/edit_profile/profile_edit_field_screen.dart';
import '../../features/dashboard/presentation/edit_profile/profile_edit_screen.dart';
import '../../features/dashboard/presentation/edit_profile/profile_field_type.dart';
import '../../features/dashboard/presentation/follow_list/follow_list_screen.dart';
import '../../features/user/domain/user_id_firestore.dart';

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

class DashboardFollowListRouteData extends GoRouteData {
  const DashboardFollowListRouteData({
    required this.uid,
  });

  final String uid;

  static const String name = '/dashboard/follow-list';
  static const String path = 'dashboard/follow-list/:uid';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return FollowListScreen(uid: UserIdFirestore(value: uid));
  }
}

class ProfileEditRouteData extends GoRouteData {
  const ProfileEditRouteData();

  static const String name = '/profile-edit';
  static const String path = 'profile-edit';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ProfileEditScreen();
  }
}

class ProfileEditFieldRouteData extends GoRouteData {
  const ProfileEditFieldRouteData({
    required this.userId,
    required this.title,
    required this.fieldType,
  });

  final String userId;
  final String title;
  final ProfileFieldType fieldType;

  static const String name = '/profile-edit-field';
  static const String path = 'profile-edit-field/:userId/:title/:fieldType';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfileEditFieldScreen(
      userId: UserIdFirestore(value: userId),
      title: title,
      fieldType: fieldType,
    );
  }
}

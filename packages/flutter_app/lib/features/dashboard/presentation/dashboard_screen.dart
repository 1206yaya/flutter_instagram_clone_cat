import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/extension/async_value_ui.dart';
import '../../../widgets/async_value_widget.dart';
import '../../authentication/application/auth_service.dart';
import '../../post/application/post_service.dart';
import '../../user/application/user_service.dart';
import '../../user/domain/user_firestore.dart';
import '../../user/domain/user_id_firestore.dart';
import 'dashboard_controller.dart';
import 'widgets/posts_grid.dart';
import 'widgets/profile_section.dart';

class DashboardScreen extends HookConsumerWidget {
  const DashboardScreen({super.key}) : uid = null;
  const DashboardScreen.withUid({super.key, required this.uid});

  final UserIdFirestore? uid;
  static const titleKey = Key('dashboard-title');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserIdFirestore =
        ref.watch(authServiceProvider).currentUserIdFirestore;
    final isCurrentUser = uid == null || currentUserIdFirestore == uid;
    final targetUid = uid ?? currentUserIdFirestore;
    debugPrint('DashboardScreen targetUid: ${targetUid.value}');
    final profileData = ref.watch(userStreamProvider(targetUid));
    final postsData = ref.watch(postsStreamProvider(targetUid));

    ref.listen<AsyncValue<void>>(
      dashboardControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Scaffold(
      appBar: AppBar(
        title: AsyncValueEmptyWidget<UserFirestore?>(
          value: profileData,
          data: (profile) => Text(
            profile?.data.displayName ?? '',
            style: Theme.of(context).textTheme.titleLarge,
            key: titleKey,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          ProfileSection(
            profileData: profileData,
            isCurrentUser: isCurrentUser,
          ),
          const SliverToBoxAdapter(child: Divider()),
          PostsGrid(postsData: postsData),
        ],
      ),
    );
  }
}

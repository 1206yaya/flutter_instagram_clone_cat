import 'package:flutter/material.dart';

import '../../../../gen/strings.g.dart';
import '../../../../router/router.dart';
import '../../../user/domain/user_firestore.dart';
import '../../../user/domain/user_id_firestore.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({
    super.key,
    required this.profile,
  });

  final UserFirestore? profile;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    Widget buildStatItem({
      required int? value,
      required String label,
      VoidCallback? onTap,
    }) {
      var data = '--';
      if (profile != null) {
        data = value.toString();
      }
      return InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Text(
              data,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(label),
          ],
        ),
      );
    }

    void navigateToFollowList(BuildContext context, UserIdFirestore userId) {
      StackedDashboardFollowListRouteData(uid: userId.value).go(context);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildStatItem(
          value: profile?.data.postsCount,
          label: t.dashboard.label.posts,
        ),
        buildStatItem(
          value: profile?.data.followersCount,
          label: t.dashboard.label.followers,
          onTap: () => navigateToFollowList(context, profile!.uid),
        ),
        buildStatItem(
          value: profile?.data.followingCount,
          label: t.dashboard.label.following,
          onTap: () => navigateToFollowList(context, profile!.uid),
        ),
      ],
    );
  }
}

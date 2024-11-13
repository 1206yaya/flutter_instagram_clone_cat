import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../gen/strings.g.dart';
import '../../../../router/app_routes.dart';
import '../../../../router/branches/dashboard_routes.dart';
import '../../../../widgets/async_value_widget.dart';
import '../../../follow/application/following_service.dart';
import '../../../user/domain/user_firestore.dart';

ButtonStyle _buildButtonStyle(BuildContext context, {Color? backgroundColor}) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(vertical: 12),
    backgroundColor: backgroundColor,
  );
}

class ProfileActionButton extends ConsumerWidget {
  const ProfileActionButton({
    super.key,
    required this.profile,
    required this.showFollowButton,
  });

  final UserFirestore profile;
  final bool showFollowButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final uid = profile.uid;
    Widget buildFollowButton(BuildContext context, WidgetRef ref) {
      final isFollowingAsync = ref.watch(isFollowingUserProvider(uid));
      final followingService = ref.read(followingServiceProvider);

      void handleFollowAction(
        FollowingService service,
        bool isFollowing,
      ) {
        if (isFollowing) {
          service.unfollowUser(uid);
        } else {
          service.followUser(uid);
        }
      }

      return AsyncValueWidget(
        value: isFollowingAsync,
        data: (isFollowing) => SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => handleFollowAction(followingService, isFollowing),
            style: _buildButtonStyle(
              context,
              backgroundColor: isFollowing
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              isFollowing
                  ? t.dashboard.button.unfollow
                  : t.dashboard.button.follow,
              style: TextStyle(
                color: isFollowing
                    ? Theme.of(context).colorScheme.onSecondary
                    : Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      );
    }

    // プロフィール編集ボタンのウィジェット
    Widget buildEditButton() {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => const ProfileEditRouteData().go(context),
          style: _buildButtonStyle(context),
          child: Text(t.dashboard.profileEdit.appBar.title),
        ),
      );
    }

    // showFollowButtonとuidの状態に応じて適切なボタンを表示
    if (!showFollowButton) {
      return buildEditButton();
    }
    return buildFollowButton(context, ref);
  }
}

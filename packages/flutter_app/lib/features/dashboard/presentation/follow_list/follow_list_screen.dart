import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../gen/strings.g.dart';
import '../../../../router/router.dart';
import '../../../../widgets/async_value_widget.dart';
import '../../../../widgets/profile_avatar.dart';
import '../../../authentication/application/auth_service.dart';
import '../../../follow/application/follower_service.dart';
import '../../../follow/application/following_service.dart';
import '../../../user/application/user_service.dart';
import '../../../user/domain/user_firestore.dart';
import '../../../user/domain/user_id_firestore.dart';
import 'follow_list_controller.dart';
// # 自分のFollowers
// 削除: 自分のフォロワー

// # 自分のFollowing
// フォロー中: 自分がフォローしているユーザー

// # 他人のFollowers
// 空白: 自分
// 削除: 自分のフォロワー
// フォロー: 自分がフォローしていないユーザー
// フォロー中: 自分がフォローしているユーザー

// # 他人のFollowing
// 空白: 自分
// フォロー: 自分がフォローしていないユーザー
// フォロー中: 自分がフォローしているユーザー

// FollowButtonの状態を表す列挙型
enum FollowButtonState {
  none, // 空白 (自分自身)
  follow, // フォロー
  following, // フォロー中
  remove, // 削除
}

// タブの種類を表す列挙型
enum FollowListTab {
  followers,
  following;

  String get label =>
      this == FollowListTab.followers ? 'Followers' : 'Following';
}

class FollowListScreen extends ConsumerWidget {
  const FollowListScreen({
    super.key,
    required this.uid,
  });

  final UserIdFirestore uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final profileData = ref.watch(userStreamProvider(uid));
    final currentUserId = ref.watch(authServiceProvider).currentUserIdFirestore;
    final isCurrentUser = uid == currentUserId;

    return AsyncValueWidget<UserFirestore?>(
      value: profileData,
      data: (user) => DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(user?.data.displayName ?? ''),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: t.followList.tab
                      .followers(count: user?.data.followersCount ?? 0),
                ),
                Tab(
                  text: t.followList.tab
                      .following(count: user?.data.followingCount ?? 0),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Followers Tab
              FollowListTabView(
                userId: uid,
                tab: FollowListTab.followers,
                isCurrentUser: isCurrentUser,
                currentUserId: currentUserId,
              ),
              // Following Tab
              FollowListTabView(
                userId: uid,
                tab: FollowListTab.following,
                isCurrentUser: isCurrentUser,
                currentUserId: currentUserId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FollowListTabView extends ConsumerWidget {
  const FollowListTabView({
    super.key,
    required this.userId,
    required this.tab,
    required this.isCurrentUser,
    required this.currentUserId,
  });

  final UserIdFirestore userId;
  final FollowListTab tab;
  final bool isCurrentUser;
  final UserIdFirestore currentUserId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStream = tab == FollowListTab.followers
        ? ref.watch(userFollowersProvider(userId))
        : ref
            .watch(followListUsersProvider(userId: userId, isFollowers: false));

    return AsyncValueWidget<List<UserFirestore>>(
      value: userStream,
      data: (users) => ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return FollowUserTile(
            user: user,
            currentUserId: currentUserId,
            tab: tab,
            isCurrentUser: isCurrentUser,
          );
        },
      ),
    );
  }
}

///
class FollowUserTile extends ConsumerWidget {
  const FollowUserTile({
    super.key,
    required this.user,
    required this.currentUserId,
    required this.tab,
    required this.isCurrentUser,
  });

  final UserFirestore user;
  final UserIdFirestore currentUserId;
  final FollowListTab tab;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('FollowUserTile: ${user.uid}');
    // フォロー状態を監視
    final isFollowingStream = ref.watch(
      isFollowingUserProvider(user.uid),
    );

    return AsyncValueWidget<bool>(
      value: isFollowingStream,
      data: (isFollowing) {
        final buttonState = _determineButtonState(
          userId: user.uid,
          isFollowing: isFollowing,
        );
        return FollowListTileWidget(
          user: user,
          buttonState: buttonState,
          onButtonTap: () async => _handleButtonTap(ref, user.uid, buttonState),
        );
      },
    );
  }

  FollowButtonState _determineButtonState({
    required UserIdFirestore userId,
    required bool isFollowing,
  }) {
    debugPrint('determineButtonState: $userId, $isFollowing');
    // 自分自身の場合は何も表示しない
    if (userId == currentUserId) {
      return FollowButtonState.none;
    }

    // 自分のリストを見ている場合
    if (isCurrentUser) {
      return tab == FollowListTab.followers
          ? FollowButtonState.remove
          : FollowButtonState.following;
    }

    // 他人のリストを見ている場合
    return isFollowing ? FollowButtonState.following : FollowButtonState.follow;
  }

  Future<void> _handleButtonTap(
    WidgetRef ref,
    UserIdFirestore targetUserId,
    FollowButtonState buttonState,
  ) async {
    switch (buttonState) {
      case FollowButtonState.remove:
        await ref.read(followerServiceProvider).removeFollower(targetUserId);
      case FollowButtonState.following:
        await ref.read(followingServiceProvider).unfollowUser(targetUserId);
      case FollowButtonState.follow:
        await ref.read(followingServiceProvider).followUser(targetUserId);
      case FollowButtonState.none:
        break; // 何もしない
    }
  }
}

class FollowListTileWidget extends StatelessWidget {
  const FollowListTileWidget({
    super.key,
    required this.user,
    required this.buttonState,
    required this.onButtonTap,
  });

  final UserFirestore user;
  final FollowButtonState buttonState;
  final VoidCallback onButtonTap;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: ProfileAvatar(
        imageUrl: user.data.photoUrl,
        radius: 24,
        onTap: () {
          StackedDashboardRouteData(uid: user.uid.value).go(context);
        },
      ),
      title: Text(
        user.data.displayName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(user.data.bio),
      trailing: buttonState == FollowButtonState.none
          ? null
          : TextButton(
              onPressed: onButtonTap,
              style: _buildButtonStyle(
                context,
                boarderColor: buttonState == FollowButtonState.follow
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.primary,
                backgroundColor: buttonState == FollowButtonState.follow
                    ? Colors.transparent
                    : Colors.transparent,
              ),
              child: Text(
                _getButtonText(buttonState, t),
                style: TextStyle(
                  color: buttonState == FollowButtonState.follow
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
    );
  }

  String _getButtonText(FollowButtonState state, Translations t) {
    switch (state) {
      case FollowButtonState.remove:
        return t.followList.button.remove;
      case FollowButtonState.following:
        return t.followList.button.following;
      case FollowButtonState.follow:
        return t.followList.button.follow;
      case FollowButtonState.none:
        return '';
    }
  }
}

ButtonStyle _buildButtonStyle(
  BuildContext context, {
  Color? backgroundColor,
  Color? boarderColor,
}) {
  return ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
      side: BorderSide(
        color: boarderColor ?? Colors.transparent,
        // color: Theme.of(context).colorScheme.primary, // ボーダーラインの色
      ),
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 8,
    ),
    backgroundColor: backgroundColor,
  );
}

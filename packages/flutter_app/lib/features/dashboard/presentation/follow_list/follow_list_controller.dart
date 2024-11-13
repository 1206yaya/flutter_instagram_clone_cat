import "package:flutter_app/features/authentication/application/auth_service.dart";
import "package:flutter_app/features/follow/data/follower_repository.dart";
import "package:flutter_app/features/follow/data/following_repository.dart";
import "package:flutter_app/features/user/domain/user_firestore.dart";
import "package:flutter_app/features/user/domain/user_id_firestore.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "follow_list_controller.g.dart";

@riverpod
class FollowListController extends _$FollowListController {
  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
  }

  bool mounted = true;

  bool isCurrentUser(String userId) =>
      ref.read(authServiceProvider).currentUserIdFirestore == userId;
}

@riverpod
Stream<List<UserFirestore>> followListUsers(
  FollowListUsersRef ref, {
  required UserIdFirestore userId,
  required bool isFollowers,
}) {
  final repository = ref.watch(followerRepositoryProvider);
  final followingRepository = ref.watch(followingRepositoryProvider);
  if (isFollowers) {
    return repository.watchFollowers(userId);
  } else {
    return followingRepository.watchFollowing(userId);
  }
}

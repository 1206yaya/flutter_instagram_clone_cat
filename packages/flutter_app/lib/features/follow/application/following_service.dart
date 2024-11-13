import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/application/auth_service.dart';
import '../../user/domain/user_id_firestore.dart';
import '../data/following_repository.dart';

part 'following_service.g.dart';

class FollowingService {
  FollowingService({
    required this.repository,
    required this.currentUserIdFirestore,
  });

  final FollowingRepository repository;
  final UserIdFirestore currentUserIdFirestore;

  Future<void> followUser(UserIdFirestore targetUserId) async {
    await repository.followUser(
      currentUserId: currentUserIdFirestore,
      targetUserId: targetUserId,
    );
  }

  Future<void> unfollowUser(UserIdFirestore targetUserId) async {
    await repository.unfollowUser(
      currentUserId: currentUserIdFirestore,
      targetUserId: targetUserId,
    );
  }

  Stream<bool> isFollowing(UserIdFirestore targetUserId) {
    return repository.checkFollowingStatus(
      currentUserId: currentUserIdFirestore,
      targetUserId: targetUserId,
    );
  }
}

@riverpod
FollowingService followingService(FollowingServiceRef ref) {
  return FollowingService(
    repository: ref.watch(followingRepositoryProvider),
    currentUserIdFirestore:
        ref.watch(authServiceProvider).currentUserIdFirestore,
  );
}

@riverpod
Stream<bool> isFollowingUser(
  IsFollowingUserRef ref,
  UserIdFirestore targetUid,
) {
  final service = ref.watch(followingServiceProvider);
  return service.isFollowing(targetUid);
}

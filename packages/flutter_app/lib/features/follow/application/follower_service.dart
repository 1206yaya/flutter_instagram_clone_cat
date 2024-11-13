import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/application/auth_service.dart';
import '../../user/domain/user_firestore.dart';
import '../../user/domain/user_id_firestore.dart';
import '../data/follower_repository.dart';

part 'follower_service.g.dart';

class FollowerService {
  FollowerService({
    required this.repository,
    required this.auth,
  });

  final FollowerRepository repository;
  final AuthService auth;

  Stream<List<String>> watchFollowerIds(UserIdFirestore userId) {
    return repository.watchFollowerIds(userId);
  }

  Stream<List<UserFirestore>> watchFollowers(UserIdFirestore userId) {
    return repository.watchFollowers(userId);
  }

  Future<void> removeFollower(UserIdFirestore followerId) async {
    await repository.removeFollower(
      currentUserId: auth.currentUserIdFirestore,
      followerId: followerId,
    );
  }

  Stream<bool> isFollowedBy(UserIdFirestore userId) {
    return repository.checkFollowerStatus(
      currentUserId: auth.currentUserIdFirestore,
      targetUserId: userId,
    );
  }
}

@riverpod
FollowerService followerService(FollowerServiceRef ref) {
  return FollowerService(
    repository: ref.watch(followerRepositoryProvider),
    auth: ref.watch(authServiceProvider),
  );
}

@riverpod
Stream<List<UserFirestore>> userFollowers(
  UserFollowersRef ref,
  UserIdFirestore userId,
) {
  final service = ref.watch(followerServiceProvider);
  return service.watchFollowers(userId);
}

@riverpod
Stream<bool> isFollowedByUser(
  IsFollowedByUserRef ref,
  UserIdFirestore userId,
) {
  final service = ref.watch(followerServiceProvider);
  return service.isFollowedBy(userId);
}

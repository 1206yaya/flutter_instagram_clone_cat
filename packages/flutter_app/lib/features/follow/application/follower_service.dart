import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../authentication/application/auth_service.dart';
import '../../user/domain/user_firestore.dart';
import '../../user/domain/user_id_firestore.dart';
import '../data/follower_repository.dart';
import '../data/following_repository.dart';

part 'follower_service.g.dart';

class FollowerService {
  FollowerService({
    required this.followerRepository,
    required this.followingRepository,
    required this.auth,
    required this.firestore,
  });

  final FollowerRepository followerRepository;
  final FollowingRepository followingRepository;
  final AuthService auth;
  final FirebaseFirestore firestore;

  UserIdFirestore get currentUserIdFirestore => auth.currentUserIdFirestore;

  Stream<List<String>> watchFollowerIds(UserIdFirestore userId) {
    return followerRepository.watchFollowerIds(userId);
  }

  Stream<List<UserFirestore>> watchFollowers(UserIdFirestore userId) {
    return followerRepository.watchFollowers(userId);
  }

  Future<void> removeFollower(UserIdFirestore followerId) async {
    final batch = firestore.batch();

    followerRepository.removeFollowerInBatch(
      currentUserId: currentUserIdFirestore,
      followerId: followerId,
      batch: batch,
    );

    followingRepository.removeFollowingInBatch(
      currentUserId: currentUserIdFirestore,
      followerId: followerId,
      batch: batch,
    );

    await batch.commit();
  }

  // Future<void> removeFollower(UserIdFirestore followerId) async {
  //   await followerRepository.removeFollower(
  //     currentUserId: auth.currentUserIdFirestore,
  //     followerId: followerId,
  //   );
  // }

  Stream<bool> isFollowedBy(UserIdFirestore userId) {
    return followerRepository.checkFollowerStatus(
      currentUserId: currentUserIdFirestore,
      targetUserId: userId,
    );
  }
}

@riverpod
FollowerService followerService(FollowerServiceRef ref) {
  return FollowerService(
    followerRepository: ref.watch(followerRepositoryProvider),
    followingRepository: ref.watch(followingRepositoryProvider),
    auth: ref.watch(authServiceProvider),
    firestore: ref.watch(firebaseFirestoreProvider),
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

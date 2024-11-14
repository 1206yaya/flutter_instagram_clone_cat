import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../authentication/application/auth_service.dart';
import '../../user/domain/user_id_firestore.dart';
import '../data/follower_repository.dart';
import '../data/following_repository.dart';

part 'following_service.g.dart';

class FollowingService {
  FollowingService({
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

  Future<void> followUser(UserIdFirestore targetUserId) async {
    final batch = firestore.batch();
    final timestamp = FieldValue.serverTimestamp();

    followingRepository.followInBatch(
      currentUserId: currentUserIdFirestore,
      targetUserId: targetUserId,
      batch: batch,
      timestamp: timestamp,
    );

    followerRepository.followInBatch(
      currentUserId: currentUserIdFirestore,
      targetUserId: targetUserId,
      batch: batch,
      timestamp: timestamp,
    );

    await batch.commit();
  }

  /// フォローを解除する関数
  Future<void> unfollowUser(UserIdFirestore targetUserId) async {
    final batch = firestore.batch();

    followingRepository.unfollowInBatch(
      currentUserId: currentUserIdFirestore,
      targetUserId: targetUserId,
      batch: batch,
    );

    followerRepository.unfollowInBatch(
      currentUserId: currentUserIdFirestore,
      targetUserId: targetUserId,
      batch: batch,
    );

    await batch.commit();
  }

  Stream<bool> isFollowing(UserIdFirestore targetUserId) {
    return followingRepository.checkFollowingStatus(
      currentUserId: currentUserIdFirestore,
      targetUserId: targetUserId,
    );
  }
}

@riverpod
FollowingService followingService(FollowingServiceRef ref) {
  return FollowingService(
    followerRepository: ref.watch(followerRepositoryProvider),
    followingRepository: ref.watch(followingRepositoryProvider),
    auth: ref.watch(authServiceProvider),
    firestore: ref.watch(firebaseFirestoreProvider),
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

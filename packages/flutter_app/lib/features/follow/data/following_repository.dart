import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../user/domain/user_data.dart';
import '../../user/domain/user_firestore.dart';
import '../../user/domain/user_id_firestore.dart';
import '../domain/follower_firestore.dart';
import '../domain/following_firestore.dart';

part 'following_repository.g.dart';

class FollowingRepository {
  FollowingRepository({
    required this.firestore,
  });

  final FirebaseFirestore firestore;
  Future<List<String>> getFollowingIds(UserIdFirestore userId) async {
    final snapshot = await firestore
        .collection(FollowingFirestore.collectionName)
        .doc(userId.value)
        .collection(FollowingFirestore.subCollectionName)
        .get();

    return snapshot.docs.map((doc) => doc.id).toList();
  }

  Stream<List<UserFirestore>> watchFollowing(UserIdFirestore userId) {
    return firestore
        .collection(FollowingFirestore.collectionName)
        .doc(userId.value)
        .collection(FollowingFirestore.subCollectionName)
        .snapshots()
        .asyncMap((snapshot) async {
      final futures = snapshot.docs.map((doc) async {
        final userDoc = await firestore
            .collection(UserFirestore.collectionName)
            .doc(doc.id)
            .get();
        return UserFirestore.fromDocument(userDoc);
      });
      return Future.wait(futures);
    });
  }

  Future<void> followUser({
    required UserIdFirestore currentUserId,
    required UserIdFirestore targetUserId,
  }) async {
    final timestamp = FieldValue.serverTimestamp();
    final batch = firestore.batch()
      ..set(
        firestore
            .collection(FollowingFirestore.collectionName)
            .doc(currentUserId.value)
            .collection(FollowingFirestore.subCollectionName)
            .doc(targetUserId.value),
        {UserData.createdAtField: timestamp},
      )
      ..set(
        firestore
            .collection(FollowerFirestore.collectionName)
            .doc(targetUserId.value)
            .collection(FollowerFirestore.subCollectionName)
            .doc(currentUserId.value),
        {UserData.createdAtField: timestamp},
      )
      ..update(
        firestore
            .collection(UserFirestore.collectionName)
            .doc(currentUserId.value),
        {UserData.followingCountField: FieldValue.increment(1)},
      )
      ..update(
        firestore
            .collection(UserFirestore.collectionName)
            .doc(targetUserId.value),
        {UserData.followersCountField: FieldValue.increment(1)},
      );
    await batch.commit();
  }

  Future<void> unfollowUser({
    required UserIdFirestore currentUserId,
    required UserIdFirestore targetUserId,
  }) async {
    final batch = firestore.batch()
      ..delete(
        firestore
            .collection(FollowingFirestore.collectionName)
            .doc(currentUserId.value)
            .collection(FollowingFirestore.subCollectionName)
            .doc(targetUserId.value),
      )
      ..delete(
        firestore
            .collection(FollowerFirestore.collectionName)
            .doc(targetUserId.value)
            .collection(FollowerFirestore.subCollectionName)
            .doc(currentUserId.value),
      )
      ..update(
        firestore
            .collection(UserFirestore.collectionName)
            .doc(currentUserId.value),
        {UserData.followingCountField: FieldValue.increment(-1)},
      )
      ..update(
        firestore
            .collection(UserFirestore.collectionName)
            .doc(targetUserId.value),
        {UserData.followersCountField: FieldValue.increment(-1)},
      );
    await batch.commit();
  }

  Stream<bool> checkFollowingStatus({
    required UserIdFirestore currentUserId,
    required UserIdFirestore targetUserId,
  }) {
    return firestore
        .collection(FollowingFirestore.collectionName)
        .doc(currentUserId.value)
        .collection(FollowingFirestore.subCollectionName)
        .doc(targetUserId.value)
        .snapshots()
        .map((snap) => snap.exists);
  }
}

@riverpod
FollowingRepository followingRepository(FollowingRepositoryRef ref) {
  return FollowingRepository(
    firestore: ref.watch(firebaseFirestoreProvider),
  );
}

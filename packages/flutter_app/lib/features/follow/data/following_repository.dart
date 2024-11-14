import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../user/domain/user_data.dart';
import '../../user/domain/user_firestore.dart';
import '../../user/domain/user_id_firestore.dart';
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

  /// フォロワーを削除する関数
  void removeFollowingInBatch({
    required UserIdFirestore currentUserId,
    required UserIdFirestore followerId,
    required WriteBatch batch,
  }) {
    final userRef = firestore
        .collection(UserFirestore.collectionName)
        .doc(followerId.value);

    batch
      ..delete(
        firestore
            .collection(FollowingFirestore.collectionName)
            .doc(followerId.value)
            .collection(FollowingFirestore.subCollectionName)
            .doc(currentUserId.value),
      )
      ..update(
        userRef,
        {UserData.followingCountField: FieldValue.increment(-1)},
      );
  }

  /// フォローを解除する関数
  void unfollowInBatch({
    required UserIdFirestore currentUserId,
    required UserIdFirestore targetUserId,
    required WriteBatch batch,
  }) {
    final currentUserRef = firestore
        .collection(UserFirestore.collectionName)
        .doc(currentUserId.value);

    batch
      ..delete(
        firestore
            .collection(FollowingFirestore.collectionName)
            .doc(currentUserId.value)
            .collection(FollowingFirestore.subCollectionName)
            .doc(targetUserId.value),
      )
      ..update(
        currentUserRef,
        {UserData.followingCountField: FieldValue.increment(-1)},
      );
  }

  void followInBatch({
    required UserIdFirestore currentUserId,
    required UserIdFirestore targetUserId,
    required WriteBatch batch,
    required FieldValue timestamp,
  }) {
    final currentUserRef = firestore
        .collection(UserFirestore.collectionName)
        .doc(currentUserId.value);

    batch
      ..set(
        firestore
            .collection(FollowingFirestore.collectionName)
            .doc(currentUserId.value)
            .collection(FollowingFirestore.subCollectionName)
            .doc(targetUserId.value),
        {UserData.createdAtField: timestamp},
      )
      ..update(
        currentUserRef,
        {UserData.followingCountField: FieldValue.increment(1)},
      );
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

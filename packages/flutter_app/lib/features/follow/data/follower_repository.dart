// lib/features/timeline/data/follower_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../user/domain/user_data.dart';
import '../../user/domain/user_firestore.dart';
import '../../user/domain/user_id_firestore.dart';
import '../domain/follower_firestore.dart';

part 'follower_repository.g.dart';

class FollowerRepository {
  FollowerRepository({
    required this.firestore,
  });

  final FirebaseFirestore firestore;

  Stream<List<String>> watchFollowerIds(UserIdFirestore userId) {
    return firestore
        .collection(FollowerFirestore.collectionName)
        .doc(userId.value)
        .collection(FollowerFirestore.subCollectionName)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.id).toList());
  }

  Stream<List<UserFirestore>> watchFollowers(UserIdFirestore userId) {
    return firestore
        .collection(FollowerFirestore.collectionName)
        .doc(userId.value)
        .collection(FollowerFirestore.subCollectionName)
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

  void followInBatch({
    required UserIdFirestore currentUserId,
    required UserIdFirestore targetUserId,
    required WriteBatch batch,
    required FieldValue timestamp,
  }) {
    final targetUserRef = firestore
        .collection(UserFirestore.collectionName)
        .doc(targetUserId.value);

    batch
      ..set(
        firestore
            .collection(FollowerFirestore.collectionName)
            .doc(targetUserId.value)
            .collection(FollowerFirestore.subCollectionName)
            .doc(currentUserId.value),
        {UserData.createdAtField: timestamp},
      )
      ..update(
        targetUserRef,
        {UserData.followersCountField: FieldValue.increment(1)},
      );
  }

  /// フォロワーを削除する関数
  void removeFollowerInBatch({
    required UserIdFirestore currentUserId,
    required UserIdFirestore followerId,
    required WriteBatch batch,
  }) {
    final userRef = firestore
        .collection(UserFirestore.collectionName)
        .doc(currentUserId.value);

    batch
      ..delete(
        firestore
            .collection(FollowerFirestore.collectionName)
            .doc(currentUserId.value)
            .collection(FollowerFirestore.subCollectionName)
            .doc(followerId.value),
      )
      ..update(
        userRef,
        {UserData.followersCountField: FieldValue.increment(-1)},
      );
  }

  /// フォローを解除する関数
  void unfollowInBatch({
    required UserIdFirestore currentUserId,
    required UserIdFirestore targetUserId,
    required WriteBatch batch,
  }) {
    final targetUserRef = firestore
        .collection(UserFirestore.collectionName)
        .doc(targetUserId.value);

    batch
      ..delete(
        firestore
            .collection(FollowerFirestore.collectionName)
            .doc(targetUserId.value)
            .collection(FollowerFirestore.subCollectionName)
            .doc(currentUserId.value),
      )
      ..update(
        targetUserRef,
        {UserData.followersCountField: FieldValue.increment(-1)},
      );
  }

  Stream<bool> checkFollowerStatus({
    required UserIdFirestore currentUserId,
    required UserIdFirestore targetUserId,
  }) {
    return firestore
        .collection(FollowerFirestore.collectionName)
        .doc(currentUserId.value)
        .collection(FollowerFirestore.subCollectionName)
        .doc(targetUserId.value)
        .snapshots()
        .map((snap) => snap.exists);
  }
}

@riverpod
FollowerRepository followerRepository(FollowerRepositoryRef ref) {
  return FollowerRepository(
    firestore: ref.watch(firebaseFirestoreProvider),
  );
}

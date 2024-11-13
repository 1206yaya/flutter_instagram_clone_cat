// lib/features/timeline/data/follower_repository.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../user/domain/user_data.dart';
import '../../user/domain/user_firestore.dart';
import '../../user/domain/user_id_firestore.dart';
import '../domain/follower_firestore.dart';
import '../domain/following_firestore.dart';

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

  Future<void> removeFollower({
    required UserIdFirestore currentUserId,
    required UserIdFirestore followerId,
  }) async {
    final batch = firestore.batch()
      ..delete(
        firestore
            .collection(FollowerFirestore.collectionName)
            .doc(currentUserId.value)
            .collection(FollowerFirestore.subCollectionName)
            .doc(followerId.value),
      )
      ..delete(
        firestore
            .collection(FollowingFirestore.collectionName)
            .doc(followerId.value)
            .collection(FollowingFirestore.subCollectionName)
            .doc(currentUserId.value),
      )
      ..update(
        firestore
            .collection(UserFirestore.collectionName)
            .doc(currentUserId.value),
        {UserData.followersCountField: FieldValue.increment(-1)},
      )
      ..update(
        firestore
            .collection(UserFirestore.collectionName)
            .doc(followerId.value),
        {UserData.followingCountField: FieldValue.increment(-1)},
      );
    await batch.commit();
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

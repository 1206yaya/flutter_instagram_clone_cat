import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../authentication/application/auth_service.dart';
import '../../post/domain/post_data.dart';
import '../../post/domain/post_firestore.dart';
import '../../post/domain/post_id_firestore.dart';

part 'timeline_post_service.g.dart';

/// Post data that contains like status and count
class PostLikeData {
  const PostLikeData({
    required this.isLiked,
    required this.likesCount,
  });

  final bool isLiked;
  final int likesCount;
}

class TimelinePostService {
  TimelinePostService({
    required this.firestore,
    required this.auth,
  });

  final FirebaseFirestore firestore;
  final AuthService auth;

  /// Get like status and count for a post
  Future<PostLikeData> getPostLikeData(PostIdFirestore postId) async {
    final postRef =
        firestore.collection(PostFirestore.collectionName).doc(postId.value);
    final likeRef = postRef
        .collection(PostFirestore.likesCollectionName)
        .doc(auth.currentUserIdFirestore.value);

    final postDoc = await postRef.get();
    final likeDoc = await likeRef.get();

    if (!postDoc.exists) {
      throw Exception('Post not found');
    }

    return PostLikeData(
      isLiked: likeDoc.exists,
      likesCount: (postDoc.data()?[PostData.likesCountField] as int?) ?? 0,
    );
  }

  Future<void> toggleLike(PostIdFirestore postId) async {
    final postRef =
        firestore.collection(PostFirestore.collectionName).doc(postId.value);
    final likeRef = postRef
        .collection(PostFirestore.likesCollectionName)
        .doc(auth.currentUserIdFirestore.value);

    await firestore.runTransaction((transaction) async {
      final likeDoc = await transaction.get(likeRef);
      final postDoc = await transaction.get(postRef);

      if (!postDoc.exists) {
        throw Exception('Post not found');
      }

      final currentLikesCount =
          (postDoc.data()?[PostData.likesCountField] as int?) ?? 0;

      if (likeDoc.exists) {
        // Unlike: Delete like document and decrement count
        transaction
          ..delete(likeRef)
          ..update(postRef, {
            PostData.likesCountField: currentLikesCount - 1,
          });
      } else {
        // Like: Create like document and increment count
        transaction
          ..set(likeRef, {
            PostData.createdAtField: FieldValue.serverTimestamp(),
          })
          ..update(postRef, {
            PostData.likesCountField: currentLikesCount + 1,
          });
      }
    });
  }

  Future<int> getCommentCount(PostIdFirestore postId) async {
    final docSnapshot = await firestore
        .collection(PostFirestore.collectionName)
        .doc(postId.value)
        .collection(PostFirestore.commentsCollectionName)
        .count()
        .get();
    return docSnapshot.count ?? 0;
  }
}

@riverpod
TimelinePostService timelinePostService(TimelinePostServiceRef ref) {
  return TimelinePostService(
    firestore: ref.watch(firebaseFirestoreProvider),
    auth: ref.watch(authServiceProvider),
  );
}

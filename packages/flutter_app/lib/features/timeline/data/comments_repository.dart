import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/errors/comments_exception.dart';
import '../../../utils/firebase/firebase_service.dart';
import '../../post/domain/post_data.dart';
import '../../post/domain/post_firestore.dart';
import '../../post/domain/post_id_firestore.dart';
import '../../user/domain/user_id_firestore.dart';
import '../domain/comment_data.dart';
import '../domain/comment_firestore.dart';
import '../domain/comment_id_firestore.dart';

part 'comments_repository.g.dart';

class CommentsRepository {
  CommentsRepository({
    required this.firestore,
  });

  final FirebaseFirestore firestore;
  CollectionReference<CommentFirestore> _commentsRef(PostIdFirestore postId) {
    return firestore
        .collection(PostFirestore.collectionName)
        .doc(postId.value)
        .collection(PostFirestore.commentsCollectionName)
        .withConverter<CommentFirestore>(
          fromFirestore: (snapshot, _) => CommentFirestore.fromDb(snapshot),
          toFirestore: (comment, _) => comment.toDocument(),
        );
  }

  DocumentReference<CommentFirestore> _commentRef(
    PostIdFirestore postId,
    CommentIdFirestore? commentId,
  ) {
    return firestore
        .collection(PostFirestore.collectionName)
        .doc(postId.value)
        .collection(PostFirestore.commentsCollectionName)
        .doc(commentId?.value)
        .withConverter<CommentFirestore>(
          fromFirestore: (snapshot, _) => CommentFirestore.fromDb(snapshot),
          toFirestore: (comment, _) => comment.toDocument(),
        );
  }

  @override
  Future<void> addComment({
    required PostIdFirestore postId,
    required CommentData commentData,
  }) async {
    try {
      await firestore.runTransaction((transaction) async {
        // 1. Get a new document reference with auto-generated ID
        final commentRef = _commentRef(postId, null);
        final commentId = CommentIdFirestore(value: commentRef.id);

        // 2. Create CommentFirestore instance
        final comment = CommentFirestore(
          id: commentId,
          data: commentData,
        );

        // 3. Add the comment using transaction
        transaction.set(
          commentRef,
          comment,
          SetOptions(merge: true),
        );

        // 4. Increment the post's comment count
        final postRef = firestore
            .collection(PostFirestore.collectionName)
            .doc(postId.value);

        transaction.update(postRef, {
          PostData.commentsCountField: FieldValue.increment(1),
        });
      });
    } catch (e) {
      throw CommentsException('Failed to add comment: $e');
    }
  }

  Future<void> toggleCommentLike({
    required PostIdFirestore postId,
    required CommentIdFirestore commentId,
    required UserIdFirestore userId,
    required bool isLiked,
  }) async {
    try {
      final commentRef = _commentRef(postId, commentId);
      await commentRef.update({
        CommentData.likedUserIdsField: isLiked
            ? FieldValue.arrayRemove([userId.value])
            : FieldValue.arrayUnion([userId.value]),
      });
    } catch (e) {
      throw CommentsException('Failed to toggle like: $e');
    }
  }

  /// Watch comments for a given post
  @override
  Stream<List<CommentFirestore>> watchComments(PostIdFirestore postId) {
    return _commentsRef(postId)
        .orderBy(CommentData.createdAtField, descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }
}

@riverpod
CommentsRepository commentsRepository(CommentsRepositoryRef ref) {
  return CommentsRepository(
    firestore: ref.read(firebaseFirestoreProvider),
  );
}

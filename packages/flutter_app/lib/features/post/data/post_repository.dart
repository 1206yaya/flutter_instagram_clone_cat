import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../user/domain/user_id_firestore.dart';
import '../domain/post_data.dart';
import '../domain/post_firestore.dart';
import '../domain/post_id_firestore.dart';

part 'post_repository.g.dart';

@immutable
class PostLikeData {
  const PostLikeData({
    required this.isLiked,
    required this.likesCount,
  });

  final bool isLiked;
  final int likesCount;

  @override
  bool operator ==(Object other) {
    return other is PostLikeData &&
        other.isLiked == isLiked &&
        other.likesCount == likesCount;
  }

  @override
  int get hashCode => Object.hash(isLiked, likesCount);
}

class PostRepository {
  PostRepository({
    required this.firestore,
  }) : _collectionRef = firestore.collection(PostFirestore.collectionName);

  final CollectionReference _collectionRef;
  final FirebaseFirestore firestore;

  /// Create a new post
  Future<PostIdFirestore> addPost(PostData postData) async {
    final reference = await _collectionRef.add(postData.toDocument());
    return PostIdFirestore(value: reference.id);
  }

  Future<PostIdFirestore> addPostInTransaction(
    Transaction transaction,
    PostData postData,
  ) {
    final postRef = _collectionRef.doc();
    final postId = PostIdFirestore(value: postRef.id);

    transaction.set(postRef, postData.toDocument());

    return Future.value(postId);
  }

  /// Get a single post by ID
  Future<PostFirestore?> fetchByPostId(PostIdFirestore postId) async {
    final docSnap = await _collectionRef.doc(postId.value).get();
    if (!docSnap.exists) return null;
    return PostFirestore.fromDb(docSnap);
  }

  /// Update an existing post
  Future<void> updatePost(PostFirestore post) async {
    await _collectionRef.doc(post.id.value).update(post.data.toDocument());
  }

  /// Delete a post
  Future<void> deletePost(PostIdFirestore postId) async {
    await _collectionRef.doc(postId.value).delete();
  }

  /// Get posts by user ID
  Stream<List<PostFirestore>> watchUserPosts(UserIdFirestore userId) {
    return _collectionRef
        .where(PostData.ownerIdField, isEqualTo: userId.value)
        .orderBy(PostData.createdAtField, descending: true)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map(PostFirestore.fromDb).toList(),
        );
  }

  /// Get trending posts
  Stream<List<PostFirestore>> watchTrendingPosts({int? limit}) {
    var query = _collectionRef
        .orderBy(PostData.likesCountField, descending: true)
        .orderBy(PostData.createdAtField, descending: true);

    if (limit != null) {
      query = query.limit(limit);
    }

    return query.snapshots().map(
          (snapshot) => snapshot.docs.map(PostFirestore.fromDb).toList(),
        );
  }

  Future<void> togglePostLike({
    required PostIdFirestore postId,
    required UserIdFirestore userId,
  }) async {
    final postRef = _collectionRef.doc(postId.value);
    final likeRef =
        postRef.collection(PostFirestore.likesCollectionName).doc(userId.value);

    await firestore.runTransaction((transaction) async {
      final postDoc = await transaction.get(postRef);
      final likeDoc = await transaction.get(likeRef);

      if (!postDoc.exists) {
        throw Exception('Post not found');
      }

      final postData = PostData.fromDocument(postDoc);
      final currentLikesCount = postData.likesCount;
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

  /// Get like status and count for a post
  Future<PostLikeData> getPostLikeData({
    required PostIdFirestore postId,
    required UserIdFirestore userId,
  }) async {
    final postRef = _collectionRef.doc(postId.value);
    final likeRef =
        postRef.collection(PostFirestore.likesCollectionName).doc(userId.value);

    final postDoc = await postRef.get();
    final likeDoc = await likeRef.get();

    if (!postDoc.exists) {
      throw Exception('Post not found');
    }

    final postData = PostData.fromDocument(postDoc);

    return PostLikeData(
      isLiked: likeDoc.exists,
      likesCount: postData.likesCount,
    );
  }

  /// Check if a post exists
  Future<bool> doesPostExist(String postId) async {
    final docSnap = await _collectionRef.doc(postId).get();
    return docSnap.exists;
  }
}

@Riverpod(keepAlive: true)
PostRepository postRepository(PostRepositoryRef ref) {
  return PostRepository(
    firestore: ref.watch(firebaseFirestoreProvider),
  );
}

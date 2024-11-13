import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../user/domain/user_id_firestore.dart';
import '../domain/post_data.dart';
import '../domain/post_firestore.dart';
import '../domain/post_id_firestore.dart';

part 'post_repository.g.dart';

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

// Helper class to generate mock post data for testing
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/features/post/domain/post_data.dart';
import 'package:flutter_app/features/post/domain/post_firestore.dart';
import 'package:flutter_app/features/post/domain/post_id_firestore.dart';
import 'package:flutter_app/features/user/domain/user_id_firestore.dart';

class MockPostGenerator {
  int _postId = 0;

  PostData createPostData({
    required UserIdFirestore ownerId,
    String? description,
    String? location,
    String? mediaUrl,
    String? mediaType,
    String? profilePic,
    int? likesCount,
    String? authorName,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    _postId++;
    return PostData(
      ownerId: ownerId,
      description: description ?? 'Test description $_postId',
      location: location ?? 'Test location $_postId',
      mediaUrl: mediaUrl ?? 'https://example.com/test$_postId.jpg',
      mediaType: mediaType ?? 'image',
      profilePic: profilePic ?? '',
      likesCount: likesCount ?? 0,
      authorName: authorName ?? 'Test User $_postId',
      createdAt: createdAt ?? DateTime(2024, 1, _postId),
      updatedAt: updatedAt,
    );
  }

  PostFirestore createPost({
    String? id,
    PostData? data,
    required UserIdFirestore ownerId,
  }) {
    return PostFirestore(
      id: PostIdFirestore(value: id ?? 'post_$_postId'),
      data: data ?? createPostData(ownerId: ownerId),
    );
  }

  List<PostFirestore> createPosts({
    required int count,
    required UserIdFirestore ownerId,
  }) {
    return List.generate(
      count,
      (index) => createPost(ownerId: ownerId),
    );
  }
}

// Test Utilities
Future<void> setPostFirestore(
  FirebaseFirestore firestore,
  PostFirestore post,
) async {
  await firestore
      .collection(PostFirestore.collectionName)
      .doc(post.id.value)
      .set(post.data.toDocument());
}

Future<void> setPostsFirestore(
  FirebaseFirestore firestore,
  List<PostFirestore> posts,
) async {
  for (final post in posts) {
    await setPostFirestore(firestore, post);
  }
}

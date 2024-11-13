import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/features/post/data/post_repository.dart';
import 'package:flutter_app/features/post/domain/post_data.dart';
import 'package:flutter_app/features/post/domain/post_firestore.dart';
import 'package:flutter_app/features/post/domain/post_id_firestore.dart';
import 'package:flutter_app/features/user/domain/user_id_firestore.dart';
import 'package:mockito/mockito.dart';

import '../data/firestore_post.dart';

class MockPostRepository extends Mock implements PostRepository {
  @override
  Future<PostIdFirestore> addPost(PostData postData) {
    return super.noSuchMethod(
      Invocation.method(#addPost, [postData]),
      returnValue: Future.value(const PostIdFirestore(value: 'mock_post_id')),
    ) as Future<PostIdFirestore>;
  }

  @override
  Future<PostIdFirestore> addPostInTransaction(
    Transaction transaction,
    PostData postData,
  ) {
    return super.noSuchMethod(
      Invocation.method(#addPostInTransaction, [transaction, postData]),
      returnValue: Future.value(const PostIdFirestore(value: 'mock_post_id')),
    ) as Future<PostIdFirestore>;
  }

  @override
  Future<PostFirestore> fetchByPostId(PostIdFirestore postId) {
    return super.noSuchMethod(
      Invocation.method(#fetchByPostId, [postId]),
      returnValue: Future.value(testingPostFirestore),
      returnValueForMissingStub: Future.value(testingPostFirestore),
    ) as Future<PostFirestore>;
  }

  @override
  Future<void> updatePost(PostFirestore post) {
    return super.noSuchMethod(
      Invocation.method(#updatePost, [post]),
      returnValue: Future.value(),
    ) as Future<void>;
  }

  @override
  Future<void> deletePost(PostIdFirestore postId) {
    return super.noSuchMethod(
      Invocation.method(#deletePost, [postId]),
      returnValue: Future.value(),
    ) as Future<void>;
  }

  @override
  Stream<List<PostFirestore>> watchUserPosts(UserIdFirestore userId) {
    return super.noSuchMethod(
      Invocation.method(#watchUserPosts, [userId]),
      returnValue: Stream<List<PostFirestore>>.value([]),
    ) as Stream<List<PostFirestore>>;
  }

  @override
  Stream<List<PostFirestore>> watchTrendingPosts({int? limit}) {
    return super.noSuchMethod(
      Invocation.method(#watchTrendingPosts, [], {#limit: limit}),
      returnValue: Stream<List<PostFirestore>>.value([]),
    ) as Stream<List<PostFirestore>>;
  }

  @override
  Future<bool> doesPostExist(String postId) {
    return super.noSuchMethod(
      Invocation.method(#doesPostExist, [postId]),
      returnValue: Future.value(false),
    ) as Future<bool>;
  }
}

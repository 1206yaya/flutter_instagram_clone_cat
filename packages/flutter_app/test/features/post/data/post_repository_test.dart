import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_app/features/post/data/post_repository.dart';
import 'package:flutter_app/features/post/domain/post_firestore.dart';
import 'package:flutter_app/features/post/domain/post_id_firestore.dart';
import 'package:flutter_app/features/user/domain/user_id_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/data/mock_data_setup.dart';

void main() {
  group('PostRepository Tests', () {
    late FakeFirebaseFirestore fakeFirestore;
    late PostRepository postRepository;
    late MockPostGenerator mockPostGenerator;
    late UserIdFirestore testUserId;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      postRepository = PostRepository(firestore: fakeFirestore);
      mockPostGenerator = MockPostGenerator();
      testUserId = const UserIdFirestore(value: 'test_user_id');
    });

    test('addPost - 新規投稿が正常に作成されることを確認', () async {
      final postData = mockPostGenerator.createPostData(ownerId: testUserId);
      final postId = await postRepository.addPost(postData);

      expect(postId, isNotNull);

      final docSnapshot = await fakeFirestore
          .collection(PostFirestore.collectionName)
          .doc(postId.value)
          .get();

      expect(docSnapshot.exists, true);

      final savedPost = PostFirestore.fromDb(docSnapshot);
      expect(savedPost.data.description, postData.description);
      expect(savedPost.data.ownerId, postData.ownerId);
      expect(savedPost.data.mediaUrl, postData.mediaUrl);
    });

    test('fetchByPostId - 存在しない投稿の取得時にnullが返されることを確認', () async {
      final result = await postRepository.fetchByPostId(
        const PostIdFirestore(value: 'non_existent'),
      );
      expect(result, isNull);
    });

    test('fetchByPostId - 存在する投稿が正常に取得できることを確認', () async {
      final post = mockPostGenerator.createPost(ownerId: testUserId);
      await setPostFirestore(fakeFirestore, post);

      final result = await postRepository.fetchByPostId(post.id);
      expect(result, isNotNull);
      expect(result?.id, post.id);
      expect(result?.data.description, post.data.description);
      expect(result?.data.mediaUrl, post.data.mediaUrl);
    });

    test('updatePost - 既存の投稿が正常に更新されることを確認', () async {
      final post = mockPostGenerator.createPost(ownerId: testUserId);
      await setPostFirestore(fakeFirestore, post);

      final updatedData = mockPostGenerator.createPostData(
        ownerId: testUserId,
        description: '更新後の説明文',
      );
      final updatedPost = PostFirestore(id: post.id, data: updatedData);

      await postRepository.updatePost(updatedPost);

      final result = await postRepository.fetchByPostId(post.id);
      expect(result?.data.description, equals('更新後の説明文'));
    });

    test('deletePost - 投稿が正常に削除されることを確認', () async {
      final post = mockPostGenerator.createPost(ownerId: testUserId);
      await setPostFirestore(fakeFirestore, post);

      await postRepository.deletePost(post.id);

      final result = await postRepository.fetchByPostId(post.id);
      expect(result, isNull);
    });

    test('watchUserPosts - ユーザーの投稿が作成時間順にストリーミングされることを確認', () async {
      final posts = mockPostGenerator.createPosts(
        count: 3,
        ownerId: testUserId,
      );
      await setPostsFirestore(fakeFirestore, posts);

      final stream = postRepository.watchUserPosts(testUserId);

      final result = await stream.first;
      expect(result.length, equals(3));
      expect(
        result,
        everyElement(
          predicate<PostFirestore>(
            (p) => p.data.ownerId == testUserId,
          ),
        ),
      );

      // 並び順の検証
      for (var i = 0; i < result.length - 1; i++) {
        expect(
          result[i].data.createdAt.isAfter(result[i + 1].data.createdAt),
          isTrue,
        );
      }
    });

    test('watchTrendingPosts - いいね数順に投稿がストリーミングされることを確認', () async {
      final posts = [
        mockPostGenerator.createPost(
          ownerId: testUserId,
          data: mockPostGenerator.createPostData(
            ownerId: testUserId,
            likesCount: 10,
          ),
        ),
        mockPostGenerator.createPost(
          ownerId: testUserId,
          data: mockPostGenerator.createPostData(
            ownerId: testUserId,
            likesCount: 5,
          ),
        ),
        mockPostGenerator.createPost(
          ownerId: testUserId,
          data: mockPostGenerator.createPostData(
            ownerId: testUserId,
            likesCount: 15,
          ),
        ),
      ];

      await setPostsFirestore(fakeFirestore, posts);

      final stream = postRepository.watchTrendingPosts(limit: 2);
      final result = await stream.first;

      expect(result.length, equals(2));
      expect(result[0].data.likesCount, equals(15));
      expect(result[1].data.likesCount, equals(10));
    });

    test('doesPostExist - 投稿の存在確認が正しく動作することを確認', () async {
      final post = mockPostGenerator.createPost(ownerId: testUserId);
      await setPostFirestore(fakeFirestore, post);

      final exists = await postRepository.doesPostExist(post.id.value);
      expect(exists, isTrue);

      final notExists = await postRepository.doesPostExist('non_existent');
      expect(notExists, isFalse);
    });
  });
}

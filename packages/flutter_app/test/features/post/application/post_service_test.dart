import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_app/features/post/application/post_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/data/firestore_post.dart';
import '../../../mocks/data/firestore_user.dart';
import '../../../mocks/providers/mock_uuid.dart';
import '../../../mocks/repositories/mock_post_repository.dart';
import '../../../mocks/repositories/mock_user_repository.dart';
import '../../../mocks/services/mock_auth_service.dart';
import '../../../mocks/services/mock_storage_service.dart';

void main() {
  late MockPostRepository mockPostRepository;
  late MockUserRepository mockUserRepository;
  late MockStorageService mockStorageService;
  late FakeFirebaseFirestore fakeFirestore;
  late MockAuthService mockAuthService;

  late PostService postService;
  late MockUuid mockUuid;

  setUp(() {
    mockUuid = MockUuid('mock-uuid');
    mockAuthService = MockAuthService();
    fakeFirestore = FakeFirebaseFirestore();
    mockPostRepository = MockPostRepository();
    mockUserRepository = MockUserRepository();
    mockStorageService = MockStorageService();

    postService = PostService(
      authService: mockAuthService,
      postRepository: mockPostRepository,
      userRepository: mockUserRepository,
      storageService: mockStorageService,
      firestore: fakeFirestore,
      uuid: mockUuid,
    );
  });

  group('PostService Tests', () {
    test('watchUserPosts returns correct stream', () async {
      final expectedPosts = [testingPostFirestore];
      when(mockPostRepository.watchUserPosts(testingUserFirestoreId))
          .thenAnswer((_) => Stream.value(expectedPosts));

      // final postService = container.read(postServiceProvider);
      final stream = postService.watchUserPosts(testingUserFirestoreId);

      expect(await stream.first, expectedPosts);
      verify(mockPostRepository.watchUserPosts(testingUserFirestoreId))
          .called(1);
    });

    test('fetchPostById returns correct post', () async {
      when(mockPostRepository.fetchByPostId(testingPostFirestoreId))
          .thenAnswer((_) async => testingPostFirestore);

      // final postService = container.read(postServiceProvider);
      final post = await postService.fetchPostById(testingPostFirestoreId);

      expect(post, testingPostFirestore);
      verify(mockPostRepository.fetchByPostId(testingPostFirestoreId))
          .called(1);
    });

    test('updatePost calls repository correctly', () async {
      when(mockPostRepository.updatePost(testingPostFirestore))
          .thenAnswer((_) async => {});

      // final postService = container.read(postServiceProvider);
      await postService.updatePost(testingPostFirestore);

      verify(mockPostRepository.updatePost(testingPostFirestore)).called(1);
    });

    test('watchTrendingPosts returns correct stream', () async {
      final expectedPosts = [testingPostFirestore];
      when(mockPostRepository.watchTrendingPosts())
          .thenAnswer((_) => Stream.value(expectedPosts));

      // final postService = container.read(postServiceProvider);
      final stream = postService.watchTrendingPosts();

      expect(await stream.first, expectedPosts);
      verify(mockPostRepository.watchTrendingPosts()).called(1);
    });
  });
}

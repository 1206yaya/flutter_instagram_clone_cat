import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../../utils/providers/uuid_provider.dart';
import '../../../utils/storage/storage_file_name.dart';
import '../../authentication/application/auth_service.dart';
import '../../storage/application/storage_service.dart';
import '../../user/data/user_repository.dart';
import '../../user/domain/user_id_firestore.dart';
import '../data/post_repository.dart';
import '../domain/post_data.dart';
import '../domain/post_firestore.dart';
import '../domain/post_id_firestore.dart';

part 'post_service.g.dart';

class PostService {
  const PostService({
    required this.authService,
    required this.postRepository,
    required this.userRepository,
    required this.storageService,
    required this.uuid,
    required this.firestore,
  });

  final AuthService authService;
  final PostRepository postRepository;
  final UserRepository userRepository;
  final StorageService storageService;
  final FirebaseFirestore firestore;
  final Uuid uuid;

  Future<void> createPost({
    required File mediaFile,
    required String description,
    required String location,
    String mediaType = 'image',
  }) async {
    // Upload media file first
    final userIdFirestore = authService.currentUserIdFirestore;
    final uploadPath =
        'posts/${userIdFirestore.value}/${StorageFileName.generate(uuid: uuid)}';
    final mediaURL = await storageService.uploadFile(
      uploadPath: uploadPath,
      file: mediaFile,
    );

    // Get user data
    final userFirestore = await userRepository.findByUid(userIdFirestore);
    final userData = userFirestore.data;

    // Create post data
    final post = PostData.create(
      ownerId: userIdFirestore,
      mediaUrl: mediaURL,
      authorName: userData.displayName,
      profilePic: userData.photoUrl,
      description: description,
      location: location,
      mediaType: mediaType,
    );

    // Use transaction through repositories
    await firestore.runTransaction((transaction) async {
      await postRepository.addPostInTransaction(transaction, post);
      await userRepository.incrementPostCountInTransaction(
        transaction,
        userIdFirestore,
      );
    });
  }

  Stream<List<PostFirestore>> watchUserPosts(UserIdFirestore userId) {
    return postRepository.watchUserPosts(userId);
  }

  Future<PostFirestore?> fetchPostById(PostIdFirestore postId) async {
    return postRepository.fetchByPostId(postId);
  }

  Future<void> updatePost(PostFirestore post) async {
    await postRepository.updatePost(post);
  }

  Stream<List<PostFirestore>> watchTrendingPosts({int? limit}) {
    return postRepository.watchTrendingPosts(limit: limit);
  }
}

@riverpod
PostService postService(PostServiceRef ref) {
  return PostService(
    authService: ref.watch(authServiceProvider),
    postRepository: ref.watch(postRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
    storageService: ref.watch(storageServiceProvider),
    firestore: ref.watch(firebaseFirestoreProvider),
    uuid: ref.watch(uuidProvider),
  );
}

@riverpod
Stream<List<PostFirestore>> postsStream(
  PostsStreamRef ref,
  UserIdFirestore userId,
) {
  final service = ref.watch(postServiceProvider);
  return service.watchUserPosts(userId);
}

@riverpod
Stream<List<PostFirestore>> trendingPostsStream(TrendingPostsStreamRef ref) {
  final service = ref.watch(postServiceProvider);
  return service.watchTrendingPosts();
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../authentication/application/auth_service.dart';
import '../../post/data/post_repository.dart';
import '../../post/domain/post_firestore.dart';
import '../../post/domain/post_id_firestore.dart';
import '../../user/domain/user_id_firestore.dart';

part 'timeline_post_service.g.dart';

class TimelinePostService {
  TimelinePostService({
    required this.firestore,
    required this.auth,
    required this.postRepository,
  });

  final FirebaseFirestore firestore;
  final AuthService auth;
  final PostRepository postRepository;

  UserIdFirestore get currentUserId => auth.currentUserIdFirestore;

  /// Get like status and count for a post
  Future<PostLikeData> getPostLikeData(PostIdFirestore postId) async {
    return postRepository.getPostLikeData(
      postId: postId,
      userId: auth.currentUserIdFirestore,
    );
  }

  Future<void> toggleLike(PostIdFirestore postId) async {
    await postRepository.togglePostLike(
      postId: postId,
      userId: currentUserId,
    );
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
    postRepository: ref.watch(postRepositoryProvider),
  );
}

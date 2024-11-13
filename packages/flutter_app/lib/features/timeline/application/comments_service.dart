import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/application/auth_service.dart';
import '../../post/domain/post_id_firestore.dart';
import '../../user/data/user_repository.dart';
import '../data/comments_repository.dart';
import '../domain/comment_data.dart';
import '../domain/comment_firestore.dart';
import '../domain/comment_id_firestore.dart';

part 'comments_service.g.dart';

class CommentsService {
  const CommentsService({
    required this.auth,
    required this.commentsRepository,
    required this.userRepository,
  });

  final AuthService auth;
  final CommentsRepository commentsRepository;
  final UserRepository userRepository;

  /// Add a new comment to a post
  /// Add a new comment to a post
  Future<void> addComment({
    required PostIdFirestore postId,
    required String commentText,
  }) async {
    try {
      // 1. Get user profile
      final profile =
          await userRepository.findByUid(auth.currentUserIdFirestore);

      // 2. Create comment data
      final commentData = CommentData.create(
        userId: auth.currentUserIdFirestore,
        name: profile.data.displayName,
        profilePic: profile.data.photoUrl,
        comment: commentText,
      );

      // 3. Add comment through repository
      await commentsRepository.addComment(
        postId: postId,
        commentData: commentData,
      );
    } catch (e) {
      throw Exception('Failed to add comment: $e');
    }
  }

  /// Toggle like on a comment
  Future<void> toggleCommentLike({
    required PostIdFirestore postId,
    required CommentIdFirestore commentId,
    required bool isLiked,
  }) async {
    await commentsRepository.toggleCommentLike(
      postId: postId,
      commentId: commentId,
      userId: auth.currentUserIdFirestore,
      isLiked: isLiked,
    );
  }

  /// Watch comments for a post
  Stream<List<CommentFirestore>> watchComments(PostIdFirestore postId) {
    return commentsRepository.watchComments(postId);
  }
}

@riverpod
CommentsService commentsService(CommentsServiceRef ref) {
  return CommentsService(
    auth: ref.watch(authServiceProvider),
    commentsRepository: ref.watch(commentsRepositoryProvider),
    userRepository: ref.watch(userRepositoryProvider),
  );
}

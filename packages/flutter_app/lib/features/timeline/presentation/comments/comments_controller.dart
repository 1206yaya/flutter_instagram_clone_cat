import "package:flutter_app/features/post/domain/post_id_firestore.dart";
import "package:flutter_app/features/timeline/application/comments_service.dart";
import "package:flutter_app/features/timeline/domain/comment_firestore.dart";
import "package:flutter_app/features/timeline/domain/comment_id_firestore.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "comments_controller.g.dart";

@riverpod
class CommentsController extends _$CommentsController {
  @override
  Stream<List<CommentFirestore>> build(PostIdFirestore postId) {
    return ref.watch(commentsServiceProvider).watchComments(postId);
  }

  Future<void> addComment(String commentText) {
    return ref
        .read(commentsServiceProvider)
        .addComment(postId: postId, commentText: commentText);
  }

  Future<void> toggleCommentLike({
    required CommentIdFirestore commentId,
    required bool isLiked,
  }) async {
    await ref.read(commentsServiceProvider).toggleCommentLike(
          postId: postId,
          commentId: commentId,
          isLiked: isLiked,
        );
  }
}

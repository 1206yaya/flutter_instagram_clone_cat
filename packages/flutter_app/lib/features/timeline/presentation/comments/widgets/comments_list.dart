import "package:flutter/material.dart";
import "package:flutter_app/features/post/domain/post_id_firestore.dart";
import "package:flutter_app/features/timeline/domain/comment_firestore.dart";
import "package:flutter_app/features/timeline/presentation/comments/comments_controller.dart";
import "package:flutter_app/features/timeline/presentation/comments/widgets/comment_card.dart";
import "package:flutter_app/widgets/async_value_widget.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class CommentsList extends ConsumerWidget {
  const CommentsList({super.key, required this.postId});

  final PostIdFirestore postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsAsync = ref.watch(commentsControllerProvider(postId));

    return AsyncValueWidget<List<CommentFirestore>>(
      value: commentsAsync,
      data: (comments) {
        if (comments.isEmpty) {
          return const Center(child: Text("No comments yet"));
        }
        return ListView.builder(
          itemCount: comments.length,
          itemBuilder: (context, index) {
            return CommentCard(
              comment: comments[index],
              postId: postId,
            );
          },
        );
      },
    );
  }
}

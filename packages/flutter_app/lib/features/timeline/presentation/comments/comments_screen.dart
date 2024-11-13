import "package:flutter/material.dart";
import "package:flutter_app/features/post/domain/post_id_firestore.dart";
import "package:flutter_app/features/timeline/presentation/comments/widgets/comment_input.dart";
import "package:flutter_app/features/timeline/presentation/comments/widgets/comments_list.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class CommentsScreen extends ConsumerWidget {
  const CommentsScreen({super.key, required this.postId});

  final PostIdFirestore postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comments")),
      body: Column(
        children: [
          Expanded(
            child: CommentsList(postId: postId),
          ),
          CommentInput(postId: postId),
        ],
      ),
    );
  }
}


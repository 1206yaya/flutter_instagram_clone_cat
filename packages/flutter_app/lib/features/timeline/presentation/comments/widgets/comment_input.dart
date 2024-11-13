import "package:flutter/material.dart";
import "package:flutter_app/features/post/domain/post_id_firestore.dart";
import "package:flutter_app/features/timeline/domain/comment_firestore.dart";
import "package:flutter_app/features/timeline/presentation/comments/comments_controller.dart";
import "package:flutter_app/utils/extension/async_value_ui.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class CommentInput extends ConsumerStatefulWidget {
  const CommentInput({super.key, required this.postId});

  final PostIdFirestore postId;

  @override
  ConsumerState<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends ConsumerState<CommentInput> {
  final _commentText = TextEditingController();

  @override
  void dispose() {
    _commentText.dispose();
    super.dispose();
  }

  Future<void> _addComment() async {
    final text = _commentText.text.trim();
    if (text.isNotEmpty) {
      await ref
          .read(commentsControllerProvider(widget.postId).notifier)
          .addComment(text);
      _commentText.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(commentsControllerProvider(widget.postId));

    ref.listen<AsyncValue<List<CommentFirestore>>>(
      commentsControllerProvider(widget.postId),
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _commentText,
              decoration: const InputDecoration(labelText: "Add a comment..."),
              enabled: !state.isLoading,
            ),
          ),
          IconButton(
            icon: state.isLoading
                ? const CircularProgressIndicator()
                : const Icon(Icons.send),
            onPressed: state.isLoading ? null : _addComment,
          ),
        ],
      ),
    );
  }
}

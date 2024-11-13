import "package:flutter/material.dart";
import "package:flutter_app/features/post/domain/post_firestore.dart";
import "package:flutter_app/features/timeline/application/timeline_post_service.dart";
import "package:flutter_app/features/timeline/presentation/post/post_card/post_card_controller.dart";
import "package:flutter_app/features/timeline/presentation/post/widgets/like_button.dart";
import "package:flutter_app/widgets/async_value_widget.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class PostActions extends ConsumerWidget {
  const PostActions({
    super.key,
    required this.post,
    required this.onCommentsTap,
    required this.likeState,
  });

  final PostFirestore post;
  final VoidCallback onCommentsTap;
  final AsyncValue<PostLikeData> likeState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<PostLikeData>(
      value: likeState,
      data: (data) => Row(
        children: [
          LikeButton(
            isLiked: data.isLiked,
            likesCount: data.likesCount,
            onPressed: () async {
              await ref
                  .read(postCardControllerProvider(post.id).notifier)
                  .toggleLike();
            },
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.comment),
            onPressed: onCommentsTap,
          ),
        ],
      ),
    );
  }
}

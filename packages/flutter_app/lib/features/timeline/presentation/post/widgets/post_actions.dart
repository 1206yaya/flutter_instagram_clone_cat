import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../widgets/async_value_widget.dart';
import '../../../../post/data/post_repository.dart';
import '../../../../post/domain/post_firestore.dart';
import '../post_card/post_card_controller.dart';
import 'like_button.dart';

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

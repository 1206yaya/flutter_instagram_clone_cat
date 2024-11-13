import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../authentication/application/auth_service.dart';
import '../../../../post/domain/post_id_firestore.dart';
import '../../../domain/comment_firestore.dart';
import '../comments_controller.dart';

class CommentCard extends ConsumerWidget {
  const CommentCard({
    super.key,
    required this.comment,
    required this.postId,
  });

  final CommentFirestore comment;
  final PostIdFirestore postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(authServiceProvider).currentUserIdFirestore;
    final isLiked = comment.data.likedUserIds.contains(currentUser);
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(comment.data.profilePic),
      ),
      title: Row(
        children: [
          Text(
            comment.data.name,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 5),
          Text(
            timeago.format(comment.data.createdAt),
            style: const TextStyle(fontSize: 11),
          ),
        ],
      ),
      subtitle: Text(comment.data.comment),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border),
            onPressed: () => ref
                .read(commentsControllerProvider(postId).notifier)
                .toggleCommentLike(
                  commentId: comment.id,
                  isLiked: isLiked,
                ),
            color: isLiked ? Colors.red : Theme.of(context).iconTheme.color,
          ),
          Text('${comment.data.likedUserIds.length}'),
        ],
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:flutter_app/features/post/domain/post_firestore.dart";
import "package:flutter_app/features/timeline/presentation/post/post_menu/post_menu_button.dart";
import "package:flutter_app/widgets/profile_avatar.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";
import "package:timeago/timeago.dart" as timeago;

class PostHeader extends ConsumerWidget {
  const PostHeader({
    super.key,
    required this.post,
    required this.onProfileTap,
  });

  final PostFirestore post;
  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: ProfileAvatar(
        imageUrl: post.data.profilePic,
        onTap: onProfileTap,
      ),
      title: Row(
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: Text(post.data.authorName),
          ),
          const SizedBox(width: 5),
          Text(
            post.data.location,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
      subtitle: Text(
        timeago.format(post.data.createdAt),
      ),
      trailing: PostMenuButton(post: post),
    );
  }
}

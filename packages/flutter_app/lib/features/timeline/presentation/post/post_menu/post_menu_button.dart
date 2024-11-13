import "package:flutter/material.dart";
import "package:flutter_app/features/authentication/application/auth_service.dart";
import "package:flutter_app/features/post/domain/post_firestore.dart";
import "package:flutter_app/features/timeline/presentation/post/post_menu/post_menu.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class PostMenuButton extends ConsumerWidget {
  const PostMenuButton({
    super.key,
    required this.post,
  });

  final PostFirestore post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const Icon(Icons.more_horiz),
      onPressed: () => _showPostMenu(context, ref),
    );
  }

  void _showPostMenu(BuildContext context, WidgetRef ref) {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      builder: (context) => PostMenu(
        post: post,
        parentContext: context,
        isCurrentUser:
            ref.read(authServiceProvider).currentUserIdFirestore == post.data.ownerId,
      ),
    );
  }
}

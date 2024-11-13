import "package:flutter/material.dart";
import "package:flutter_app/features/post/domain/post_firestore.dart";
import "package:flutter_app/features/timeline/presentation/post/post_menu/delete_post_controller.dart";
import "package:flutter_app/utils/extension/async_value_ui.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class PostMenu extends ConsumerWidget {
  const PostMenu({
    super.key,
    required this.parentContext,
    required this.isCurrentUser,
    required this.post,
  });

  final BuildContext parentContext;
  final bool isCurrentUser;
  final PostFirestore post;

  Future<void> _showDeleteConfirmation(
    BuildContext context,
    WidgetRef ref,
  ) async {
    final shouldDelete = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Delete Post"),
        content: const Text("Are you sure you want to delete this post?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text(
              "Delete",
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );

    if (shouldDelete == true && context.mounted) {
      // シートを閉じる前に削除処理を開始
      final deleteController = ref.read(deletePostControllerProvider.notifier);
      final deleteOperation = deleteController.deletePost(post.id);

      // 削除処理の完了を待つ
      if (context.mounted) {
        await deleteOperation;
      }
      // シートを閉じる
      Navigator.of(parentContext).pop();
    }
  }

  Future<void> _showReportConfirmation(BuildContext context) async {
    await showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text("Report Post"),
        content: const Text("Do you want to report this post?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              // TODO: Implement report functionality
              Navigator.pop(context);
              Navigator.of(parentContext).pop(); // Close sheet after reporting
            },
            child: const Text("Report"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      deletePostControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Padding(
      padding: const EdgeInsets.all(18),
      child: DraggableScrollableSheet(
        expand: false,
        initialChildSize: 1,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  if (isCurrentUser)
                    ListTile(
                      leading:
                          const Icon(Icons.delete_outline, color: Colors.red),
                      title: const Text(
                        "Delete",
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () => _showDeleteConfirmation(context, ref),
                    )
                  else
                    ListTile(
                      leading: const Icon(Icons.flag_outlined),
                      title: const Text("Report"),
                      onTap: () => _showReportConfirmation(context),
                    ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

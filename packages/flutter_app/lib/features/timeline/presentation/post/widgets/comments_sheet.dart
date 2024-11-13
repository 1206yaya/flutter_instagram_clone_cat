import "package:flutter/material.dart";
import "package:flutter_app/features/post/domain/post_id_firestore.dart";
import "package:flutter_app/features/timeline/presentation/comments/comments_screen.dart";

class CommentsSheet extends StatelessWidget {
  const CommentsSheet({
    super.key,
    required this.postId,
  });

  final PostIdFirestore postId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.08,
      ),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.95,
          minChildSize: 0.5,
          maxChildSize: 0.95,
          builder: (context, scrollController) => Column(
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
              Expanded(
                child: CommentsScreen(postId: postId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:flutter_app/features/post/domain/post_firestore.dart";
import "package:flutter_app/widgets/async_value_widget.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

class PostsGrid extends StatelessWidget {
  const PostsGrid({
    super.key,
    required this.postsData,
  });

  final AsyncValue<List<PostFirestore>> postsData;

  @override
  Widget build(BuildContext context) {
    return AsyncValueSliverWidget(
      value: postsData,
      data: (posts) => SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _PostGridItem(post: posts[index]),
          childCount: posts.length,
        ),
      ),
    );
  }
}

class _PostGridItem extends StatelessWidget {
  const _PostGridItem({required this.post});

  final PostFirestore post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(post.data.mediaUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../router/router.dart';
import '../../../../../widgets/app_cached_network_image.dart';
import '../../../../post/domain/post_firestore.dart';
import '../widgets/comments_sheet.dart';
import '../widgets/post_actions.dart';
import '../widgets/post_header.dart';
import 'post_card_controller.dart';

class PostCard extends ConsumerStatefulWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final PostFirestore post;

  @override
  ConsumerState<PostCard> createState() => _PostCardState();
}

class _PostCardState extends ConsumerState<PostCard>
    with AutomaticKeepAliveClientMixin<PostCard> {
  @override
  bool get wantKeepAlive => true;

  Future<void> _navigateToUserProfile() async {
    StackedDashboardRouteData(uid: widget.post.data.ownerId.value).go(context);
  }

  Future<void> _showComments() async {
    await showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CommentsSheet(postId: widget.post.id),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final likeState = ref.watch(postCardControllerProvider(widget.post.id));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostHeader(
          post: widget.post,
          onProfileTap: _navigateToUserProfile,
        ),
        AppCachedNetworkImage(
          imageUrl: widget.post.data.mediaUrl,
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(widget.post.data.description),
        ),
        PostActions(
          post: widget.post,
          onCommentsTap: _showComments,
          likeState: likeState,
        ),
      ],
    );
  }
}

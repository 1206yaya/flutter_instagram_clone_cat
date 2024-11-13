import "package:flutter_app/features/post/domain/post_id_firestore.dart";
import "package:flutter_app/features/timeline/application/timeline_post_service.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "post_card_controller.g.dart";

@riverpod
class PostCardController extends _$PostCardController {
  @override
  Future<PostLikeData> build(PostIdFirestore postId) async {
    final postService = ref.watch(timelinePostServiceProvider);
    return postService.getPostLikeData(postId);
  }

  Future<void> toggleLike() async {
    final postService = ref.read(timelinePostServiceProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await postService.toggleLike(postId);
      return postService.getPostLikeData(postId);
    });
  }
}

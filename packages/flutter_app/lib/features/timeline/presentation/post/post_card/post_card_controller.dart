import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../post/data/post_repository.dart';
import '../../../../post/domain/post_id_firestore.dart';
import '../../../application/timeline_post_service.dart';

part 'post_card_controller.g.dart';

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

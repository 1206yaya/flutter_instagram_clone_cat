import "package:flutter_app/features/post/data/post_repository.dart";
import "package:flutter_app/features/post/domain/post_id_firestore.dart";
import "package:flutter_app/features/timeline/presentation/post/post_card/post_card_controller.dart";
import "package:flutter_app/features/timeline/presentation/timeline_screen/timeline_controller.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "delete_post_controller.g.dart";

@riverpod
class DeletePostController extends _$DeletePostController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
  }

  Future<void> deletePost(PostIdFirestore postId) async {
    state = const AsyncLoading();
    final newState = await AsyncValue.guard(() async {
      final postRepository = ref.read(postRepositoryProvider);
      await postRepository.deletePost(postId);
      // 関連するProviderの状態をクリア
      ref.invalidate(postCardControllerProvider(postId));
      // タイムラインを更新
      await ref.read(timelineControllerProvider.notifier).refresh();
    });
    if (mounted) {
      state = newState;
    }
  }
}

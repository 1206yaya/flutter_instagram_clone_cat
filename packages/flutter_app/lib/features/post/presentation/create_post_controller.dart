import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../timeline/presentation/timeline_screen/timeline_controller.dart';
import '../application/post_service.dart';

part 'create_post_controller.g.dart';

@riverpod
class CreatePostController extends _$CreatePostController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
  }

  Future<void> createPost(
    File mediaFile,
    String description,
    String location,
  ) async {
    state = const AsyncLoading();
    final newState = await AsyncValue.guard(() async {
      final createPostService = ref.read(postServiceProvider);
      state = await AsyncValue.guard(
        () => createPostService.createPost(
          mediaFile: mediaFile,
          description: description,
          location: location,
        ),
      );
      await ref.read(timelineControllerProvider.notifier).refresh();
    });
    if (mounted) {
      state = newState;
    }
  }
}

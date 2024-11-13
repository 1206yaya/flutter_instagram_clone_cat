import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/config/app_config.dart';
import '../../../post/domain/post_firestore.dart';
import '../../application/timeline_service.dart';
import '../post/post_card/post_card_controller.dart';

part 'timeline_controller.g.dart';

@riverpod
class TimelineController extends _$TimelineController {
  final _pageSize = AppConfig.timeline.pageSize;

  bool _hasMore = true;
  DocumentSnapshot? _lastDoc;
  // ListView の制御に使う
  bool get hasMore => _hasMore;

  @override
  Future<List<PostFirestore>> build() async {
    state = const AsyncValue.loading();
    final items = await _fetchItems();
    state = AsyncValue.data(items);
    return items;
  }

  Future<void> fetchMore() async {
    if (state.isLoading || !_hasMore || _lastDoc == null) {
      return;
    }
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final newItems = await _fetchItems();
      final items = state.value ?? [];
      return [...items, ...newItems];
    });
  }

  Future<List<PostFirestore>> _fetchItems() async {
    await Future.delayed(const Duration(seconds: 1));

    final itemResponse = await ref
        .read(timelineServiceProvider)
        .fetchPostFirestores(_pageSize, _lastDoc);
    final items = itemResponse.posts;
    final nextLastDoc = itemResponse.nextLastDoc;

    _hasMore = items.isNotEmpty;
    _lastDoc = items.isNotEmpty ? nextLastDoc : null;

    return items;
  }

  Future<void> refresh() async {
    _hasMore = true;
    _lastDoc = null;

    state = const AsyncValue.loading();
    // PostCardControllerの状態をリセット
    ref.invalidate(postCardControllerProvider);
    state = await AsyncValue.guard(() async {
      final items = await _fetchItems();
      return items;
    });
  }
}

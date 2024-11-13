import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../utils/extension/async_value_ui.dart';
import '../../../../widgets/widgets.dart';
import '../post/post_card/post_card.dart';
import 'timeline_controller.dart';

class TimelineScreen extends HookConsumerWidget {
  const TimelineScreen({super.key});

  static const timelineScreenKey = Key('timelineScreenKey');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: timelineScreenKey,
      appBar: AppBar(
        centerTitle: false,
        title: const InstagramStyleLogo(),
      ),
      body: const ItemListView(),
    );
  }
}

class ItemListView extends HookConsumerWidget {
  const ItemListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsValue = ref.watch(timelineControllerProvider);
    final items = itemsValue.value ?? [];
    final isInitialLoading = itemsValue.isLoading && items.isEmpty;
    final controller = useScrollController();
    final paginatorController = ref.read(timelineControllerProvider.notifier);
    final hasMore = paginatorController.hasMore;
    final isFetchingMore = itemsValue.isLoading && items.isNotEmpty;

    void onScroll() {
      final isBottom =
          controller.offset >= controller.position.maxScrollExtent &&
              !controller.position.outOfRange;
      if (isBottom && hasMore && !isFetchingMore) {
        paginatorController.fetchMore();
      }
    }

    useEffect(() {
      controller.addListener(onScroll);
      return () => controller.removeListener(onScroll);
    });

    if (isInitialLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    ref.listen<AsyncValue<void>>(
      timelineControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return RefreshIndicator(
      onRefresh: () async {
        await paginatorController.refresh();
      },
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        controller: controller,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                if (index == items.length) {
                  if (isFetchingMore) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (!hasMore) {
                    return const Center(child: Text('No more items'));
                  } else {
                    return Container();
                  }
                }
                final item = items[index];
                return PostCard(post: item);
              },
              childCount: items.length + (!hasMore || isFetchingMore ? 1 : 0),
            ),
          ),
        ],
      ),
    );
  }
}

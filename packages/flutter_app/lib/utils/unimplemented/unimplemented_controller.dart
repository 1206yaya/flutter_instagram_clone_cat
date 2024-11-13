import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'unimplemented_controller.g.dart';

@riverpod
class UnimplementedController extends _$UnimplementedController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
  }

  Future<void> unimplemented() {
    throw UnimplementedError();
  }
}

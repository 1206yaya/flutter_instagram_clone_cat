import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../user/application/user_service.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
  }

  Future<void> updateProfileImage(File image) async {
    await ref.read(userServiceProvider).uploadImage(
          image: image,
        );
  }
}

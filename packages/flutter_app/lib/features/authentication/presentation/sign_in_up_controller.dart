import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../application/auth_service.dart';

part 'sign_in_up_controller.g.dart';

@riverpod
class SignInUpController extends _$SignInUpController {
  bool mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => mounted = false);
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () async {
        await ref
            .read(authServiceProvider)
            .signInWithEmailAndPassword(email, password);
        return;
      },
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String displayName,
  }) async {
    state = const AsyncLoading();
    if (displayName.trim().isEmpty) {
      state = AsyncError(
        Exception('Display name cannot be empty'),
        StackTrace.current,
      );
      return;
    }
    final newState = await AsyncValue.guard(
      () => ref.read(authServiceProvider).signUpWithEmailAndPassword(
            displayName: displayName,
            email: email,
            password: password,
          ),
    );

    if (mounted) {
      state = newState;
    }
  }
}

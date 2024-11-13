import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zakfire_authenticator/zakfire_authenticator.dart';

import '../../../package_adaptor/authenticator_provider.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository(
    this._authenticator,
  );
  final Authenticator _authenticator;

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _authenticator.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<User?> signUpWithEmailAndPassword(
    String email,
    String password,
    String displayName,
  ) async {
    final userCredential = await _authenticator.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    final user = userCredential.user;
    if (user == null) {
      throw Exception('Failed to create user');
    }
    return user;
  }

  Future<void> signOut() {
    return _authenticator.signOut();
  }

  Stream<User?> get authStateChanges => _authenticator.userChanges;

  User? get currentUser => _authenticator.user;

  Future<void> deleteAccount() async {
    final user = _authenticator.user;
    if (user == null) {
      throw Exception('User must be signed in to delete account');
    }
    await _authenticator.deleteAccount();
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepository(
    ref.watch(authenticatorProvider),
  );
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
}

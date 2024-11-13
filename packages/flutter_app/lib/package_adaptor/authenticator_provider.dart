import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:zakfire_authenticator/zakfire_authenticator.dart';

part 'authenticator_provider.g.dart';

/// `[zakfire_authenticator]` パッケージの [Authenticator] クラスインスタンスを提供する。
@Riverpod(keepAlive: true)
Authenticator authenticator(AuthenticatorRef ref) {
  return Authenticator();
}

/// Firebase Authの[User]情報を提供する。
@riverpod
Stream<User?> user(UserRef ref) {
  return ref.watch(authenticatorProvider).userChanges;
}

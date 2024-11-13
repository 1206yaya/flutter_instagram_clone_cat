import 'app_exception.dart';

class AuthException extends AppException {
  const AuthException(super.message, [super.error]);

  const AuthException.notAuthenticated() : super('User not authenticated');

  const AuthException.invalidCredentials([Object? error])
      : super('Invalid email or password', error);

  const AuthException.weakPassword([Object? error])
      : super('Password is too weak', error);

  const AuthException.displayNameAlreadyInUse([Object? error])
      : super('Display name is already in use', error);

  const AuthException.invalidDisplayName([Object? error])
      : super('Invalid display name', error);

  const AuthException.signUpFailed([Object? error])
      : super('Failed to create user', error);
}

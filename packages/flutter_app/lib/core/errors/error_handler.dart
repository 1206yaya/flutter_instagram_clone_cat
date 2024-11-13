import 'package:cloud_firestore/cloud_firestore.dart';

import 'app_exception.dart';
import 'auth_exception.dart';
import 'network_exception.dart';
import 'permission_exception.dart';
import 'unexpected_exception.dart';

mixin ErrorHandler {
  static AppException handle(Object error, [StackTrace? stackTrace]) {
    if (error is AppException) {
      return error;
    }
    if (error is FirebaseException) {
      return _handleFirebaseException(error);
    }

    return UnexpectedException(error.toString());
  }

  static AppException _handleFirebaseException(FirebaseException error) {
    switch (error.code) {
      // Authentication errors
      case 'user-not-found':
      case 'user-disabled':
      case 'invalid-verification-code':
      case 'invalid-verification-id':
      case 'user-token-expired':
        return const AuthException.notAuthenticated();
      case 'wrong-password':
      case 'invalid-email':
        return AuthException.invalidCredentials(error);
      case 'weak-password':
        return AuthException.weakPassword(error);
      case 'permission-denied':
        return PermissionException.denied(error);
      default:
        return NetworkException.serverError(error.message, error);
    }
  }
}

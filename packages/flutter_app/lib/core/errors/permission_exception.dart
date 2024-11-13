import 'app_exception.dart';

class PermissionException extends AppException {
  const PermissionException._(super.message, [super.error]);

  factory PermissionException.denied(Object? error) {
    return PermissionException._('Permission denied', error);
  }
}

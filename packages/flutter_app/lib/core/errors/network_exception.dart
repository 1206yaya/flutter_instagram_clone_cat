import 'app_exception.dart';

class NetworkException extends AppException {
  const NetworkException(super.message, [super.error]);

  const NetworkException.connectionTimeout([Object? error])
      : super('Connection timeout', error);

  const NetworkException.connectionError([Object? error])
      : super('No internet connection', error);

  const NetworkException.serverError([String? details, Object? error])
      : super(details ?? 'Server error occurred', error);
}

import 'app_exception.dart';

class CommentsException extends AppException {
  const CommentsException(super.message, [super.error]);

  const CommentsException.profileNotFound([Object? error])
      : super('User profile not found. Cannot add comment.', error);
}

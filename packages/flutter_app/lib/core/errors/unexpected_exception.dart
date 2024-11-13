import 'app_exception.dart';

class UnexpectedException extends AppException {
  const UnexpectedException([super.message = 'An unexpected error occurred']);
}

import 'dart:io';

import 'package:flutter_app/features/user/application/user_service.dart';
import 'package:mockito/mockito.dart';

class MockUserService extends Mock implements UserService {
  @override
  Future<void> uploadImage({
    required File image,
  }) async {
    return super.noSuchMethod(
      Invocation.method(#uploadImage, [], {#image: image}),
      returnValue: Future.value(),
    );
  }
}

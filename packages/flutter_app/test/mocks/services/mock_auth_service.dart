import 'package:flutter_app/features/authentication/application/auth_service.dart';
import 'package:flutter_app/features/user/domain/user_id_firestore.dart';
import 'package:mockito/mockito.dart';

import '../data/firestore_user.dart';

class MockAuthService extends Mock implements AuthService {
  @override
  UserIdFirestore get currentUserIdFirestore {
    return super.noSuchMethod(
      Invocation.getter(#currentUserIdFirestore),
      returnValue: testingUserFirestoreId,
    ) as UserIdFirestore;
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    return super.noSuchMethod(
      Invocation.method(
        #signInWithEmailAndPassword,
        [email, password],
      ),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value(), // これを追加
    );
  }

  @override
  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    return super.noSuchMethod(
      Invocation.method(
        #signUpWithEmailAndPassword,
        [],
        {
          #email: email,
          #password: password,
          #displayName: displayName,
        },
      ),
      returnValue: Future<void>.value(),
    );
  }
}

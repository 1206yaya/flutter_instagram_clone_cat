import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_app/utils/firebase/firebase_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/firestore_user.dart';

/// Override to use to test the login process
final firebaseAuthMocksOverrides = [
  firebaseAuthProvider.overrideWith(mockFirebaseAuth),
];

FirebaseAuth mockFirebaseAuth(ProviderRef<FirebaseAuth> ref) {
  return MockFirebaseAuth(mockUser: mockUser);
}

FirebaseAuth mockFirebaseAuthSignedIn(ProviderRef<FirebaseAuth> ref) {
  return MockFirebaseAuth(mockUser: mockUser, signedIn: true);
}

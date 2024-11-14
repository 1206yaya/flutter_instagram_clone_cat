import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../user/data/user_repository.dart';
import '../../user/domain/user_data.dart';
import '../../user/domain/user_id_firestore.dart';

part 'auth_service.g.dart';

class AuthenticationException implements Exception {
  const AuthenticationException(this.message);

  final String message;

  @override
  String toString() => message;
}

class AuthService {
  AuthService({
    required FirebaseAuth firebaseAuth,
    required UserRepository userRepository,
  })  : _firebaseAuth = firebaseAuth,
        _userRepository = userRepository;

  final FirebaseAuth _firebaseAuth;
  final UserRepository _userRepository;

  UserIdFirestore get currentUserIdFirestore {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('User must be logged in');
    }
    return UserIdFirestore(value: user.uid);
  }

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String displayName,
  }) async {
    _validateSignUpInput(email, password, displayName);

    if (await _isDisplayNameTaken(displayName)) {
      throw Exception('Display name is already taken');
    }
    final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = userCredential.user;

    if (user == null) {
      throw Exception('User not found');
    }

    final userData = UserData.create(
      email: email,
      displayName: displayName,
    );

    await _userRepository.setUser(
      UserIdFirestore(value: user.uid),
      userData,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  void _validateSignUpInput(String email, String password, String displayName) {
    if (!_isValidDisplayName(displayName)) {
      throw Exception('Display name cannot be empty');
    }
  }

  bool _isValidDisplayName(String displayName) {
    // Basic validation
    return displayName.isNotEmpty;
  }

  Future<bool> _isDisplayNameTaken(String displayName) async {
    // TODO: Implement display name check
    return false;
  }
}

@Riverpod(keepAlive: true)
AuthService authService(AuthServiceRef ref) {
  return AuthService(
    firebaseAuth: ref.read(firebaseAuthProvider),
    userRepository: ref.read(userRepositoryProvider),
  );
}

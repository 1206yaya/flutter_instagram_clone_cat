import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/authentication/presentation/sign_in_up_screen.dart';
import 'package:flutter_app/features/user/data/user_repository.dart';
import 'package:flutter_app/utils/firebase/firebase_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInUpScreenRobot {
  SignInUpScreenRobot(this.tester);

  final WidgetTester tester;
  late FakeFirebaseFirestore fakeFirestore;
  late MockFirebaseAuth mockAuth;

  static Future<SignInUpScreenRobot> create(WidgetTester tester) async {
    final robot = SignInUpScreenRobot(tester);
    await robot.setUp();
    return robot;
  }

  Future<void> setUp() async {
    mockAuth = MockFirebaseAuth(
      mockUser: MockUser(
        uid: 'test-uid',
        email: 'test@example.com',
      ),
    );
    fakeFirestore = FakeFirebaseFirestore();
  }

  Future<void> pumpSignInUpScreen({required bool isSignIn}) async {
    final providerScope = ProviderScope(
      overrides: [
        firebaseAuthProvider.overrideWithValue(mockAuth),
        if (!isSignIn)
          userRepositoryProvider.overrideWithValue(
            UserRepository(firestore: fakeFirestore),
          ),
      ],
      child: MaterialApp(
        home: SignInUpScreen(isSignIn: isSignIn),
      ),
    );

    await tester.pumpWidget(providerScope);
  }

  Future<void> enterDisplayName(String displayName) async {
    await tester.enterText(
      find.byKey(SignInUpScreen.displayNameKey),
      displayName,
    );
  }

  Future<void> enterEmail(String email) async {
    await tester.enterText(
      find.byKey(SignInUpScreen.emailKey),
      email,
    );
  }

  Future<void> enterPassword(String password) async {
    await tester.enterText(
      find.byKey(SignInUpScreen.passwordKey),
      password,
    );
  }

  Future<void> tapSignInButton() async {
    await tester.tap(find.byKey(SignInUpScreen.signInButtonKey));
    await tester.pumpAndSettle();
  }

  Future<void> tapSignUpButton() async {
    await tester.tap(find.byKey(SignInUpScreen.signUpButtonKey));
    await tester.pump();
    await tester.pumpAndSettle();
  }

  Future<void> tapToggleFormButton() async {
    await tester.tap(find.byKey(SignInUpScreen.toggleFormButtonKey));
    await tester.pumpAndSettle();
  }

  void expectSignInFieldsVisible() {
    expect(find.byKey(SignInUpScreen.displayNameKey), findsNothing);
    expect(find.byKey(SignInUpScreen.emailKey), findsOneWidget);
    expect(find.byKey(SignInUpScreen.passwordKey), findsOneWidget);
    expect(find.byKey(SignInUpScreen.signInButtonKey), findsOneWidget);
  }

  void expectSignUpFieldsVisible() {
    expect(find.byKey(SignInUpScreen.displayNameKey), findsOneWidget);
    expect(find.byKey(SignInUpScreen.emailKey), findsOneWidget);
    expect(find.byKey(SignInUpScreen.passwordKey), findsOneWidget);
    expect(find.byKey(SignInUpScreen.signUpButtonKey), findsOneWidget);
  }

  Future<void> verifyUserCreated() async {
    expect(mockAuth.currentUser, isNotNull);
    final userDoc = await fakeFirestore
        .collection('users')
        .doc(mockAuth.currentUser!.uid)
        .get();
    expect(userDoc.exists, true);
  }
}

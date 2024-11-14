import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_app/features/authentication/application/auth_service.dart';
import 'package:flutter_app/features/authentication/presentation/sign_in_up_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/services/mock_auth_service.dart';

const testingUserData = (
  uid: 'test-uid',
  email: 'test@example.com',
  displayName: 'Test User',
  password: 'password',
);
void main() {
  late ProviderContainer container;
  late MockAuthService mockAuthService;
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;

  setUp(() {
    mockUser = MockUser(
      uid: testingUserData.uid,
      email: testingUserData.email,
      displayName: testingUserData.displayName,
    );
    mockAuthService = MockAuthService();
    mockFirebaseAuth = MockFirebaseAuth(mockUser: mockUser);
    container = ProviderContainer(
      overrides: [
        authServiceProvider.overrideWithValue(mockAuthService),
        firebaseAuthProvider.overrideWithValue(mockFirebaseAuth),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('SignInUpController Unit Test', () {
    test('initial state is AsyncData with null value', () {
      final controller = container.read(signInUpControllerProvider.notifier);
      expect(controller.state, const AsyncData<void>(null));
    });

    group('signIn', () {
      test('successful sign in updates state to AsyncData', () async {
        // Arrange
        when(
          mockAuthService.signInWithEmailAndPassword(
            testingUserData.email,
            testingUserData.password,
          ),
        ).thenAnswer((_) async => Future<void>.value());

        final controller = container.read(signInUpControllerProvider.notifier);

        // Act
        await controller.signIn(
          email: testingUserData.email,
          password: testingUserData.password,
        );

        // Assert
        expect(
          container.read(signInUpControllerProvider),
          const AsyncData<void>(null),
        );

        verify(
          mockAuthService.signInWithEmailAndPassword(
            testingUserData.email,
            testingUserData.password,
          ),
        ).called(1);
      });
      test('failed sign in updates state to AsyncError', () async {
        // Arrange
        when(
          mockAuthService.signInWithEmailAndPassword(
            testingUserData.email,
            'wrong-password',
          ),
        ).thenThrow(
          FirebaseAuthException(
            code: 'invalid-credential',
            message: 'Invalid credentials',
          ),
        );

        final controller = container.read(signInUpControllerProvider.notifier);

        // Act
        await controller.signIn(
          email: testingUserData.email,
          password: 'wrong-password',
        );

        // Assert
        expect(
          container.read(signInUpControllerProvider),
          isA<AsyncError<void>>(),
        );

        // Optional: Verify the error details
        final state = container.read(signInUpControllerProvider);
        expect(state.hasError, true);
        if (state is AsyncError) {
          expect(state.error, isA<FirebaseAuthException>());
          expect(
            (state.error as FirebaseAuthException).code,
            'invalid-credential',
          );
        }

        // Verify the mock was called
        verify(
          mockAuthService.signInWithEmailAndPassword(
            testingUserData.email,
            'wrong-password',
          ),
        ).called(1);
      });

      group('signUp', () {
        test('successful sign up updates state to AsyncData', () async {
          when(
            mockAuthService.signUpWithEmailAndPassword(
              email: testingUserData.email,
              password: testingUserData.password,
              displayName: testingUserData.displayName,
            ),
          ).thenAnswer((_) async {
            return;
          });

          final controller =
              container.read(signInUpControllerProvider.notifier);
          await controller.signUp(
            email: testingUserData.email,
            password: testingUserData.password,
            displayName: testingUserData.displayName,
          );

          expect(
            container.read(signInUpControllerProvider),
            const AsyncData<void>(null),
          );
        });

        test('empty display name updates state to AsyncError', () async {
          final controller =
              container.read(signInUpControllerProvider.notifier);
          await controller.signUp(
            email: testingUserData.email,
            password: testingUserData.password,
            displayName: '  ',
          );

          final state = container.read(signInUpControllerProvider);
          expect(state, isA<AsyncError<void>>());
          expect(
            (state as AsyncError).error.toString(),
            contains('Display name cannot be empty'),
          );
        });

        test('failed sign up updates state to AsyncError', () async {
          when(
            mockAuthService.signUpWithEmailAndPassword(
              email: testingUserData.email,
              password: testingUserData.password,
              displayName: testingUserData.displayName,
            ),
          ).thenThrow(
            FirebaseAuthException(
              code: 'email-already-in-use',
              message: 'Email already exists',
            ),
          );

          final controller =
              container.read(signInUpControllerProvider.notifier);
          await controller.signUp(
            email: testingUserData.email,
            password: testingUserData.password,
            displayName: testingUserData.displayName,
          );

          expect(
            container.read(signInUpControllerProvider),
            isA<AsyncError<void>>(),
          );
        });
      });
    });
  });
}

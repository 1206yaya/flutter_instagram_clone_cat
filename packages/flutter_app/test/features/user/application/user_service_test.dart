import 'package:flutter_app/features/authentication/application/auth_service.dart';
import 'package:flutter_app/features/storage/application/storage_service.dart';
import 'package:flutter_app/features/user/application/user_service.dart';
import 'package:flutter_app/features/user/data/user_repository.dart';
import 'package:flutter_app/features/user/domain/user_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/data/firestore_user.dart';
import '../../../mocks/repositories/mock_user_repository.dart';
import '../../../mocks/services/mock_auth_service.dart';
import '../../../mocks/services/mock_storage_service.dart';

void main() {
  late ProviderContainer container;
  late MockAuthService mockAuthService;
  late MockUserRepository mockUserRepository;
  late MockStorageService mockStorageRepository;

  setUp(() {
    mockAuthService = MockAuthService();
    mockUserRepository = MockUserRepository();
    mockStorageRepository = MockStorageService();
    when(mockAuthService.currentUserIdFirestore)
        .thenReturn(testingUserFirestoreId);
    container = ProviderContainer(
      overrides: [
        authServiceProvider.overrideWithValue(mockAuthService),
        userRepositoryProvider.overrideWithValue(mockUserRepository),
        storageServiceProvider.overrideWithValue(mockStorageRepository),
      ],
    );
  });

  group('UserService Tests', () {
    test('watchUser returns correct stream', () async {
      final expectedUser = testingUserFirestore;
      when(mockUserRepository.watchUser(testingUserFirestoreId))
          .thenAnswer((_) => Stream.value(expectedUser));

      final userService = container.read(userServiceProvider);
      final stream = userService.watchUser();

      expect(await stream.first, expectedUser);
      verify(mockUserRepository.watchUser(testingUserFirestoreId)).called(1);
    });

    test('updateUserBio calls repository correctly', () async {
      const testBio = 'Test Bio';
      when(
        mockUserRepository.updateUserField(
          uid: testingUserFirestoreId,
          field: UserData.bioField,
          value: testBio,
        ),
      ).thenAnswer((_) async => {});

      final userService = container.read(userServiceProvider);
      await userService.updateUserBio(
        uid: testingUserFirestoreId,
        bio: testBio,
      );

      verify(
        mockUserRepository.updateUserField(
          uid: testingUserFirestoreId,
          field: UserData.bioField,
          value: testBio,
        ),
      ).called(1);
    });

    test('updateUserDisplayName calls repository correctly', () async {
      const testDisplayName = 'Test Name';
      when(
        mockUserRepository.updateUserField(
          uid: testingUserFirestoreId,
          field: UserData.displayNameField,
          value: testDisplayName,
        ),
      ).thenAnswer((_) async => {});

      final userService = container.read(userServiceProvider);
      await userService.updateUserDisplayName(
        uid: testingUserFirestoreId,
        displayName: testDisplayName,
      );

      verify(
        mockUserRepository.updateUserField(
          uid: testingUserFirestoreId,
          field: UserData.displayNameField,
          value: testDisplayName,
        ),
      ).called(1);
    });
  });
  test('userStream provider returns correct stream', () async {
    final expectedUser = testingUserFirestore;
    when(mockUserRepository.watchUser(testingUserFirestoreId))
        .thenAnswer((_) => Stream.value(expectedUser));

    final stream =
        container.read(userStreamProvider(testingUserFirestoreId).stream);

    expect(await stream.first, expectedUser);
    verify(mockUserRepository.watchUser(testingUserFirestoreId)).called(1);
  });

  test('userStream provider handles errors', () async {
    when(mockUserRepository.watchUser(testingUserFirestoreId))
        .thenAnswer((_) => Stream.error('Error'));
    final stream =
        container.read(userStreamProvider(testingUserFirestoreId).stream);
    expect(() => stream.first, throwsA('Error'));
    verify(mockUserRepository.watchUser(testingUserFirestoreId)).called(1);
  });
}

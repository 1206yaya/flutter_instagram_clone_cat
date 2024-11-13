import 'dart:io';

import 'package:flutter_app/features/dashboard/presentation/dashboard_controller.dart';
import 'package:flutter_app/features/user/application/user_service.dart';
import 'package:flutter_app/features/user/data/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/repositories/mock_user_repository.dart';
import '../../../mocks/services/mock_user_service.dart';

void main() {
  late ProviderContainer container;
  late MockUserRepository mockUserRepository;
  late MockUserService mockUserService;

  setUp(() {
    mockUserRepository = MockUserRepository();
    mockUserService = MockUserService();

    container = ProviderContainer(
      overrides: [
        userRepositoryProvider.overrideWithValue(mockUserRepository),
        userServiceProvider.overrideWithValue(mockUserService),
      ],
    );
  });

  group('DashboardController Tests', () {
    test('updateProfileImage success', () async {
      // Arrange
      final testImage = File('test.jpg');
      when(mockUserService.uploadImage(image: testImage))
          .thenAnswer((_) => Future.value());

      final controller = container.read(dashboardControllerProvider.notifier);

      // Act
      await controller.updateProfileImage(testImage);

      // Assert
      verify(mockUserService.uploadImage(image: testImage)).called(1);
    });

    test('updateProfileImage failure', () async {
      // Arrange
      final testImage = File('test.jpg');
      when(mockUserService.uploadImage(image: testImage))
          .thenThrow(Exception('Upload failed'));

      final controller = container.read(dashboardControllerProvider.notifier);

      // Act & Assert
      expect(
        () => controller.updateProfileImage(testImage),
        throwsA(isA<Exception>()),
      );
    });
  });
}

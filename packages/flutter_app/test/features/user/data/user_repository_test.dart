import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_app/features/user/data/user_repository.dart';
import 'package:flutter_app/features/user/domain/user_data.dart';
import 'package:flutter_app/features/user/domain/user_firestore.dart';
import 'package:flutter_app/features/user/domain/user_id_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/data/firestore_user.dart';

void main() {
  group('UserRepository testing', () {
    late FakeFirebaseFirestore fakeFirestore;
    late UserRepository userRepo;
    late CollectionReference<Map<String, dynamic>> userCollection;

    setUp(() async {
      fakeFirestore = FakeFirebaseFirestore();
      userCollection = fakeFirestore.collection(UserFirestore.collectionName);
      userRepo = UserRepository(firestore: fakeFirestore);
    });

    group('watchUser operation', () {
      test('emits updated user data when user is modified', () async {
        final user = testingUserFirestore;
        await setUserFirestore(fakeFirestore, user);

        final stream = userRepo.watchUser(user.uid);
        final updatedData = UserData.create(
          email: 'updated@email.com',
          displayName: 'Updated Name',
        );

        // 初期値とアップデート後の値の両方をemitsInOrderで検証
        // emitsInOrderは、Streamから発行される複数のイベントを順番に検証する
        expect(
          stream,
          emitsInOrder([
            // 初期値の検証
            isA<UserFirestore>()
                .having((u) => u.data.email, 'email', user.data.email)
                .having(
                  (u) => u.data.displayName,
                  'displayName',
                  user.data.displayName,
                ),
            // アップデート後の値の検証
            isA<UserFirestore>()
                .having((u) => u.data.email, 'email', updatedData.email)
                .having(
                  (u) => u.data.displayName,
                  'displayName',
                  updatedData.displayName,
                ),
          ]),
        );

        await userRepo.setUser(user.uid, updatedData);
      });
    });

    group('setUser operation', () {
      test('sets a valid user correctly in empty db', () async {
        // Arrange
        final expectedUser = testingUserFirestore;

        // Act
        await userRepo.setUser(testingUserFirestoreId, expectedUser.data);

        // Assert
        final actualUserCollection = await userCollection.get();
        final actualDocs = actualUserCollection.docs;
        expect(actualDocs.length, 1);

        final actualUser = actualDocs[0];
        expect(actualUser.id, expectedUser.uid.value);
        expect(
          actualUser.data()[UserData.emailField],
          expectedUser.data.email,
        );
        expect(
          actualUser.data()[UserData.displayNameField],
          expectedUser.data.displayName,
        );
      });

      test('updates existing user correctly', () async {
        final originalUser = testingUserFirestore;
        await userRepo.setUser(originalUser.uid, originalUser.data);

        final updatedUserData = UserData.create(
          email: 'updated@email.com',
          displayName: 'Updated Name',
        );
        await userRepo.setUser(originalUser.uid, updatedUserData);

        final userDoc = await userCollection.doc(originalUser.uid.value).get();
        expect(userDoc.data()?[UserData.emailField], updatedUserData.email);
        expect(
          userDoc.data()?[UserData.displayNameField],
          updatedUserData.displayName,
        );
      });
    });

    group('findByUid operation', () {
      test('finds existing user correctly with all fields', () async {
        final expectedUser = testingUserFirestore;
        await setUserFirestore(fakeFirestore, expectedUser);

        final actualUser = await userRepo.findByUid(expectedUser.uid);

        // 基本フィールドの検証
        expect(actualUser.uid, expectedUser.uid);
        expect(actualUser.data.email, expectedUser.data.email);
        expect(actualUser.data.displayName, expectedUser.data.displayName);

        // 追加フィールドの検証
        expect(actualUser.data.photoUrl, expectedUser.data.photoUrl);
        expect(actualUser.data.bio, expectedUser.data.bio);
        expect(
          actualUser.data.followersCount,
          expectedUser.data.followersCount,
        );
        expect(
          actualUser.data.followingCount,
          expectedUser.data.followingCount,
        );
        expect(actualUser.data.postsCount, expectedUser.data.postsCount);
      });

      test('throws exception when user does not exist', () async {
        const nonExistentId = UserIdFirestore(value: 'non-existent-id');
        expect(
          () => userRepo.findByUid(nonExistentId),
          throwsA(
            isA<Exception>().having(
              (e) => e.toString(),
              'message',
              'Exception: User document does not exist',
            ),
          ),
        );
      });
    });

    group('updateUserField operation', () {
      test('updates single field correctly', () async {
        final user = testingUserFirestore;
        await setUserFirestore(fakeFirestore, user);

        const newDisplayName = 'New Display Name';
        await userRepo.updateUserField(
          uid: user.uid,
          field: UserData.displayNameField,
          value: newDisplayName,
        );

        final updatedDoc = await userCollection.doc(user.uid.value).get();
        expect(
          updatedDoc.data()?[UserData.displayNameField],
          newDisplayName,
        );
        expect(updatedDoc.data()?[UserData.updatedAtField], isNotNull);
      });

      test('throws exception when user does not exist', () async {
        const nonExistentId = UserIdFirestore(value: 'non-existent-id');
        expect(
          () => userRepo.updateUserField(
            uid: nonExistentId,
            field: UserData.displayNameField,
            value: 'New Name',
          ),
          throwsA(isA<Exception>()),
        );
      });
    });

    group('multiple users operations', () {
      test('handles multiple users correctly', () async {
        const numberOfUsers = 5;
        final users = await FirestoreUserGenerator.addUsers(
          fakeFirestore,
          numberOfUsers,
        );

        for (final user in users) {
          final fetchedUser = await userRepo.findByUid(user.uid);
          expect(fetchedUser.uid, user.uid);
          expect(fetchedUser.data.email, user.data.email);
          expect(fetchedUser.data.displayName, user.data.displayName);
        }
      });
    });
  });
}

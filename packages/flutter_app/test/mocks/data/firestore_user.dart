import "package:cloud_firestore/cloud_firestore.dart";
import "package:collection/collection.dart";
import "package:firebase_auth_mocks/firebase_auth_mocks.dart";
import "package:flutter_app/features/user/domain/user_data.dart";
import "package:flutter_app/features/user/domain/user_firestore.dart";
import "package:flutter_app/features/user/domain/user_id_firestore.dart";

final mockUser = MockUser(
  isAnonymous: false,
  uid: "testing_user_id",
  email: "testing.user@gmail.com",
  displayName: "Testing User",
);

final testingUserData = UserData.create(
  email: "email_8456@email.com",
  displayName: "display_name_8456",
);

final testingUserFirestoreId = UserIdFirestore(value: mockUser.uid);

final testingUserFirestore = UserFirestore(
  uid: testingUserFirestoreId,
  data: testingUserData,
);
// Created a user data

final loginUser = UserFirestore(
  uid: UserIdFirestore(value: mockUser.uid),
  data: UserData.create(
    email: mockUser.email!,
    displayName: mockUser.displayName!,
  ),
);

/// Helper class to generate mock user data to be used in tests
class FirestoreUserGenerator {
  static List<UserData> generateUserData(int count) {
    return List.generate(count, (i) {
      return UserData.create(
        email: "email_$i@email.com",
        displayName: "display_name_$i",
        // createdAt: Timestamp.fromMillisecondsSinceEpoch(1000 * i),
      );
    });
  }

  static List<UserFirestore> generateUserFirestoreWithId(
    List<UserIdFirestore> ids,
  ) {
    return generateUserData(ids.length).mapIndexed((i, data) {
      return UserFirestore(
        uid: ids[i],
        data: data,
      );
    }).toList();
  }

  static List<UserFirestore> generateUserFirestore(int count) {
    return generateUserFirestoreWithId(
      List.generate(count, (i) => UserIdFirestore(value: "user_id_$i")),
    );
  }

  // Create a user, add it to firestore and return it
  static Future<UserFirestore> addUser(FirebaseFirestore firestore) async {
    final users = await addUsers(firestore, 1);
    return users[0];
  }

  // Create [numberOfUsers] users and add them to the [firestore] db
  static Future<List<UserFirestore>> addUsers(
    FirebaseFirestore firestore,
    int numberOfUsers,
  ) async {
    final users = generateUserFirestore(numberOfUsers);
    await setUsersFirestore(firestore, users);
    return users;
  }
}

/// Helper function to set a user in the firestore db
Future<void> setUserFirestore(
  FirebaseFirestore firestore,
  UserFirestore user,
) async {
  await firestore
      .collection(UserFirestore.collectionName)
      .doc(user.uid.value)
      .set({...user.data.toDocument()});
}

Future<void> setUsersFirestore(
  FirebaseFirestore firestore,
  List<UserFirestore> users,
) async {
  for (final user in users) {
    await setUserFirestore(firestore, user);
  }
}

class TestUserDataGenerator {
  static int _counter = 0;

  static UserData generateUserData({
    String? email,
    String? displayName,
  }) {
    _counter++;
    return UserData.create(
      email: email ?? "test$_counter@example.com",
      displayName: displayName ?? "Test User $_counter",
    );
  }

  static List<UserData> generateMultipleUserData(int count) {
    return List.generate(
      count,
      (index) => generateUserData(),
    );
  }

  static UserFirestore generateUserFirestore({
    UserIdFirestore? uid,
    UserData? userData,
  }) {
    return UserFirestore(
      uid: uid ?? UserIdFirestore(value: "test-uid-${_counter}"),
      data: userData ?? generateUserData(),
    );
  }

  static List<UserFirestore> generateMultipleUserFirestore(int count) {
    return List.generate(
      count,
      (index) => generateUserFirestore(),
    );
  }
}

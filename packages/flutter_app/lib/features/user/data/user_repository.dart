import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../domain/user_data.dart';
import '../domain/user_firestore.dart';
import '../domain/user_id_firestore.dart';

part 'user_repository.g.dart';

class UserRepository {
  UserRepository({
    required this.firestore,
  }) : _collectionRef = firestore.collection(UserFirestore.collectionName);

  final CollectionReference _collectionRef;

  final FirebaseFirestore firestore;
  //* Functionsで AuthのonCreateトリガーの際にFirestoreにユーザー情報を登録しようとしたが、
  //* displayName が Functions 側で取得できなかったため、ここで登録する
  //* todo: displayName の重複チェック
  Future<void> setUser(UserIdFirestore uid, UserData userData) async {
    await _collectionRef.doc(uid.value).set(userData.toDocument());
  }

  Future<UserFirestore> findByUid(UserIdFirestore uid) async {
    final docSnap = await _collectionRef.doc(uid.value).get();
    return UserFirestore.fromDocument(docSnap);
  }

  Stream<UserFirestore?> watchUser(UserIdFirestore uid) {
    return _collectionRef.doc(uid.value).snapshots().map((docSnapshot) {
      return UserFirestore.fromDocument(docSnapshot);
    });
  }

  Future<void> incrementPostCountInTransaction(
    Transaction transaction,
    UserIdFirestore uid,
  ) {
    final userRef = _collectionRef.doc(uid.value);

    transaction.update(userRef, {
      UserData.postsCountField: FieldValue.increment(1),
      UserData.updatedAtField: FieldValue.serverTimestamp(),
    });

    return Future.value();
  }

  Future<void> updateUserField({
    required UserIdFirestore uid,
    required String field,
    required dynamic value,
  }) async {
    await _collectionRef.doc(uid.value).update({
      field: value,
      UserData.updatedAtField: FieldValue.serverTimestamp(),
    });
  }

  Future<void> updatePostCount(
    UserIdFirestore userIdFirestore, {
    required bool increment,
  }) {
    final incrementValue = increment ? 1 : -1;
    return _collectionRef.doc(userIdFirestore.value).update({
      UserData.postsCountField: FieldValue.increment(incrementValue),
    });
  }
}

@Riverpod(dependencies: [firebaseFirestore], keepAlive: true)
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(
    firestore: ref.watch(firebaseFirestoreProvider),
  );
}

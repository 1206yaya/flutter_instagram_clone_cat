import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/features/user/data/user_repository.dart';
import 'package:flutter_app/features/user/domain/user_data.dart';
import 'package:flutter_app/features/user/domain/user_firestore.dart';
import 'package:flutter_app/features/user/domain/user_id_firestore.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {
  @override
  Stream<UserFirestore?> watchUser(UserIdFirestore uid) {
    return super.noSuchMethod(
      Invocation.method(#watchUser, [uid]),
      returnValue: Stream.value(null),
    ) as Stream<UserFirestore?>;
  }

  @override
  Future<void> setUser(UserIdFirestore uid, UserData userData) {
    return super.noSuchMethod(
      Invocation.method(#setUser, [uid, userData]),
      returnValue: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<UserFirestore> findByUid(UserIdFirestore uid) {
    return super.noSuchMethod(
      Invocation.method(#findByUid, [uid]),
      returnValue: Future.value(UserFirestore.empty()),
    ) as Future<UserFirestore>;
  }

  @override
  Future<void> updateUserField({
    required UserIdFirestore uid,
    required String field,
    required dynamic value,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #updateUserField,
        [],
        {#uid: uid, #field: field, #value: value},
      ),
      returnValue: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<void> incrementPostCountInTransaction(
    Transaction transaction,
    UserIdFirestore uid,
  ) {
    return super.noSuchMethod(
      Invocation.method(#incrementPostCountInTransaction, [transaction, uid]),
      returnValue: Future<void>.value(),
    ) as Future<void>;
  }

  @override
  Future<void> updatePostCount(
    UserIdFirestore userIdFirestore, {
    required bool increment,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #updatePostCount,
        [userIdFirestore],
        {#increment: increment},
      ),
      returnValue: Future<void>.value(),
    ) as Future<void>;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'user_data.dart';
import 'user_id_firestore.dart';

@immutable
class UserFirestore {
  const UserFirestore({required this.uid, required this.data});

  UserFirestore.empty()
      : uid = const UserIdFirestore(value: ''),
        data = UserData.empty();

  /// This method will create an instance of [UserFirestore] from the
  /// document snapshot [docSnap] that comes from firestore
  factory UserFirestore.fromDocument(DocumentSnapshot docSnap) {
    if (!docSnap.exists) {
      throw Exception('User document does not exist');
    }

    try {
      return UserFirestore(
        uid: UserIdFirestore(value: docSnap.id),
        data: UserData.fromDocument(docSnap),
      );
    } catch (e) {
      if (e is TypeError) {
        throw FormatException('Cannot parse user document : $e');
      } else {
        rethrow;
      }
    }
  }
  // This is the collection where the users are stored
  static const collectionName = 'users';

  /// The uid is not stored in a field because it already
  /// corresponds to the document id on firestore
  final UserIdFirestore uid;

  final UserData data;

  UserFirestore copyWith({
    UserIdFirestore? uid,
    String? displayName,
    String? bio,
    String? photoUrl,
  }) {
    return UserFirestore(
      uid: uid ?? this.uid,
      data: data.copyWith(
        displayName: displayName ?? data.displayName,
        bio: bio ?? data.bio,
        photoUrl: photoUrl ?? data.photoUrl,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is UserFirestore && other.uid == uid && other.data == data;
  }

  @override
  int get hashCode => Object.hash(uid, data);
}

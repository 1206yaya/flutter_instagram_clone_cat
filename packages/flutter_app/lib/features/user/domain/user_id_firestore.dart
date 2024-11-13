import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/firebase/id_firestore.dart';

/// The id are strong typed to avoid misuse
@immutable
class UserIdFirestore implements IdFirestore {
  const UserIdFirestore({required this.value});

  factory UserIdFirestore.fromString(String value) =>
      UserIdFirestore(value: value);
  @override
  final String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserIdFirestore && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

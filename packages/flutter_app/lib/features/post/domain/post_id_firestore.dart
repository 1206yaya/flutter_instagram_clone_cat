import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/firebase/id_firestore.dart';

/// The id are strong typed to avoid misuse
@immutable
class PostIdFirestore implements IdFirestore {
  const PostIdFirestore({required this.value});

  factory PostIdFirestore.fromString(String value) =>
      PostIdFirestore(value: value);
  @override
  final String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostIdFirestore && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

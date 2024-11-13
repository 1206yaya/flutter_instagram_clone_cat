// comment_id_firestore.dart
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/firebase/id_firestore.dart';

@immutable
class CommentIdFirestore implements IdFirestore {
  const CommentIdFirestore({required this.value});

  factory CommentIdFirestore.fromString(String value) =>
      CommentIdFirestore(value: value);

  @override
  final String value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CommentIdFirestore && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

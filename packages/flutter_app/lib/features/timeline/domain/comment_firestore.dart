// comment_firestore.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'comment_data.dart';
import 'comment_id_firestore.dart';

@immutable
class CommentFirestore {
  const CommentFirestore({
    required this.id,
    required this.data,
  });

  factory CommentFirestore.fromDb(DocumentSnapshot docSnap) {
    if (!docSnap.exists) {
      throw Exception('Comment document does not exist');
    }

    try {
      return CommentFirestore(
        id: CommentIdFirestore(value: docSnap.id),
        data: CommentData.fromDocument(docSnap),
      );
    } catch (e) {
      if (e is TypeError) {
        throw FormatException('Cannot parse comment document: $e');
      } else {
        rethrow;
      }
    }
  }
  // This is the collection where the comments are stored
  static const collectionName = 'comments';

  final CommentIdFirestore id;
  final CommentData data;
  Map<String, dynamic> toDocument() {
    return data.toDocument();
  }

  @override
  bool operator ==(Object other) {
    return other is CommentFirestore && other.id == id && other.data == data;
  }

  @override
  int get hashCode => Object.hash(id, data);
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'post_data.dart';
import 'post_id_firestore.dart';

@immutable
class PostFirestore {
  const PostFirestore({
    required this.id,
    required this.data,
  });

  /// This method will create an instance of [PostFirestore] from the
  /// document snapshot [docSnap] that comes from firestore
  factory PostFirestore.fromDb(DocumentSnapshot docSnap) {
    if (!docSnap.exists) {
      throw Exception('Post document does not exist');
    }

    try {
      return PostFirestore(
        id: PostIdFirestore(value: docSnap.id),
        data: PostData.fromDocument(docSnap),
      );
    } catch (e) {
      if (e is TypeError) {
        throw FormatException('Cannot parse post document: $e');
      } else {
        rethrow;
      }
    }
  }

  // collection
  static const collectionName = 'posts';
  // sub-collection
  static const String commentsCollectionName = 'comments';
  static const String likesCollectionName = 'likes';

  final PostIdFirestore id;
  final PostData data;

  @override
  bool operator ==(Object other) {
    return other is PostFirestore && other.id == id && other.data == data;
  }

  @override
  int get hashCode => Object.hash(id, data);
}

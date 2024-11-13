import 'package:cloud_firestore/cloud_firestore.dart';

import '../../post/domain/post_firestore.dart';

class TimelineResponse {
  TimelineResponse({
    required this.posts,
    this.nextLastDoc,
  });

  final List<PostFirestore> posts;
  final DocumentSnapshot? nextLastDoc;

  TimelineResponse copyWith({
    List<PostFirestore>? items,
    DocumentSnapshot? nextLastDoc,
  }) {
    return TimelineResponse(
      posts: items ?? posts,
      nextLastDoc: nextLastDoc ?? this.nextLastDoc,
    );
  }

  @override
  String toString() {
    return 'ItemResponse(items: $posts, nextLastDoc: $nextLastDoc)';
  }
}

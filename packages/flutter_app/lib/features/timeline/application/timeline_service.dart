import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../authentication/application/auth_service.dart';
import '../../follow/data/following_repository.dart';
import '../../post/domain/post_data.dart';
import '../../post/domain/post_firestore.dart';
import '../domain/timeline_response.dart';

part 'timeline_service.g.dart';

class TimelineService {
  TimelineService({
    required this.firestore,
    required this.auth,
    required this.followingRepository,
  });

  final FirebaseFirestore firestore;
  final AuthService auth;
  final FollowingRepository followingRepository;
  Future<TimelineResponse> fetchPostFirestores(
    int pageSize,
    DocumentSnapshot? lastDoc,
  ) async {
    final followingIds = await followingRepository.getFollowingIds(
      auth.currentUserIdFirestore,
    );
    if (followingIds.isEmpty) {
      Query query = firestore
          .collection(PostFirestore.collectionName)
          .orderBy(PostData.createdAtField, descending: true);

      if (lastDoc != null) {
        query = query.startAfterDocument(lastDoc);
      }

      final postsQuery = await query.limit(pageSize).get();

      final posts = postsQuery.docs.map(PostFirestore.fromDb).toList();

      final nextLastDoc =
          postsQuery.docs.isNotEmpty ? postsQuery.docs.last : null;

      return TimelineResponse(posts: posts, nextLastDoc: nextLastDoc);
    } else {
      Query query = firestore
          .collection(PostFirestore.collectionName)
          .where(PostData.ownerIdField, whereIn: followingIds)
          .orderBy(PostData.createdAtField, descending: true);

      if (lastDoc != null) {
        query = query.startAfterDocument(lastDoc);
      }

      final postsQuery = await query.limit(pageSize).get();

      final posts = postsQuery.docs.map(PostFirestore.fromDb).toList();

      final nextLastDoc =
          postsQuery.docs.isNotEmpty ? postsQuery.docs.last : null;

      return TimelineResponse(posts: posts, nextLastDoc: nextLastDoc);
    }
  }
}

@riverpod
TimelineService timelineService(TimelineServiceRef ref) {
  return TimelineService(
    firestore: ref.watch(firebaseFirestoreProvider),
    auth: ref.watch(authServiceProvider),
    followingRepository: ref.watch(followingRepositoryProvider),
  );
}

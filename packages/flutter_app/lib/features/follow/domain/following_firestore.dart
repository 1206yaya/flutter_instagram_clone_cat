import 'package:flutter/material.dart';

import '../../user/domain/user_id_firestore.dart';

@immutable
class FollowingFirestore {
  const FollowingFirestore({
    required this.followerId,
    required this.followingId,
  });

  static const String collectionName = 'following';
  static const String subCollectionName = 'followingList';

  final UserIdFirestore followerId;
  final UserIdFirestore followingId;
}

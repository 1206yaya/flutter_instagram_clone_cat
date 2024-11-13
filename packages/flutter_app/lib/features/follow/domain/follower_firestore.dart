import 'package:flutter/material.dart';

import '../../user/domain/user_id_firestore.dart';

@immutable
class FollowerFirestore {
  const FollowerFirestore({
    required this.userId,
    required this.followerId,
  });

  static const String collectionName = 'followers';
  static const String subCollectionName = 'followersList';

  final UserIdFirestore userId;
  final UserIdFirestore followerId;
}

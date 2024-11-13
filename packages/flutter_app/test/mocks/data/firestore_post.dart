// mocks/data/firestore_post.dart

import 'package:flutter_app/features/post/domain/post_data.dart';
import 'package:flutter_app/features/post/domain/post_firestore.dart';
import 'package:flutter_app/features/post/domain/post_id_firestore.dart';
import 'package:flutter_app/features/user/domain/user_id_firestore.dart';

// Test Post ID
const testingPostFirestoreId = PostIdFirestore(value: 'test-post-id');

// Test Post Data
final testingPostData = PostData(
  ownerId: const UserIdFirestore(value: 'test-user-id'),
  description: 'Test post description',
  location: 'Test location',
  mediaUrl: 'https://example.com/test-image.jpg',
  mediaType: 'image',
  profilePic: 'https://example.com/test-profile.jpg',
  authorName: 'Test User',
  createdAt: DateTime(2024),
);

// Test Post Firestore
final testingPostFirestore = PostFirestore(
  id: testingPostFirestoreId,
  data: testingPostData,
);

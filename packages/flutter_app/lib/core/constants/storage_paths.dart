// lib/core/constants/storage_paths.dart
import "package:flutter_app/features/user/domain/user_id_firestore.dart";

abstract interface class StoragePaths {
  /// Private constructor to prevent instantiation
  const StoragePaths._();

  /// Base path for post images
  static const String posts = "posts";

  /// Base path for profile images
  static const String profileImages = "profile_images";

  /// ユーザーごとの投稿画像パスを生成
  static String userPosts(String userId) => "$posts/$userId";

  /// ユーザーごとのプロフィール画像パスを生成
  static String userProfileImages(String userId) => "$profileImages/$userId";

  /// 投稿画像の完全なパスを生成
  static String postImage(UserIdFirestore userId, String fileName) =>
      "${userPosts(userId.value)}/$fileName";

  /// プロフィール画像の完全なパスを生成
  static String profileImage(String userId, String fileName) =>
      "${userProfileImages(userId)}/$fileName";
}

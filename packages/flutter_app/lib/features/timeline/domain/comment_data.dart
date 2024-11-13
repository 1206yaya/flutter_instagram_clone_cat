// comment_data.dart の関連部分を修正
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/json_converter/firestore_timestamp_converter.dart';
import '../../../utils/json_converter/id_converter.dart';
import '../../../utils/json_converter/timestamp_supplementer.dart';
import '../../user/domain/user_id_firestore.dart';

part 'comment_data.freezed.dart';
part 'comment_data.g.dart';

@freezed
class CommentData with _$CommentData {
  const factory CommentData({
    @UserIdFirestoreConverter() required UserIdFirestore userId,
    required String name,
    required String profilePic,
    required String comment,
    @Default(0) int likesCount,
    @UserIdFirestoreConverter() @Default([]) List<UserIdFirestore> likedUserIds,
    @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp,
    )
    required DateTime createdAt,
    @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp,
    )
    DateTime? updatedAt,
  }) = _CommentData;

  const CommentData._();

  factory CommentData.fromDocument(DocumentSnapshot doc) {
    try {
      final json = doc.data()! as Map<String, dynamic>;
      return CommentData.fromJson(json);
    } catch (e) {
      if (e is TypeError) {
        throw FormatException(
          'Cannot parse comment data document: $e',
        );
      } else {
        rethrow;
      }
    }
  }

  factory CommentData.create({
    required UserIdFirestore userId,
    required String name,
    required String profilePic,
    required String comment,
  }) {
    return CommentData(
      userId: userId,
      name: name,
      profilePic: profilePic,
      comment: comment,
      createdAt: DateTime.now(),
    );
  }

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      _$CommentDataFromJson(json);
  // Field names
  static const String userIdField = 'userId';
  static const String nameField = 'name';
  static const String profilePicField = 'profilePic';
  static const String commentField = 'comment';
  static const String likedUserIdsField = 'likedUserIds';
  static const String likesCountField = 'likesCount';
  static const String createdAtField = TimestampField.createdAt;
  static const String updatedAtField = TimestampField.updatedAt;

  Map<String, dynamic> toDocument() {
    return toJson().suppelementTimestamp();
  }
}

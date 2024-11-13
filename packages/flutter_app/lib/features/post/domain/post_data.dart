import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/json_converter/firestore_timestamp_converter.dart';
import '../../../utils/json_converter/id_converter.dart';
import '../../../utils/json_converter/timestamp_supplementer.dart';
import '../../user/domain/user_id_firestore.dart';

part 'post_data.freezed.dart';
part 'post_data.g.dart';

@freezed
class PostData with _$PostData {
  const factory PostData({
    @UserIdFirestoreConverter() required UserIdFirestore ownerId,
    required String authorName,
    required String description,
    required String location,
    required String mediaUrl,
    required String mediaType,
    @Default('') String profilePic,
    @Default(0) int likesCount,
    @Default(0) int commentsCount,
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
  }) = _PostData;

  const PostData._();

  factory PostData.fromDocument(DocumentSnapshot doc) {
    try {
      final json = doc.data()! as Map<String, dynamic>;

      return PostData.fromJson(json);
    } catch (e) {
      if (e is TypeError) {
        throw FormatException(
          'Cannot parse post data document: $e',
        );
      } else {
        rethrow;
      }
    }
  }
  factory PostData.create({
    required UserIdFirestore ownerId,
    required String authorName,
    required String description,
    required String location,
    required String mediaType,
    required String mediaUrl,
    String profilePic = '',
  }) {
    return PostData(
      ownerId: ownerId,
      authorName: authorName,
      description: description,
      location: location,
      mediaType: mediaType,
      mediaUrl: mediaUrl,
      profilePic: profilePic,
      createdAt: DateTime.now(),
    );
  }
  factory PostData.fromJson(Map<String, dynamic> json) =>
      _$PostDataFromJson(json);
  // Field names
  static const String ownerIdField = 'ownerId';
  static const String descriptionField = 'description';
  static const String locationField = 'location';
  static const String mediaUrlField = 'mediaUrl';
  static const String mediaTypeField = 'mediaType';
  static const String profilePicField = 'profilePic';
  static const String likesCountField = 'likesCount';
  static const String commentsCountField = 'commentsCount';
  static const String authorNameField = 'authorName';
  static const String createdAtField = TimestampField.createdAt;
  static const String updatedAtField = TimestampField.updatedAt;
  Map<String, dynamic> toDocument() {
    return toJson().suppelementTimestamp();
  }
}

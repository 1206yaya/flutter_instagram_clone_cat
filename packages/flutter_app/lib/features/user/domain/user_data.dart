import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../utils/json_converter/firestore_timestamp_converter.dart';
import '../../../utils/json_converter/timestamp_supplementer.dart';

part 'user_data.freezed.dart';
part 'user_data.g.dart';

@freezed
class UserData with _$UserData {
  const factory UserData({
    required String email,
    required String displayName,
    @Default('') String photoUrl,
    @Default('') String bio,
    @Default(0) int followersCount,
    @Default(0) int followingCount,
    @Default(0) int postsCount,
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
  }) = _UserData;

  const UserData._();

  factory UserData.empty() {
    return UserData.create(
      email: '',
      displayName: '',
    );
  }

  factory UserData.fromDocument(DocumentSnapshot doc) {
    final json = doc.data()! as Map<String, dynamic>;

    try {
      return UserData.fromJson(json);
    } catch (e) {
      if (e is TypeError) {
        throw FormatException(
          'Cannot parse user data document: $e',
        );
      } else {
        rethrow;
      }
    }
  }

  factory UserData.create({
    required String email,
    required String displayName,
    String photoUrl = '',
    String bio = '',
    int followersCount = 0,
    int followingCount = 0,
    int postsCount = 0,
  }) {
    return UserData(
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      bio: bio,
      followersCount: followersCount,
      followingCount: followingCount,
      postsCount: postsCount,
      createdAt: DateTime.now(),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
  // Collection name
  static const String userCollection = 'users';

  // Field names
  static const String emailField = 'email';
  static const String displayNameField = 'displayName';
  static const String photoUrlField = 'photoUrl';
  static const String bioField = 'bio';
  static const String followersCountField = 'followersCount';
  static const String followingCountField = 'followingCount';
  static const String postsCountField = 'postsCount';
  static const String createdAtField = TimestampField.createdAt;
  static const String updatedAtField = TimestampField.updatedAt;

  Map<String, dynamic> toDocument() {
    return toJson().suppelementTimestamp();
  }
}

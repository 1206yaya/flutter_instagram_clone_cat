// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'comment_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentDataImpl _$$CommentDataImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$CommentDataImpl',
      json,
      ($checkedConvert) {
        final val = _$CommentDataImpl(
          userId: $checkedConvert('userId',
              (v) => const UserIdFirestoreConverter().fromJson(v as String)),
          name: $checkedConvert('name', (v) => v as String),
          profilePic: $checkedConvert('profilePic', (v) => v as String),
          comment: $checkedConvert('comment', (v) => v as String),
          likesCount:
              $checkedConvert('likesCount', (v) => (v as num?)?.toInt() ?? 0),
          likedUserIds: $checkedConvert(
              'likedUserIds',
              (v) =>
                  (v as List<dynamic>?)
                      ?.map((e) => const UserIdFirestoreConverter()
                          .fromJson(e as String))
                      .toList() ??
                  const []),
          createdAt: $checkedConvert(
              'createdAt',
              (v) => NonNullTimestampConverter.timestampToDateTime(
                  v as Timestamp)),
          updatedAt: $checkedConvert('updatedAt',
              (v) => TimestampConverter.timestampToDateTime(v as Timestamp?)),
        );
        return val;
      },
    );

Map<String, dynamic> _$$CommentDataImplToJson(_$CommentDataImpl instance) =>
    <String, dynamic>{
      'userId': const UserIdFirestoreConverter().toJson(instance.userId),
      'name': instance.name,
      'profilePic': instance.profilePic,
      'comment': instance.comment,
      'likesCount': instance.likesCount,
      'likedUserIds': instance.likedUserIds
          .map(const UserIdFirestoreConverter().toJson)
          .toList(),
      'createdAt':
          NonNullTimestampConverter.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': TimestampConverter.dateTimeToTimestamp(instance.updatedAt),
    };

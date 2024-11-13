// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostDataImpl _$$PostDataImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$PostDataImpl',
      json,
      ($checkedConvert) {
        final val = _$PostDataImpl(
          ownerId: $checkedConvert('ownerId',
              (v) => const UserIdFirestoreConverter().fromJson(v as String)),
          authorName: $checkedConvert('authorName', (v) => v as String),
          description: $checkedConvert('description', (v) => v as String),
          location: $checkedConvert('location', (v) => v as String),
          mediaUrl: $checkedConvert('mediaUrl', (v) => v as String),
          mediaType: $checkedConvert('mediaType', (v) => v as String),
          profilePic: $checkedConvert('profilePic', (v) => v as String? ?? ''),
          likesCount:
              $checkedConvert('likesCount', (v) => (v as num?)?.toInt() ?? 0),
          commentsCount: $checkedConvert(
              'commentsCount', (v) => (v as num?)?.toInt() ?? 0),
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

Map<String, dynamic> _$$PostDataImplToJson(_$PostDataImpl instance) =>
    <String, dynamic>{
      'ownerId': const UserIdFirestoreConverter().toJson(instance.ownerId),
      'authorName': instance.authorName,
      'description': instance.description,
      'location': instance.location,
      'mediaUrl': instance.mediaUrl,
      'mediaType': instance.mediaType,
      'profilePic': instance.profilePic,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
      'likedUserIds': instance.likedUserIds
          .map(const UserIdFirestoreConverter().toJson)
          .toList(),
      'createdAt':
          NonNullTimestampConverter.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': TimestampConverter.dateTimeToTimestamp(instance.updatedAt),
    };

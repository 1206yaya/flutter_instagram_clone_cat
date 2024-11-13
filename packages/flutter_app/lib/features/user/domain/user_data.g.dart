// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$UserDataImpl',
      json,
      ($checkedConvert) {
        final val = _$UserDataImpl(
          email: $checkedConvert('email', (v) => v as String),
          displayName: $checkedConvert('displayName', (v) => v as String),
          photoUrl: $checkedConvert('photoUrl', (v) => v as String? ?? ""),
          bio: $checkedConvert('bio', (v) => v as String? ?? ""),
          followersCount: $checkedConvert(
              'followersCount', (v) => (v as num?)?.toInt() ?? 0),
          followingCount: $checkedConvert(
              'followingCount', (v) => (v as num?)?.toInt() ?? 0),
          postsCount:
              $checkedConvert('postsCount', (v) => (v as num?)?.toInt() ?? 0),
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

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'bio': instance.bio,
      'followersCount': instance.followersCount,
      'followingCount': instance.followingCount,
      'postsCount': instance.postsCount,
      'createdAt':
          NonNullTimestampConverter.dateTimeToTimestamp(instance.createdAt),
      'updatedAt': TimestampConverter.dateTimeToTimestamp(instance.updatedAt),
    };

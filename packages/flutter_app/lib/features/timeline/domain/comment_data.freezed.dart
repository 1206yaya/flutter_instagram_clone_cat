// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentData _$CommentDataFromJson(Map<String, dynamic> json) {
  return _CommentData.fromJson(json);
}

/// @nodoc
mixin _$CommentData {
  @UserIdFirestoreConverter()
  UserIdFirestore get userId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get profilePic => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;
  @UserIdFirestoreConverter()
  List<UserIdFirestore> get likedUserIds => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this CommentData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentDataCopyWith<CommentData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentDataCopyWith<$Res> {
  factory $CommentDataCopyWith(
          CommentData value, $Res Function(CommentData) then) =
      _$CommentDataCopyWithImpl<$Res, CommentData>;
  @useResult
  $Res call(
      {@UserIdFirestoreConverter() UserIdFirestore userId,
      String name,
      String profilePic,
      String comment,
      int likesCount,
      @UserIdFirestoreConverter() List<UserIdFirestore> likedUserIds,
      @JsonKey(
          fromJson: NonNullTimestampConverter.timestampToDateTime,
          toJson: NonNullTimestampConverter.dateTimeToTimestamp)
      DateTime createdAt,
      @JsonKey(
          fromJson: TimestampConverter.timestampToDateTime,
          toJson: TimestampConverter.dateTimeToTimestamp)
      DateTime? updatedAt});
}

/// @nodoc
class _$CommentDataCopyWithImpl<$Res, $Val extends CommentData>
    implements $CommentDataCopyWith<$Res> {
  _$CommentDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? profilePic = null,
    Object? comment = null,
    Object? likesCount = null,
    Object? likedUserIds = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserIdFirestore,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedUserIds: null == likedUserIds
          ? _value.likedUserIds
          : likedUserIds // ignore: cast_nullable_to_non_nullable
              as List<UserIdFirestore>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentDataImplCopyWith<$Res>
    implements $CommentDataCopyWith<$Res> {
  factory _$$CommentDataImplCopyWith(
          _$CommentDataImpl value, $Res Function(_$CommentDataImpl) then) =
      __$$CommentDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@UserIdFirestoreConverter() UserIdFirestore userId,
      String name,
      String profilePic,
      String comment,
      int likesCount,
      @UserIdFirestoreConverter() List<UserIdFirestore> likedUserIds,
      @JsonKey(
          fromJson: NonNullTimestampConverter.timestampToDateTime,
          toJson: NonNullTimestampConverter.dateTimeToTimestamp)
      DateTime createdAt,
      @JsonKey(
          fromJson: TimestampConverter.timestampToDateTime,
          toJson: TimestampConverter.dateTimeToTimestamp)
      DateTime? updatedAt});
}

/// @nodoc
class __$$CommentDataImplCopyWithImpl<$Res>
    extends _$CommentDataCopyWithImpl<$Res, _$CommentDataImpl>
    implements _$$CommentDataImplCopyWith<$Res> {
  __$$CommentDataImplCopyWithImpl(
      _$CommentDataImpl _value, $Res Function(_$CommentDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? name = null,
    Object? profilePic = null,
    Object? comment = null,
    Object? likesCount = null,
    Object? likedUserIds = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$CommentDataImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserIdFirestore,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      profilePic: null == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String,
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      likedUserIds: null == likedUserIds
          ? _value._likedUserIds
          : likedUserIds // ignore: cast_nullable_to_non_nullable
              as List<UserIdFirestore>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentDataImpl extends _CommentData {
  const _$CommentDataImpl(
      {@UserIdFirestoreConverter() required this.userId,
      required this.name,
      required this.profilePic,
      required this.comment,
      this.likesCount = 0,
      @UserIdFirestoreConverter()
      final List<UserIdFirestore> likedUserIds = const [],
      @JsonKey(
          fromJson: NonNullTimestampConverter.timestampToDateTime,
          toJson: NonNullTimestampConverter.dateTimeToTimestamp)
      required this.createdAt,
      @JsonKey(
          fromJson: TimestampConverter.timestampToDateTime,
          toJson: TimestampConverter.dateTimeToTimestamp)
      this.updatedAt})
      : _likedUserIds = likedUserIds,
        super._();

  factory _$CommentDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentDataImplFromJson(json);

  @override
  @UserIdFirestoreConverter()
  final UserIdFirestore userId;
  @override
  final String name;
  @override
  final String profilePic;
  @override
  final String comment;
  @override
  @JsonKey()
  final int likesCount;
  final List<UserIdFirestore> _likedUserIds;
  @override
  @JsonKey()
  @UserIdFirestoreConverter()
  List<UserIdFirestore> get likedUserIds {
    if (_likedUserIds is EqualUnmodifiableListView) return _likedUserIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedUserIds);
  }

  @override
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  final DateTime createdAt;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'CommentData(userId: $userId, name: $name, profilePic: $profilePic, comment: $comment, likesCount: $likesCount, likedUserIds: $likedUserIds, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentDataImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            const DeepCollectionEquality()
                .equals(other._likedUserIds, _likedUserIds) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      name,
      profilePic,
      comment,
      likesCount,
      const DeepCollectionEquality().hash(_likedUserIds),
      createdAt,
      updatedAt);

  /// Create a copy of CommentData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentDataImplCopyWith<_$CommentDataImpl> get copyWith =>
      __$$CommentDataImplCopyWithImpl<_$CommentDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentDataImplToJson(
      this,
    );
  }
}

abstract class _CommentData extends CommentData {
  const factory _CommentData(
      {@UserIdFirestoreConverter() required final UserIdFirestore userId,
      required final String name,
      required final String profilePic,
      required final String comment,
      final int likesCount,
      @UserIdFirestoreConverter() final List<UserIdFirestore> likedUserIds,
      @JsonKey(
          fromJson: NonNullTimestampConverter.timestampToDateTime,
          toJson: NonNullTimestampConverter.dateTimeToTimestamp)
      required final DateTime createdAt,
      @JsonKey(
          fromJson: TimestampConverter.timestampToDateTime,
          toJson: TimestampConverter.dateTimeToTimestamp)
      final DateTime? updatedAt}) = _$CommentDataImpl;
  const _CommentData._() : super._();

  factory _CommentData.fromJson(Map<String, dynamic> json) =
      _$CommentDataImpl.fromJson;

  @override
  @UserIdFirestoreConverter()
  UserIdFirestore get userId;
  @override
  String get name;
  @override
  String get profilePic;
  @override
  String get comment;
  @override
  int get likesCount;
  @override
  @UserIdFirestoreConverter()
  List<UserIdFirestore> get likedUserIds;
  @override
  @JsonKey(
      fromJson: NonNullTimestampConverter.timestampToDateTime,
      toJson: NonNullTimestampConverter.dateTimeToTimestamp)
  DateTime get createdAt;
  @override
  @JsonKey(
      fromJson: TimestampConverter.timestampToDateTime,
      toJson: TimestampConverter.dateTimeToTimestamp)
  DateTime? get updatedAt;

  /// Create a copy of CommentData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentDataImplCopyWith<_$CommentDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

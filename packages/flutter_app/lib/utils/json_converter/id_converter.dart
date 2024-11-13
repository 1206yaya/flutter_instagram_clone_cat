import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/user/domain/user_id_firestore.dart';

/// A JsonConverter for [UserIdFirestore] that converts between [String] and [UserIdFirestore].
///
/// This converter is used to serialize and deserialize [UserIdFirestore] objects when working
/// with JSON data and Firestore documents.
class UserIdFirestoreConverter
    implements JsonConverter<UserIdFirestore, String> {
  /// Creates a const instance of [UserIdFirestoreConverter].
  const UserIdFirestoreConverter();

  /// Converts a JSON string to a [UserIdFirestore] instance.
  ///
  /// The [json] parameter is expected to be a string representing the user ID.
  @override
  UserIdFirestore fromJson(String json) => UserIdFirestore(value: json);

  /// Converts a [UserIdFirestore] instance to a JSON string.
  ///
  /// The [object] parameter is the [UserIdFirestore] instance to be converted.
  @override
  String toJson(UserIdFirestore object) => object.value;
}

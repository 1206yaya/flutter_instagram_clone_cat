import "package:flutter_app/features/dashboard/presentation/edit_profile/profile_field_type.dart";
import "package:flutter_app/features/user/application/user_service.dart";
import "package:flutter_app/features/user/domain/user_firestore.dart";
import "package:flutter_app/features/user/domain/user_id_firestore.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "profile_edit_controller.g.dart";

@riverpod
class ProfileEditState extends _$ProfileEditState {
  @override
  FutureOr<UserFirestore> build(UserIdFirestore userId) async {
    final user = await ref.watch(userStreamProvider(userId).future);
    if (user == null) {
      throw Exception("User not found");
    }
    return user;
  }

  Future<bool> updateField(ProfileFieldType fieldType, String value) async {
    final currentProfile = state.valueOrNull;
    if (currentProfile == null) return false;

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final updatedProfile = fieldType.updateValue(currentProfile, value);
      final uid = currentProfile.uid;

      switch (fieldType) {
        case ProfileFieldType.displayName:
          await ref.read(userServiceProvider).updateUserDisplayName(
                uid: uid,
                displayName: value,
              );
        case ProfileFieldType.bio:
          await ref.read(userServiceProvider).updateUserBio(
                uid: uid,
                bio: value,
              );
      }
      return updatedProfile;
    });
    return !state.hasError;
  }
}

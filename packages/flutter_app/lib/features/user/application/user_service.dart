import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/providers/uuid_provider.dart';
import '../../../utils/storage/storage_file_name.dart';
import '../../authentication/application/auth_service.dart';
import '../../storage/application/storage_service.dart';
import '../data/user_repository.dart';
import '../domain/user_data.dart';
import '../domain/user_firestore.dart';
import '../domain/user_id_firestore.dart';

part 'user_service.g.dart';

class UserService {
  UserService({
    required this.userRepo,
    required this.storageService,
    required this.uuid,
    required this.authService,
  });

  final AuthService authService;
  final UserRepository userRepo;
  final StorageService storageService;
  final Uuid uuid;
  Stream<UserFirestore?> watchUser([UserIdFirestore? userId]) {
    final targetUid = userId ?? authService.currentUserIdFirestore;
    return userRepo.watchUser(targetUid);
  }

  Future<void> uploadImage({
    required File image,
  }) async {
    final uidFirestore = authService.currentUserIdFirestore;
    final uid = uidFirestore.value;
    final currentProfile = await userRepo.findByUid(uidFirestore);

    // 2. 既存の画像があれば削除
    if (currentProfile.data.photoUrl.isNotEmpty) {
      await storageService.deleteFile(currentProfile.data.photoUrl);
    }

    final fileName = StorageFileName.generate(uuid: uuid);
    final uploadPath = 'profile_images/$uid/$fileName';
    final imageUrl =
        await storageService.uploadFile(uploadPath: uploadPath, file: image);

    await _updateUserField(
      uid: authService.currentUserIdFirestore,
      field: UserData.photoUrlField,
      value: imageUrl,
    );
  }

  Future<void> _updateUserField({
    required UserIdFirestore uid,
    required String field,
    required dynamic value,
  }) async {
    await userRepo.updateUserField(
      uid: uid,
      field: field,
      value: value,
    );
  }

  Future<void> updateUserBio({
    required UserIdFirestore uid,
    required String bio,
  }) async {
    await _updateUserField(
      uid: uid,
      field: UserData.bioField,
      value: bio,
    );
  }

  Future<void> updateUserDisplayName({
    required UserIdFirestore uid,
    required String displayName,
  }) async {
    await _updateUserField(
      uid: uid,
      field: UserData.displayNameField,
      value: displayName,
    );
  }
}

@Riverpod(keepAlive: true)
UserService userService(UserServiceRef ref) {
  return UserService(
    userRepo: ref.watch(userRepositoryProvider),
    authService: ref.watch(authServiceProvider),
    storageService: ref.watch(storageServiceProvider),
    uuid: ref.watch(uuidProvider),
  );
}

@riverpod
Stream<UserFirestore?> userStream(
  UserStreamRef ref, [
  UserIdFirestore? userId,
]) {
  // uid が指定されていない場合は現在のユーザーの情報を取得
  final targetUid =
      userId ?? ref.read(authServiceProvider).currentUserIdFirestore;
  return ref.watch(userServiceProvider).watchUser(targetUid);
}

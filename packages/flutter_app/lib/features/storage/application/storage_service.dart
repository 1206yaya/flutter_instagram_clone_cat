import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../../utils/firebase/firebase_service.dart';
import '../../../utils/providers/uuid_provider.dart';

part 'storage_service.g.dart';

class StorageService {
  StorageService({
    required this.storage,
    required this.uuid,
  });

  final FirebaseStorage storage;
  final Uuid uuid;

  Future<String> uploadFile({
    required String uploadPath,
    required File file,
  }) async {
    try {
      final ref = storage.ref().child(uploadPath);
      await ref.putFile(file);
      return ref.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  Future<void> deleteFile(String imageUrl) async {
    final path = _extractStoragePath(imageUrl);
    final ref = storage.ref().child(path);
    await ref.delete();
  }

  String _extractStoragePath(String downloadUrl) {
    try {
      final uri = Uri.parse(downloadUrl);
      // URLからパスを抽出 (/o/以降の?の前までを取得)
      final fullPath = uri.path.split('/o/').last.split('?').first;
      // URLデコード
      return Uri.decodeComponent(fullPath);
    } catch (e) {
      throw Exception('Failed to parse storage path from URL: $downloadUrl');
    }
  }
}

@riverpod
StorageService storageService(StorageServiceRef ref) {
  return StorageService(
    storage: ref.watch(firebaseStorageProvider),
    uuid: ref.watch(uuidProvider),
  );
}

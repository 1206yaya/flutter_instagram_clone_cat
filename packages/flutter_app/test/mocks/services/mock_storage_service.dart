import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_app/features/storage/application/storage_service.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseStorageError extends MockFirebaseStorage {
  @override
  Reference ref([String? path]) {
    throw FirebaseException(plugin: 'storage', message: 'Test error');
  }
}

class MockStorageService extends Mock implements StorageService {
  @override
  Future<String> uploadFile({
    required String uploadPath,
    required File file,
  }) {
    return super.noSuchMethod(
      Invocation.method(
        #uploadFile,
        [],
        {
          #uploadPath: uploadPath,
          #file: file,
        },
      ),
      returnValue: Future.value('https://example.com/test.jpg'),
    ) as Future<String>;
    // returnValue: Future.value(""),
  }
}

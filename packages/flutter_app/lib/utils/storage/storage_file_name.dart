import 'package:clock/clock.dart';
import 'package:uuid/uuid.dart';

abstract interface class StorageFileName {
  const StorageFileName._();

  static String generate({
    required Uuid uuid,
    String extension = 'jpg',
  }) {
    return '${clock.now().millisecondsSinceEpoch}_${uuid.v4()}.$extension';
  }
}

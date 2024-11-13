abstract class AppException implements Exception {
  const AppException(this.message, [this.error]);

  final String message;
  final Object? error;

  @override
  String toString() {
    if (error != null) {
      // デバッグモードかどうかをチェック
      var isDebugMode = false;
      assert(() {
        isDebugMode = true;
        return true;
      }());

      // デバッグモードの場合は詳細なエラー情報を含める
      if (isDebugMode) {
        return '$message (Error: $error)';
      }
    }
    return message;
  }
}

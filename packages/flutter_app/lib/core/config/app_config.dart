class AppConfig {
  static const timeline = TimelineConfig();
}

class TimelineConfig {
  const TimelineConfig();

  static const defaultPageSize = 3;

  int get pageSize => defaultPageSize;

  // 必要に応じて他のタイムライン関連の設定を追加
  // Duration get refreshInterval => const Duration(minutes: 5);
  // int get maxCachedPosts => 100;
}

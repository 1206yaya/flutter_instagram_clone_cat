## はじめに

言語: 日本語 | [English](../en/GET_STARTED.md)



## 設計と実装の方針

### プロバイダーの初期化処理

このアプリでは、起動時に必要な初期化処理を`InitializationProvider`で管理しています。

#### 基本的な使い方

```dart
@Riverpod(keepAlive: true)k
Future<void> initialization(InitializationRef ref) async {
  await Future.wait([
    ref.watch(packageInfoInitializingProvider.future),
    ref.watch(userDeviceInitializingProvider.future),
  ]);
}
```

このコードは、アプリ起動時に必要な初期化処理を並行して実行します。初期化中はローディング画面を表示し、エラーが発生した場合はリトライ可能な画面を表示します。

#### エラーハンドリングとリトライ機能

エラー発生時のリトライは以下のように実装されています：

```dart
class InitializationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(initializationProvider)) {
      AsyncError(:final error) => _ErrorPage(
          error,
          // Provider自体を無効化することでリトライを実現
          onRetry: () => ref.invalidate(initializationProvider),
        ),
      _ => const LoadingPage(),
    };
  }
}
```

`ref.invalidate()`を使用することで：

- プロバイダーの状態をリセット
- 初期化処理を再実行
- 新しい初期化処理の状態に応じて UI を更新

という流れでリトライを実現しています。

#### なぜこの方法を選んだのか？

初期化処理には 2 つの方法があります：

1. **現在の方法（InitializationProvider）**

```dart
// 初期化の状態に応じて画面を切り替え
return switch (ref.watch(initializationProvider)) {
  AsyncData(_) => const HomePage(),
  AsyncError(_) => const ErrorPage(),
  _ => const LoadingPage(),
};
```

2. **単純なオーバーライド方式**

```dart
void main() {
  // アプリ起動時に一度だけ初期化
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(/*...*/),
    ],
  );
}
```

単純なオーバーライド方式は簡単ですが、次のような場合に問題が発生します：

- 初期化に失敗したときの再試行が難しい
- 初期化中の画面表示が制御しづらい
- エラーが発生したときの対応が複雑になる

そのため、このアプリでは`InitializationProvider`を使用して：

- 初期化の進行状況を表示
- エラー時の再試行を可能に
- 画面遷移を適切に制御

という機能を実現しています。

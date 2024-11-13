## はじめに

言語: 日本語 | [English](../en/GET_STARTED.md)

# Flutter アプリテンプレートの使用例

## フレーバーとアプリ ID

- dev: com.u1206yaya.FlutterAppTemplate.dev
- stg: com.u1206yaya.FlutterAppTemplate.stg
- prod: com.u1206yaya.FlutterAppTemplate

## 機能

- Riverpod の使用例
- テーマセレクター

## アプリ設定

| カテゴリ                                 | 説明                   | コード                                           |
| ---------------------------------------- | ---------------------- | ------------------------------------------------ |
| [FVM](https://github.com/leoafarias/fvm) | Flutter バージョン管理 | [.fvmrc](../../.fvmrc)                           |
| Dart                                     | Dart バージョン        | [pubspec.yaml](./pubspec.yaml)                   |
| Dart                                     | リント/解析            | [analysis_options.yaml](./analysis_options.yaml) |

## 依存パッケージ

### 状態管理

- [Riverpod](https://riverpod.dev/)

### コード生成

- [freezed](https://pub.dev/packages/freezed)
- [json_serializable](https://pub.dev/packages/json_serializable)

### Hooks

- [Flutter Hooks](https://pub.dev/packages/flutter_hooks)

### ルーター

- [go_router](https://pub.dev/packages/go_router)

## アプリ構造

- lib/
  - commons/
  - features/
  - presentation/
  - main.dart

## リリースに必要な秘密ファイル

`--release`モードでのみ必要です。

- android/key.properties
- android/app/upload-keystore.jks

jks ファイルは継続的デリバリーで使用されるため、Base64 に変換して Secret として登録されています。

```
base64 --input upload-keystore.jks | pbcopy
```

## 使用方法

### ローカライゼーション

JSON ファイルを作成します。

```json
{
  "hello": "Hello $name",
  "save": "Save",
  "login": {
    "success": "Logged in successfully",
    "fail": "Logged in failed"
  }
}
```

Dart ファイルを生成します。

```shell
dart run slang
```

生成されたファイルを使用します。

```dart
import '../../../gen/strings.g.dart';

final t = Translations.of(context);
```

## FlutterFire 設定

再実行が必要な場合：

- 新しいプラットフォームのサポートを追加する
- 新しい Firebase サービスや製品の使用を開始する

```shell
# Dev
flutterfire configure --yes \
--project flutter-app-template-dev \
--out lib/environment/src/firebase_options_dev.dart \
--platforms android,ios,macos,web \
--android-package-name com.u1206yaya.FlutterAppTemplate.dev \
--ios-bundle-id com.u1206yaya.FlutterAppTemplate.dev \
--macos-bundle-id com.u1206yaya.FlutterAppTemplate.dev

# Stg
flutterfire configure --yes \
--project flutter-app-template-stg \
--out lib/environment/src/firebase_options_stg.dart \
--platforms android,ios,macos,web \
--android-package-name com.u1206yaya.FlutterAppTemplate.stg \
--ios-bundle-id com.u1206yaya.FlutterAppTemplate.stg \
--macos-bundle-id com.u1206yaya.FlutterAppTemplate.stg

# Prod
flutterfire configure --yes \
--project altive-fat \
--out lib/environment/src/firebase_options_prod.dart \
--platforms android,ios,macos,web \
--android-package-name com.u1206yaya.FlutterAppTemplate \
--ios-bundle-id com.u1206yaya.FlutterAppTemplate \
--macos-bundle-id com.u1206yaya.FlutterAppTemplate
```

### Firebase Analytics DebugView

#### Android の DebugView の開始/停止

```shell
# 開始
adb shell setprop debug.firebase.analytics.app com.u1206yaya.FlutterAppTemplate.dev
# 停止
adb shell setprop debug.firebase.analytics.app .none.
```

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

#### 使用時の注意点

- 初期化処理は必要最小限にする
  - アプリの起動時間に影響するため、本当に必要な処理のみを含める
- 初期化中のユーザー体験を考慮する
  - 長時間の処理がある場合は、進行状況を表示することを検討
- エラー発生時の対応を忘れずに実装する
  - エラーメッセージは具体的で分かりやすいものにする
  - リトライ機能は必ず実装する

より複雑な初期化処理が必要な場合や、エラーハンドリングが重要な場合に、このパターンの使用をお勧めします。

## はじめに

言語: 日本語 | [English](/docs/en/GET_STARTED.md)

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

<a href="https://www.youtube.com/watch?v=BaXj4c58AGQ">
<img src="./docs/images/youtube_thumbnail.png" alt="App Demo" width="400">
</a>

このプロジェクトは、[1206yaya/flutter_app_template](https://github.com/1206yaya/flutter_app_template) をベースに Flutter アプリケーション開発のデモンストレーションとして作成した、Instagram のクローンアプリです。

## 主要機能

- 認証システム: Firebase Authentication を利用したメール/パスワード認証
- タイムライン表示: 投稿の 無限スクロール/リフレッシュ 対応
- 投稿機能: 画像投稿、説明文、位置情報の追加
- いいね/コメント: リアルタイムな投稿へのインタラクション
- プロフィール管理: ユーザー情報の表示と編集
- フォロー機能: ユーザー間のフォロー/フォロワー関係の管理
- ダークモード: システム設定に連動したテーマ切り替え
- 多言語対応: 日本語/英語

## 技術スタック

### フロントエンド

- Flutter 3.x
- Riverpod
- freezed
- go_router

### バックエンド (Firebase)

- Firebase Authentication
- Cloud Firestore
- Firebase Storage
- Firebase Analytics
- Firebase Crashlytics

### テスト

- flutter_test (Widget Tests)
- integration_test
- firebase_auth_mocks
- fake_cloud_firestore
- firebase_storage_mocks

## セットアップ方法

### 1. 必要条件

- Flutter SDK 3.x
- Firebase CLI
- Make
- FVM
- Melos

### 2. リポジトリのクローン

```shell
git clone https://github.com/1206yaya/flutter_instagram_clone_cat
cd flutter_instagram_clone_cat
```

### 3. 依存関係のインストール

```shell
make
```

このコマンドで以下がインストールされます：

- FVM
- Melos
- FlutterFire CLI

### 4. Firebase プロジェクトの設定

作業ディレクトリを `packages/flutter_app` に移動します：

```shell
cd packages/flutter_app
```

以降の 開発用の Firebase 設定は、このディレクトリで作業を行います。

1. Firebase コンソールで新規プロジェクトを作成
2. Android アプリの設定

- Firebase コンソールで `com.u1206yaya.FlutterAppTemplate.dev` をパッケージ名として Android アプリを作成
- google-services.json をダウンロード
- android/app/src/dev に配置

3. iOS アプリの設定

- Firebase コンソールで `com.u1206yaya.FlutterAppTemplate.dev` をバンドル ID として iOS アプリを作成
- GoogleService-Info.plist をダウンロード
- ios/dev に配置

- iOS 用の環境変数を設定：
  `dart_defines/dev.env` を開き、REVERSED_CLIENT_ID を設定
  googleReversedClientId=【GoogleService-Info.plist 内の REVERSED_CLIENT_ID の値】

必要であれば dart_defines/stg.env と dart_defines/prod.env も設定

1. アプリの起動

packages/flutter_app ディレクトリで開発モードで実行するには以下のコマンドを実行します：

```shell
flutter run \
  --dart-define-from-file=dart_defines/dev.env \
  -t lib/main.dart
```

このコマンドは：

dart_defines/dev.env から環境変数を読み込みます
開発環境用の設定でアプリを起動します

注意：Firebase Emulator を使用する場合は、アプリを起動する前に以下のコマンドでエミュレータを起動してください：

```shell
cd ../../firebase # プロジェクトルートの firebase ディレクトリに移動

firebase emulators:start --import=.seed
```

## パッケージの概要

### `themes`

このパッケージは、Flutter アプリで使用される ThemeData やその他の外観関連データを担当します。

### `util`

このパッケージは、独立したパッケージとして切り出すには小さすぎる汎用的な関数を格納します。

## iOS と macOS 用の Firebase SDK バージョン

[FirebaseSDKVersionTag.txt](FirebaseSDKVersionTag.txt)で指定したい SDK バージョンを管理しています。

↓ 最新バージョンはこちらをクリックしてください。
https://github.com/invertase/firestore-ios-sdk-frameworks/releases

## 参考文献

[国際化ユーザーギルド](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/)
[プレゼンテーションドメイン分離](https://martinfowler.com/bliki/PresentationDomainSeparation.html)
[Flutter アーキテクチャ ブループリント](https://github.com/wasabeef/flutter-architecture-blueprints)

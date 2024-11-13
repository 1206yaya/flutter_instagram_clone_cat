## はじめに

言語: 日本語 | [English](/docs/en/GET_STARTED.md)

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

# Flutter App Template

「Flutter App Template」は、アーキテクチャやプロジェクト構造を含む、Flutter アプリ開発のアプローチをテンプレート化し、紹介するためのプロジェクトです。

このリポジトリはモノレポを採用しており、複数の内部パッケージとアプリで構成されています。

このプロジェクトは、[altive/flutter_app_template](https://github.com/altive/flutter_app_template)をベースにしています。Flutter App Templete は、Flutter アプリを開発するためのアーキテクチャとプロジェクト構造のアプローチを紹介するプロジェクトです。

## パッケージの概要

### `themes`

このパッケージは、Flutter アプリで使用される ThemeData やその他の外観関連データを担当します。

### `util`

このパッケージは、独立したパッケージとして切り出すには小さすぎる汎用的な関数を格納します。

## アプリの概要

### `flutter_app`

これは Flutter アプリ用のテンプレートアプリパッケージです。
dev、stg、prod 環境がセットアップされています。

アプリ ID やアプリ名を変更することで、すぐに別のアプリとして構築を開始できます。

FireAuth による、Email/Password ログインを実装しています。
一連の `integration_test` も含まれています。

<p align="left">
  <img src="docs/images/sign-up.png" width="200">
  <img src="docs/images/sign-out.png" width="200">
</p>

詳細は[`flutter_app/README.md`](/packages/flutter_app/docs/ja/GET_STARTED.md)もご確認ください。

## 開発の始め方

```shell
make
```

`make`コマンドは、FVM や Melos など、必要な Dart パッケージをインストールします。

## このテンプレートを使用して新しいリポジトリを作成した後の ToDO リスト

### プロジェクト全体で文字列を置換する

- バンドル ID（パッケージ名）をあなたのアプリ ID に置き換えてください。
  `com.u1206yaya.FlutterAppTemplate` -> `your.domain.id`

## 各プラットフォームのための Firebase でプロジェクトをコンソールから作成

### Android の作成

Firebase コンソール上で Android アプリを作成し、`google-services.json`をダウンロードして`android/app/src/{dev or stg or prod}`に配置してください。

### iOS の作成

Firebase コンソール上で iOS アプリを作成し、`GoogleService-Info.plist`をダウンロードして`ios/{dev or stg or prod}`に配置してください。

### Web の作成

Web アプリを作成し、`web/index.html`内の`firebaseConfig`のパラメータを Firebase SDK の追加に従って修正してください。

- apiKey, authDomain, databaseURL, projectId, storageBucket, messagingSenderId, appId, measurementId

### dart_defines の修正

- `{flavor}.env`内の`appName`をあなたのアプリ名に変更してください。
- iOS デバイスのために `dart_defines/{dev, stg, pro。d}.env`内の`googleReversedClientId`を iOS の各`GoogleService-Info.plist`の内容に合わせて修正してください。

### Firebase プロジェクト ID の修正

flutter_app と作成した Firebase プロジェクトを使用する設定を行います
flutter_app/Makefile の`PROJECT_ID` `FIREBASE_DEV_PROJECT_ID`と`FIREBASE_PROD_PROJECT_ID`をあなたの Firebase プロジェクト ID に変更してください。

```
make config-dev
```

## トラブルシューティング

```
例外が発生しました
FirebaseException ([core/duplicate-app] A Firebase App named "[DEFAULT]" already exists)
```

Firebase プロジェクトとの設定が完了していない可能性があります。

## パッケージの概要

### `themes`

このパッケージは、Flutter アプリで使用される ThemeData やその他の外観関連データを担当します。

### `util`

このパッケージは、独立したパッケージとして切り出すには小さすぎる汎用的な関数を格納します。

### 設定の概要

build.yaml で、自動コード生成の設定が行われています。
`*provider.dart` `*repository.dart` `*controller.dart` が自動生成されます。

## iOS と macOS 用の Firebase SDK バージョン

[FirebaseSDKVersionTag.txt](FirebaseSDKVersionTag.txt)で指定したい SDK バージョンを管理しています。

↓ 最新バージョンはこちらをクリックしてください。
https://github.com/invertase/firestore-ios-sdk-frameworks/releases

## ISSUE_TEMPLATE の追加

リポジトリに`.github/ISSUE_TEMPLATE`がない場合、`.github`という特別なリポジトリに配置された Issue テンプレートを使用できます。

altive 組織の場合、[altive/.github](https://github.com/altive/.github/)リポジトリの Issue テンプレートもこのリポジトリで機能するはずです。

必要に応じて、上記リポジトリから Issue テンプレートをコピーしてご利用ください。

## 参考文献

[国際化ユーザーギルド](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/)
[プレゼンテーションドメイン分離](https://martinfowler.com/bliki/PresentationDomainSeparation.html)
[Flutter アーキテクチャ ブループリント](https://github.com/wasabeef/flutter-architecture-blueprints)

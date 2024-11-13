## Get Started

Language: English | [日本語](/docs/ja/GET_STARTED.md)

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

# Flutter App Template

"Flutter App Template" is a project that templates and introduces approaches to Flutter app development, including architecture and project structure.

This repository adopts a monorepo approach and consists of multiple internal packages and apps.

This project is based on [altive/flutter_app_template](https://github.com/altive/flutter_app_template). Flutter App Template is a project that introduces architectural and project structure approaches for developing Flutter applications.

## Package Overview

### `themes`

This package is responsible for ThemeData and other appearance-related data used in Flutter apps.

### `util`

This package stores general-purpose functions that are too small to be separated into independent packages.

## App Overview

### `flutter_app`

This is a template app package for Flutter applications.
Dev, stg, and prod environments are set up.

You can start building it as a different app by changing the app ID and app name.
Implementing Email/Password login using FireAuth.
`Integration tests` are also included.

<p align="left">
  <img src="docs/images/sign-up.png" width="200">
  <img src="docs/images/sign-out.png" width="200">
</p>

For more details, please check [`flutter_app/README.md`](/packages/flutter_app/docs/en/GET_STARTED.md).

## Getting Started with Development

```shell
make
```

The `make` command installs necessary Dart packages like FVM and Melos.

## TODO List After Creating a New Repository Using This Template

### Replace Strings Across the Project

- Replace the bundle ID (package name) with your app ID
  `com.u1206yaya.FlutterAppTemplate` -> `your.domain.id`

## Create Firebase Projects from Console for Each Platform

### Android Setup

Create an Android app in the Firebase console, download `google-services.json`, and place it in `android/app/src/{dev or stg or prod}`.

### iOS Setup

Create an iOS app in the Firebase console, download `GoogleService-Info.plist`, and place it in `ios/{dev or stg or prod}`.

### Web Setup

Create a web app and modify the `firebaseConfig` parameters in `web/index.html` according to the Firebase SDK addition instructions.

- apiKey, authDomain, databaseURL, projectId, storageBucket, messagingSenderId, appId, measurementId

### Modify dart_defines

- Change the `appName` in `{flavor}.env` to your app name.
- For iOS devices, modify the `googleReversedClientId` in `dart_defines/{dev, stg, prod}.env` to match the contents of each iOS `GoogleService-Info.plist`.

### Modify Firebase Project ID

Configure flutter_app to use your created Firebase project
Change `PROJECT_ID`, `FIREBASE_DEV_PROJECT_ID`, and `FIREBASE_PROD_PROJECT_ID` in flutter_app/Makefile to your Firebase project IDs.

```
make config-dev
```

## Troubleshooting

```
Exception occurred
FirebaseException ([core/duplicate-app] A Firebase App named "[DEFAULT]" already exists)
```

The Firebase project configuration might not be completed.

## Package Overview

### `themes`

This package is responsible for ThemeData and other appearance-related data used in Flutter apps.

### `util`

This package stores general-purpose functions that are too small to be separated into independent packages.

### Configuration Overview

Automatic code generation settings are configured in build.yaml.
`*provider.dart`, `*repository.dart`, and `*controller.dart` are automatically generated.

## Firebase SDK Version for iOS and macOS

The desired SDK version is managed in [FirebaseSDKVersionTag.txt](FirebaseSDKVersionTag.txt).

↓ Click here for the latest version:
https://github.com/invertase/firestore-ios-sdk-frameworks/releases

## Adding ISSUE_TEMPLATE

If the repository doesn't have `.github/ISSUE_TEMPLATE`, you can use issue templates placed in a special `.github` repository.

For the altive organization, issue templates from the [altive/.github](https://github.com/altive/.github/) repository should work in this repository.

Please copy the issue templates from the above repository as needed.

## References

[Internationalization User Guide](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/)
[Presentation Domain Separation](https://martinfowler.com/bliki/PresentationDomainSeparation.html)
[Flutter Architecture Blueprints](https://github.com/wasabeef/flutter-architecture-blueprints)

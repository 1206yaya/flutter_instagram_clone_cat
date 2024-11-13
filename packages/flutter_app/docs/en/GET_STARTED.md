## Get Started

Language: English | [日本語](../ja/GET_STARTED.md)

# Examples app of Flutter App Template

## Flavor with App ID

- dev: com.u1206yaya.FlutterAppTemplate.dev
- stg: com.u1206yaya.FlutterAppTemplate.stg
- prod: com.u1206yaya.FlutterAppTemplate

## Features

- Riverpod examples
- Theme selector

## App settings

| Category                                 | Description                | Codes                                            |
| ---------------------------------------- | -------------------------- | ------------------------------------------------ |
| [FVM](https://github.com/leoafarias/fvm) | Flutter Version Management | [.fvmrc](../../.fvmrc)                           |
| Dart                                     | Dart version               | [pubspec.yaml](./pubspec.yaml)                   |
| Dart                                     | Lint / Analyze             | [analysis_options.yaml](./analysis_options.yaml) |

## Dependency Packages

### State Management

- [Riverpod](https://riverpod.dev/)

### Code Generation

- [freezed](https://pub.dev/packages/freezed)
- [json_serializable](https://pub.dev/packages/json_serializable)

### Hooks

- [Flutter Hooks](https://pub.dev/packages/flutter_hooks)

### Router

- [go_router](https://pub.dev/packages/go_router)

## App structure

- lib/
  - commons/
  - features/
  - presentation/
  - main.dart

## Secret files required for Release

Required only `--release` mode.

- android/key.properties
- android/app/upload-keystore.jks

The jks file was converted to Base64 and registered as Secret because it is used by Continuous Delivery.

```
base64 --input upload-keystore.jks | pbcopy
```

## How to use

### Localizations

Create JSON files.

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

Generate Dart files.

```shell
dart run slang
```

Use the generated file.

```dart
import '../../../gen/strings.g.dart';

final t = Translations.of(context);
```

## FlutterFire Configure

When should it be re-run?

- Add support for new platforms
- Start using new Firebase services and products

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

#### Start/Stop DebugView for Android

```shell
# Start
adb shell setprop debug.firebase.analytics.app com.u1206yaya.FlutterAppTemplate.dev
# Stop
adb shell setprop debug.firebase.analytics.app .none.
```

## Design and Implementation Guidelines

### Provider Initialization Process

In this app, necessary initialization processes are managed by `InitializationProvider`.

#### Basic Usage

```dart
@Riverpod(keepAlive: true)
Future<void> initialization(InitializationRef ref) async {
  await Future.wait([
    ref.watch(packageInfoInitializingProvider.future),
    ref.watch(userDeviceInitializingProvider.future),
  ]);
}
```

This code executes necessary initialization processes in parallel during app startup. During initialization, a loading screen is displayed, and if an error occurs, a screen with retry functionality is shown.

#### Error Handling and Retry Functionality

Retry functionality for error cases is implemented as follows:

```dart
class InitializationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(initializationProvider)) {
      AsyncError(:final error) => _ErrorPage(
          error,
          // Achieve retry by invalidating the provider itself
          onRetry: () => ref.invalidate(initializationProvider),
        ),
      _ => const LoadingPage(),
    };
  }
}
```

Using `ref.invalidate()`, we achieve retry through the following flow:

- Reset the provider state
- Re-execute initialization process
- Update UI according to the new initialization state

#### Why We Chose This Approach

There are two methods for initialization:

1. **Current Method (InitializationProvider)**

```dart
// Switch screens based on initialization state
return switch (ref.watch(initializationProvider)) {
  AsyncData(_) => const HomePage(),
  AsyncError(_) => const ErrorPage(),
  _ => const LoadingPage(),
};
```

2. **Simple Override Method**

```dart
void main() {
  // Initialize once at app startup
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(/*...*/),
    ],
  );
}
```

While the simple override method is easier, it presents problems in the following cases:

- Difficult to retry when initialization fails
- Hard to control screen display during initialization
- Error handling becomes complex

Therefore, this app uses `InitializationProvider` to achieve:

- Display initialization progress
- Enable retry on error
- Properly control screen transitions

#### Usage Considerations

- Keep initialization processes minimal
  - Include only truly necessary processes as they affect app startup time
- Consider user experience during initialization
  - Consider displaying progress for long-running processes
- Don't forget to implement error handling
  - Make error messages specific and easy to understand
  - Always implement retry functionality

This pattern is recommended when more complex initialization processes are needed or when error handling is crucial.

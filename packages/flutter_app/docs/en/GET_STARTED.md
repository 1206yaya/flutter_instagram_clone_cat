## Introduction

Language: [Japanese](../ja/GET_STARTED.md) | English

## Design and Implementation Guidelines

### Provider Initialization Process

This app manages necessary initialization processes at startup using `InitializationProvider`.

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

This code executes required initialization processes in parallel during app startup. A loading screen is displayed during initialization, and if an error occurs, a screen with retry functionality is shown.

#### Error Handling and Retry Functionality

Retry functionality for error cases is implemented as follows:

```dart
class InitializationPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(initializationProvider)) {
      AsyncError(:final error) => _ErrorPage(
          error,
          // Implement retry by invalidating the provider itself
          onRetry: () => ref.invalidate(initializationProvider),
        ),
      _ => const LoadingPage(),
    };
  }
}
```

Using `ref.invalidate()` achieves retry functionality through the following flow:

- Reset the provider state
- Re-execute initialization process
- Update UI according to the new initialization state

#### Why We Chose This Approach

There are two methods for handling initialization:

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

The simple override method is straightforward but presents several challenges:

- Difficult to implement retry functionality when initialization fails
- Limited control over screen display during initialization
- Complex error handling

Therefore, this app uses `InitializationProvider` to achieve:

- Display initialization progress
- Enable retry functionality on error
- Properly control screen transitions

import 'dart:isolate';

import 'package:altfire_tracker/altfire_tracker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'environment/environment.dart';
import 'gen/strings.g.dart';
import 'main_app.dart';
import 'package_adaptor/tracker_provider.dart';
import 'utils/logger/provider_logger.dart';
import 'utils/providers/shared_preferences_provider.dart';

class AppBootstrap {
  AppBootstrap({required this.flavor});

  final Flavor flavor;
  late final Tracker tracker;
  late final SharedPreferences sharedPreferences;

  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initializeFirebase();
    await _initializeLocale();
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp(options: firebaseOptionsWithFlavor(flavor));
    await _initializeTracker();
    if (kDebugMode) {
      await connectToFirebaseEmulator();
    }
  }

  Future<void> connectToFirebaseEmulator() async {
    // const localhost = 'localhost';
    //* execute in terminal: pconfig getifaddr en0
    const localhost = '192.168.11.5'; // 実機確認用
    const authPort = 9099;
    const firestorePort = 8080;
    const storagePort = 9199;

    await FirebaseAuth.instance.useAuthEmulator(localhost, authPort);
    FirebaseFirestore.instance.useFirestoreEmulator(localhost, firestorePort);
    FirebaseFirestore.instance.settings = const Settings(
      host: '$localhost:8080',
      sslEnabled: false,
      persistenceEnabled: false,
    );
    FirebaseStorage.instance.useStorageEmulator(localhost, storagePort);

    print('Connected to Firebase Emulator Suite');
  }

  Future<void> _initializeTracker() async {
    tracker = Tracker();
    FlutterError.onError = tracker.onFlutterError;
    PlatformDispatcher.instance.onError = tracker.onPlatformError;
    if (!kIsWeb) {
      Isolate.current.addErrorListener(tracker.isolateErrorListener());
    }
  }

  Future<void> _initializeLocale() async {
    LocaleSettings.useDeviceLocale();
  }

  Widget buildApp() {
    return ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        trackerProvider.overrideWithValue(tracker),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      observers: [ProviderLogger()],
      child: TranslationProvider(
        child: const MainApp(),
      ),
    );
  }
}

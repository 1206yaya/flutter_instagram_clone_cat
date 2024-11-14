import 'package:altfire_tracker/altfire_tracker.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/environment/environment.dart';
import 'package:flutter_app/features/initialization/application/initialization_provider.dart';
import 'package:flutter_app/gen/strings.g.dart';
import 'package:flutter_app/main_app.dart';
import 'package:flutter_app/utils/firebase/firebase_service.dart';
import 'package:flutter_app/utils/providers/shared_preferences_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../mocks/overrides/override_auth_providers.dart';
import '../mocks/overrides/override_tracker_providers.dart';
import '../mocks/overrides/override_user_device_info.dart';
import '../mocks/providers/setup_firebase_mocks.dart';
import 'authentication/sign_in_up_screen_robot.dart';
import 'robot.mocks.dart';
import 'settings/presentation/account/account_screen_robot.dart';
import 'settings/presentation/settings/settings_screen_robot.dart';
import 'timeline/presentation/timeline_screen_robot.dart';

@GenerateMocks([FirebaseCrashlytics, FirebaseAnalytics])
class Robot {
  Robot(this.tester)
      : signInUp = SignInUpScreenRobot(tester),
        timeline = TimelineScreenRobot(tester),
        settings = SettingsScreenRobot(tester),
        account = AccountScreenRobot(tester);

  final WidgetTester tester;
  final SignInUpScreenRobot signInUp;
  final TimelineScreenRobot timeline;
  final SettingsScreenRobot settings;
  final AccountScreenRobot account;
  late MockFirebaseCrashlytics mockCrashlytics;
  late MockFirebaseAnalytics mockAnalytics;
  late final Translations translations;
  late Tracker tracker;
  Future<void> pumpMyAppWithFake() async {
    WidgetsFlutterBinding.ensureInitialized();

    setupFirebaseAuthMocks();

    mockCrashlytics = MockFirebaseCrashlytics();
    mockAnalytics = MockFirebaseAnalytics();

    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [
        initializationProvider.overrideWith((ref) => Future.value()),
        ...userDeviceMocksOverrides,
        ...getTrackerMocksOverrides(
          crashlytics: mockCrashlytics,
          analytics: mockAnalytics,
        ),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        flavorProvider.overrideWithValue(Flavor.values.byName('dev')),
        ...firebaseAuthMocksOverrides,
        firebaseFirestoreProvider.overrideWithValue(FakeFirebaseFirestore()),
        firebaseStorageProvider.overrideWithValue(MockFirebaseStorage()),
      ],
    );
    await tester.pumpWidget(
      UncontrolledProviderScope(
        container: container,
        child: TranslationProvider(child: const MainApp()),
      ),
    );
    await tester.pumpAndSettle();
  }
}

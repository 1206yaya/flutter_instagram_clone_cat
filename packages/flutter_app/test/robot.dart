import 'package:altfire_tracker/altfire_tracker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/environment/environment.dart';
import 'package:flutter_app/gen/strings.g.dart';
import 'package:flutter_app/main_app.dart';
import 'package:flutter_app/package_adaptor/tracker_provider.dart';
import 'package:flutter_app/util/providers/shared_preferences_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zakfire_authenticator/zakfire_authenticator.dart';

import 'features/authentication/presentation/sign_in_up/sign_in_up_screen_robot.dart';
import 'pages/account/account_page_robot.dart';
import 'pages/home_page/home_screen_robot.dart';
import 'pages/settings_page/settings_page_robot.dart';

class Robot {
  Robot(this.tester)
      : signInUp = SignInUpScreenRobot(tester),
        home = HomeScreenRobot(tester),
        settings = SettingsPageRobot(tester),
        account = AccountPageRobot(tester);

  final WidgetTester tester;
  final SignInUpScreenRobot signInUp;
  final HomeScreenRobot home;
  final SettingsPageRobot settings;
  final AccountPageRobot account;

  late final Translations translations;

  Future<void> pumpMyApp() async {
    SharedPreferences.setMockInitialValues({});
    final sharedPreferences = await SharedPreferences.getInstance();
    final flavor = Flavor.values.byName('dev');
    await Firebase.initializeApp(options: firebaseOptionsWithFlavor(flavor));
    // Sign out to start with a clean slate
    await FirebaseAuth.instance.signOut();

    final tracker = Tracker();
    LocaleSettings.setLocale(AppLocale.en);
    final container = ProviderContainer(
      overrides: [
        trackerProvider.overrideWithValue(tracker),
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        flavorProvider.overrideWithValue(flavor),
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

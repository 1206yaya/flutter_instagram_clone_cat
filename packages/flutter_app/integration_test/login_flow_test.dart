import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/robot.dart';
import '../test/test_utils.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Should complete full auth flow: login -> home screen -> logout -> login screen',
    (tester) async {
      final r = Robot(tester);
      await r.pumpMyApp();
      // Login
      await r.signInUp.isDisplayed();
      await r.signInUp
          .enterCredentials(email: user.email, password: user.password);
      await r.signInUp.tapSignInButton();
      // Successful login
      await r.home.isDisplayed();
      await r.home.tapSettingsTab();

      // Verify settings page and navigate to account
      await r.settings.isDisplayed();
      await r.settings.tapAccountTile();

      // Verify account page and sign out
      await r.account.isDisplayed();
      await r.account.tapSignOutButton();
      await r.account.confirmSignOut();

      // Verify back to sign in screen
      await r.signInUp.isDisplayed();
    },
  );
}

import 'package:flutter_app/features/timeline/presentation/timeline_screen/timeline_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import '../test/mocks/data/firestore_user.dart';
import '../test/robot/robot.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Should complete full auth flow: login -> home screen -> logout -> login screen',
    (tester) async {
      final r = Robot(tester);
      await r.pumpMyAppWithFake();
      // Login
      r.signInUp.expectSignInFieldsVisible();
      await r.signInUp.enterEmail(mockUser.email!);
      await r.signInUp.enterPassword('password');
      await r.signInUp.tapSignInButton();
      // Timeline
      final timelineScreen = find.byType(TimelineScreen);
      expect(timelineScreen, findsOneWidget);
      await r.timeline.isDisplayed();
      // Login
      await r.timeline.tapSettingsTab();

      // Verify settings page and navigate to account
      await r.settings.isDisplayed();
      await r.settings.tapAccountTile();
      // Verify account page
      await r.account.isDisplayed();
      await r.account.isDisplayText(mockUser.uid);
    },
  );
}

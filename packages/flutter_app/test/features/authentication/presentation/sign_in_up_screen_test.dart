import 'package:flutter_test/flutter_test.dart';

import '../../../robot/authentication/sign_in_up_screen_robot.dart';

void main() {
  setUpAll(TestWidgetsFlutterBinding.ensureInitialized);

  group('Sign Up Flow Tests', () {
    testWidgets('shows all required fields for sign up', (tester) async {
      final robot = await SignInUpScreenRobot.create(tester);
      await robot.pumpSignInUpScreen(isSignIn: false);
      robot.expectSignUpFieldsVisible();
    });

    testWidgets('successful sign up flow', (tester) async {
      final robot = await SignInUpScreenRobot.create(tester);
      await robot.pumpSignInUpScreen(isSignIn: false);

      await robot.enterDisplayName('Test User');
      await robot.enterEmail('test@example.com');
      await robot.enterPassword('password123');
      await robot.tapSignUpButton();

      await robot.verifyUserCreated();
    });
  });

  group('Sign In Flow Tests', () {
    testWidgets('shows correct fields for sign in', (tester) async {
      final robot = await SignInUpScreenRobot.create(tester);
      await robot.pumpSignInUpScreen(isSignIn: true);
      robot.expectSignInFieldsVisible();
    });
  });

  group('Form Toggle Tests', () {
    testWidgets('can toggle between sign in and sign up', (tester) async {
      final robot = await SignInUpScreenRobot.create(tester);
      await robot.pumpSignInUpScreen(isSignIn: true);

      robot.expectSignInFieldsVisible();
      await robot.tapToggleFormButton();
      robot.expectSignUpFieldsVisible();
    });
  });
}

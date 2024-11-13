import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class SignInUpScreenRobot {
  const SignInUpScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> enterCredentials(
      {required String email, required String password}) async {
    await tester.enterText(find.widgetWithText(TextField, 'Email'), email);
    await tester.pump();

    await tester.enterText(
        find.widgetWithText(TextField, 'Password'), password);
    await tester.pump();
  }

  Future<void> tapSignInButton() async {
    await tester.tap(find.widgetWithText(ElevatedButton, 'Sign In'));
    await tester.pumpAndSettle();
  }

  Future<void> isDisplayed() async {
    await tester.pump();
    expect(find.widgetWithText(AppBar, 'Sign In').evaluate().isNotEmpty, true);
  }
}

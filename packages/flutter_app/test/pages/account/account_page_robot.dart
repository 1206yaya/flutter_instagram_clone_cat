// account_robot.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/pages/account/account_page.dart';
import 'package:flutter_test/flutter_test.dart';

class AccountPageRobot {
  const AccountPageRobot(this.tester);
  final WidgetTester tester;

  Future<void> isDisplayed() async {
    await tester.pumpAndSettle();
    expect(find.byType(AccountPage), findsOneWidget);
  }

  Future<void> tapSignOutButton() async {
    expect(find.byKey(const Key('primary-sign-out-button')), findsOneWidget);
    await tester.tap(find.byKey(const Key('primary-sign-out-button')));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(AlertDialog), findsOneWidget);
  }

  Future<void> confirmSignOut() async {
    expect(find.byKey(const Key('alert-sign-out-button')), findsOneWidget);
    await tester.tap(find.byKey(const Key('alert-sign-out-button')));
    await tester.pumpAndSettle();
  }
}

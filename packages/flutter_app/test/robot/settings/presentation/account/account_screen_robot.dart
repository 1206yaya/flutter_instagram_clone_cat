// account_robot.dart
import 'package:flutter/material.dart';
import 'package:flutter_app/features/settings/presentation/account/account_screen.dart';
import 'package:flutter_test/flutter_test.dart';

class AccountScreenRobot {
  const AccountScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> isDisplayed() async {
    await tester.pumpAndSettle();
    expect(find.byType(AccountScreen), findsOneWidget);
  }

  Future<void> tapSignOutButton() async {
    expect(find.byKey(AccountScreen.primarySignOutButtonKey), findsOneWidget);
    await tester.tap(find.byKey(AccountScreen.primarySignOutButtonKey));
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(AlertDialog), findsOneWidget);
  }

  Future<void> isDisplayText(String text) async {
    await tester.pumpAndSettle();
    expect(find.text(text), findsOneWidget);
  }

  Future<void> verifyUidNotEmpty() async {
    await tester.pumpAndSettle();
    final finder = find.byKey(const Key('uidValueKey'));
    final uidText = finder.evaluate().single.widget as Text;
    expect(uidText, isNotEmpty);
  }

  Future<void> confirmSignOut() async {
    expect(find.byKey(AccountScreen.alertSignOutButtonKey), findsOneWidget);
    await tester.tap(find.byKey(AccountScreen.alertSignOutButtonKey));
    await tester.pumpAndSettle();
  }
}

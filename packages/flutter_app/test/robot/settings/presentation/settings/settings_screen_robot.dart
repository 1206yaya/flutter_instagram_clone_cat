import 'package:flutter/material.dart';
import 'package:flutter_app/features/settings/presentation/settings/settings_screen.dart';
import 'package:flutter_test/flutter_test.dart';

class SettingsScreenRobot {
  const SettingsScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> isDisplayed() async {
    await tester.pumpAndSettle();
    expect(find.byType(SettingsScreen), findsOneWidget);
  }

  Future<void> tapAccountTile() async {
    await tester
        .tap(find.byType(ListTile).at(1)); // Account tile is the second item
    await tester.pumpAndSettle();
  }
}

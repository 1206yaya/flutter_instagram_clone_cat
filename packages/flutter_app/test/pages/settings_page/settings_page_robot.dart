import 'package:flutter/material.dart';
import 'package:flutter_app/pages/settings_page/settings_page.dart';
import 'package:flutter_test/flutter_test.dart';

class SettingsPageRobot {
  const SettingsPageRobot(this.tester);
  final WidgetTester tester;

  Future<void> isDisplayed() async {
    await tester.pumpAndSettle();
    expect(find.byType(SettingsPage), findsOneWidget);
  }

  Future<void> tapAccountTile() async {
    await tester
        .tap(find.byType(ListTile).at(1)); // Account tile is the second item
    await tester.pumpAndSettle();
  }
}

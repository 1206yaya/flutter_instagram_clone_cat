import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class HomeScreenRobot {
  const HomeScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> isDisplayed() async {
    await tester.pump();
    expect(find.widgetWithText(AppBar, 'Home').evaluate().isNotEmpty, true);
  }

  
  Future<void> tapSettingsTab() async {
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
  }

}

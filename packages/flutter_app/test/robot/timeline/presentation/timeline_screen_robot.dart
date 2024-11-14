import 'package:flutter/material.dart';
import 'package:flutter_app/features/timeline/presentation/timeline_screen/timeline_screen.dart';
import 'package:flutter_test/flutter_test.dart';

class TimelineScreenRobot {
  const TimelineScreenRobot(this.tester);

  final WidgetTester tester;

  Future<void> isDisplayed() async {
    await tester.pump();
    expect(find.byKey(TimelineScreen.timelineScreenKey), findsOneWidget);
  }

  Future<void> tapSettingsTab() async {
    await tester.tap(find.byIcon(Icons.settings_outlined));
    await tester.pumpAndSettle();
  }
}

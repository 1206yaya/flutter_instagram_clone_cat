import 'package:altfire_tracker/altfire_tracker.dart';
import 'package:flutter_app/package_adaptor/tracker_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../robot/robot.mocks.dart';

// Mock tracker creation helper
Tracker createMockTracker({
  required MockFirebaseCrashlytics crashlytics,
  required MockFirebaseAnalytics analytics,
}) {
  return Tracker(
    crashlytics: crashlytics,
    analytics: analytics,
  );
}

// Override list to use in tests
List<Override> getTrackerMocksOverrides({
  required MockFirebaseCrashlytics crashlytics,
  required MockFirebaseAnalytics analytics,
}) {
  return [
    trackerProvider.overrideWithValue(
      createMockTracker(
        crashlytics: crashlytics,
        analytics: analytics,
      ),
    ),
  ];
}

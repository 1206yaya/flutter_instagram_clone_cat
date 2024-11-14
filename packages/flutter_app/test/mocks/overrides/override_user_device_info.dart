import 'package:flutter_app/utils/user_device/user_device.dart';

const mockIOSDevice = IOSDevice(
  name: 'Test iOS Device',
  model: 'iPhone',
  osName: 'iOS',
  osVersionString: '15.0',
);

// Override list to use in tests
final userDeviceMocksOverrides = [
  userDeviceProvider.overrideWithValue(mockIOSDevice),
];

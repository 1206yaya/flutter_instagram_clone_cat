import 'package:flutter/material.dart';

import 'app_bootstrap.dart';
import 'environment/environment.dart';

//* VSCodeの`launch.json`を使って実行させる必要があります
Future<void> main() async {
  final flavor = Flavor.values.byName(const String.fromEnvironment('flavor'));
  final bootstrap = AppBootstrap(flavor: flavor);
  await bootstrap.initialize();
  runApp(bootstrap.buildApp());
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../gen/strings.g.dart';
import '../../../../router/branches/settings_routers.dart';
import '../../../../router/router.dart';
import '../../../../utils/user_device/user_device_provider.dart';

/// A page for settings.
class SettingsScreen extends StatelessWidget {
  /// Creates a new instance of [SettingsScreen].
  const SettingsScreen({super.key});

  static const settingsScreenKey = Key('settingsScreenKey');
  static const accountTileKey = Key('accountTileKey');

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      key: settingsScreenKey,
      appBar: AppBar(
        title: Text(t.settingsPage.appBar.title),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final userDevice = ref.watch(userDeviceProvider);
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: ListTile(
            onTap: () => const ThemeSelectionRouteData().go(context),
            title: Text(t.settingsPage.list.themeSelector.label),
          ),
        ),
        Card(
          child: ListTile(
            key: SettingsScreen.accountTileKey,
            onTap: () => const AccountRouteData().go(context),
            title: Text(t.settingsPage.list.account.label),
          ),
        ),
        ListTile(
          title: Text(userDevice.name),
          subtitle:
              Text('${userDevice.model}, OS: ${userDevice.osVersionString}'),
        ),
      ],
    );
  }
}
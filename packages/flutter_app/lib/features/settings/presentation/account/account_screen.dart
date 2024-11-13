import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../gen/strings.g.dart';
import '../../../authentication/application/auth_service.dart';

/// A page for account management.
class AccountScreen extends StatelessWidget {
  /// Creates a new instance of [AccountScreen].
  const AccountScreen({super.key});

  static const accountScreenKey = Key('accountScreenKey');
  static const alertSignOutButtonKey = Key('alert-sign-out-button');
  static const primarySignOutButtonKey = Key('primary-sign-out-button');
  static const uidValueKey = Key('uid-value-key');

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      key: accountScreenKey,
      appBar: AppBar(
        title: Text(t.accountPage.appBar.title),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(authServiceProvider).currentUserIdFirestore;
    debugPrint('AccountScreen uid: ${uid.value}');
    final t = Translations.of(context);
    final authenticator = ref.watch(authServiceProvider);
    Future<void> signOut() async {
      final isBool = await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              t.button.sign.out,
            ),
            content: Text(t.button.really),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(t.button.cancel),
              ),
              TextButton(
                key: AccountScreen.alertSignOutButtonKey,
                onPressed: () => Navigator.pop(context, true),
                child: Text(
                  t.button.sign.out,
                ),
              ),
            ],
          );
        },
      );
      if (isBool != true) {
        return;
      }
      await authenticator.signOut();
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ListTile(
          title: const Text('UID:'),
          subtitle: Text(
            key: AccountScreen.uidValueKey,
            uid.value,
          ),
        ),
        TextButton(
          key: AccountScreen.primarySignOutButtonKey,
          onPressed: signOut,
          child: Text(
            t.button.sign.out,
          ),
        ),
      ],
    );
  }
}

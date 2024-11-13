import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../gen/strings.g.dart';
import '../../package_adaptor/authenticator_provider.dart';

/// A page for account management.
class AccountPage extends StatelessWidget {
  /// Creates a new instance of [AccountPage].
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
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
    final t = Translations.of(context);
    final authenticator = ref.watch(authenticatorProvider);
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
                key: const Key('alert-sign-out-button'),
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
          subtitle: Text(ref.watch(userProvider).valueOrNull?.uid ?? 'none'),
        ),
        TextButton(
          key: const Key('primary-sign-out-button'),
          onPressed: signOut,
          child: Text(
            t.button.sign.out,
          ),
        ),
      ],
    );
  }
}

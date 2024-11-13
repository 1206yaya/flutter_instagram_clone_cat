import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/extension/async_value_ui.dart';
import 'sign_in_up_controller.dart';

class SignInUpScreen extends HookConsumerWidget {
  const SignInUpScreen({super.key, required this.isSignIn});

  static const signInUpScreenKey = Key('signInUpScreenKey');
  static const signInKey = Key('signInKey');
  static const signUpKey = Key('signUpKey');
  static const displayNameKey = Key('displayName');
  static const emailKey = Key('email');
  static const passwordKey = Key('password');
  static const signInButtonKey = Key('signInButton');
  static const signUpButtonKey = Key('signUpButton');
  static const toggleFormButtonKey = Key('toggleFormStatusButton');
  static const createAccountTextKey = Key('createAccountText');
  static const AlreadyAccountTextKey = Key('signInText');

  final bool isSignIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final displayNameController = useTextEditingController();
    final isSignInState = useState(isSignIn);

    ref.listen<AsyncValue<void>>(
      signInUpControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Scaffold(
      key: signInUpScreenKey,
      appBar: AppBar(
        title: Text(
          key: isSignInState.value ? signInKey : signUpKey,
          isSignInState.value ? 'Sign In' : 'Sign Up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign ${isSignInState.value ? 'In' : 'Up'}"),
            if (!isSignInState.value) ...[
              const SizedBox(height: 16),
              TextField(
                key: displayNameKey,
                controller: displayNameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
            ],
            const SizedBox(height: 16),
            TextField(
              key: emailKey,
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              key: passwordKey,
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              key: isSignInState.value ? signInButtonKey : signUpButtonKey,
              onPressed: () async {
                final controller =
                    ref.read(signInUpControllerProvider.notifier);
                if (isSignInState.value) {
                  await controller.signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                } else {
                  await controller.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    displayName: displayNameController.text,
                  );
                }
              },
              child: Text(isSignInState.value ? 'Sign In' : 'Sign Up'),
            ),
            TextButton(
              key: toggleFormButtonKey,
              onPressed: () {
                isSignInState.value = !isSignInState.value;
              },
              child: isSignInState.value
                  ? const Text(
                      key: createAccountTextKey,
                      'Create an account',
                    )
                  : const Text(
                      key: AlreadyAccountTextKey,
                      'Already have an account? Sign In',
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

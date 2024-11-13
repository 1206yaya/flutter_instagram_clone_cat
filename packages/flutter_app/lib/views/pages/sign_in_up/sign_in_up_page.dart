import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/unimplemented/unimplemented_controller.dart';

class SignInUpPage extends HookConsumerWidget {
  const SignInUpPage({super.key, required this.isSignIn});

  final bool isSignIn;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final displayNameController = TextEditingController();
    final isSignInState = useState(isSignIn);

    ref.listen<AsyncValue<void>>(
      unimplementedControllerProvider,
      (_, state) {
        if (state.hasError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error.toString())),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: isSignIn ? const Text('Sign In') : const Text('Sign Up'),
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
                controller: displayNameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
            ],
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                final controller =
                    ref.read(unimplementedControllerProvider.notifier);
                // TODO: implement sign in/up
              },
              child: Text(isSignInState.value ? 'Sign In' : 'Sign Up'),
            ),
            TextButton(
              onPressed: () {
                isSignInState.value = !isSignInState.value;
              },
              child: Text(
                isSignInState.value
                    ? 'Create an account'
                    : 'Already have an account? Sign In',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

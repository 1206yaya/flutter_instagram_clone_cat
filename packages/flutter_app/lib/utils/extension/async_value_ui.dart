import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/alert_dialogs.dart';

const showAlertDialogOnErrorKey = Key('showAlertDialogOnErrorKey');

/// A helper [AsyncValue] extension to show an alert dialog on error
extension AsyncValueUI on AsyncValue<void> {
  /// show an alert dialog if the current [AsyncValue] has an error and the
  /// state is not loading.
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final message = _errorMessage(error);
      showExceptionAlertDialog(
        key: showAlertDialogOnErrorKey,
        context: context,
        title: 'Error',
        exception: message,
      );
    }
  }

  String _errorMessage(Object? error) {
    if (error is FirebaseAuthException) {
      return error.message ?? error.toString();
    } else if (error is Exception) {
      return error.toString();
    } else {
      return error.toString();
    }
  }
}

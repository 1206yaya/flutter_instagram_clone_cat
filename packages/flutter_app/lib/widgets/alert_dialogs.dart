import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

const kDialogDefaultKey = Key('dialog-default-key');

/// Generic function to show a platform-aware Material or Cupertino dialog
Future<bool?> showAlertDialog({
  required Key key,
  required BuildContext context,
  required String title,
  String? content,
  String? cancelActionText,
  String defaultActionText = 'OK',
}) async {
  return showDialog(
    context: context,
    // * Only make the dialog dismissible if there is a cancel button
    barrierDismissible: cancelActionText != null,
    // * AlertDialog.adaptive was added in Flutter 3.13
    builder: (context) => AlertDialog.adaptive(
      key: key,
      title: Text(title),
      content: content != null ? Text(content) : null,
      // * Use [TextButton] or [CupertinoDialogAction] depending on the platform
      actions: kIsWeb || !Platform.isIOS
          ? <Widget>[
              if (cancelActionText != null)
                TextButton(
                  child: Text(cancelActionText),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              TextButton(
                key: kDialogDefaultKey,
                child: Text(defaultActionText),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ]
          : <Widget>[
              if (cancelActionText != null)
                CupertinoDialogAction(
                  child: Text(cancelActionText),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              CupertinoDialogAction(
                key: kDialogDefaultKey,
                child: Text(defaultActionText),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
    ),
  );
}

/// Generic function to show a platform-aware Material or Cupertino error dialog
Future<void> showExceptionAlertDialog({
  required Key key,
  required BuildContext context,
  required String title,
  required dynamic exception,
}) =>
    showAlertDialog(
      key: key,
      context: context,
      title: title,
      content: exception.toString(),
    );

Future<void> showNotImplementedAlertDialog({required BuildContext context}) =>
    showAlertDialog(
      key: kDialogDefaultKey,
      context: context,
      title: 'Not implemented',
    );

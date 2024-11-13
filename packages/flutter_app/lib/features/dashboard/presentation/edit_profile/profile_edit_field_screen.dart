import "package:flutter/material.dart";
import "package:flutter_app/features/dashboard/presentation/edit_profile/profile_edit_controller.dart";
import "package:flutter_app/features/dashboard/presentation/edit_profile/profile_field_type.dart";
import "package:flutter_app/features/user/domain/user_id_firestore.dart";
import "package:flutter_app/gen/strings.g.dart";
import "package:flutter_app/utils/extension/async_value_ui.dart";
import "package:flutter_app/widgets/async_value_widget.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class ProfileEditFieldScreen extends ConsumerWidget {
  const ProfileEditFieldScreen({
    super.key,
    required this.userId,
    required this.title,
    required this.fieldType,
  });

  final UserIdFirestore userId;
  final String title;
  final ProfileFieldType fieldType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(profileEditStateProvider(userId));

    ref.listen<AsyncValue<void>>(
      profileEditStateProvider(userId),
      (_, state) => state.showAlertDialogOnError(context),
    );

    return AsyncValueWidget(
      value: profileState,
      data: (profile) {
        return ProfileEditForm(
          initialValue: fieldType.getValue(profile),
          title: title,
          onSave: (value) async {
            final success = await ref
                .read(profileEditStateProvider(userId).notifier)
                .updateField(fieldType, value);
            if (success && context.mounted) {
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }
}

class ProfileEditForm extends ConsumerStatefulWidget {
  const ProfileEditForm({
    super.key,
    required this.initialValue,
    required this.title,
    required this.onSave,
  });

  final String initialValue;
  final String title;
  final Future<void> Function(String value) onSave;

  @override
  ConsumerState<ProfileEditForm> createState() => _ProfileEditFormState();
}

class _ProfileEditFormState extends ConsumerState<ProfileEditForm> {
  late TextEditingController _controller;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    Future<bool> onWillPop() async {
      if (_controller.text != widget.initialValue) {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(t.dashboard.profileEdit.dialog.discardChanges.title),
            content:
                Text(t.dashboard.profileEdit.dialog.discardChanges.content),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text(
                  t.dashboard.profileEdit.dialog.discardChanges.continueEditing,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text(
                  t.dashboard.profileEdit.dialog.discardChanges.discard,
                ),
              ),
            ],
          ),
        );
        return shouldPop ?? false;
      }
      return true;
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        final shouldPop = await onWillPop();
        if (shouldPop) {
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            TextButton(
              onPressed: _isSaving
                  ? null
                  : () async {
                      setState(() {
                        _isSaving = true;
                      });
                      try {
                        await widget.onSave(_controller.text);
                      } finally {
                        if (mounted) {
                          setState(() {
                            _isSaving = false;
                          });
                        }
                      }
                    },
              child: _isSaving
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : Text(t.dashboard.profileEdit.buttons.complete),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            controller: _controller,
            autofocus: true,
            enabled: !_isSaving,
            decoration: InputDecoration(
              hintText: t.dashboard.profileEdit.fields.hint(
                field: widget.title,
              ),
              border: const UnderlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}

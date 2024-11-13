import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../gen/strings.g.dart';
import '../../../router/router.dart';
import '../../../utils/extension/async_value_ui.dart';
import 'create_post_controller.dart';

class PostScreen extends HookConsumerWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);

    final imagePicker = useMemoized(ImagePicker.new);
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final image = useState<File?>(null);
    final isSubmitting = useState(false);
    final descriptionController = useTextEditingController();
    final locationController = useTextEditingController();

    Future<void> getImage(ImageSource source) async {
      final pickedFile = await imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        image.value = File(pickedFile.path);
      }
    }

    Future<void> showImagePicker() async {
      await showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Wrap(
              children: [
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: Text(t.createPost.imagePicker.gallery),
                  onTap: () {
                    getImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: Text(t.createPost.imagePicker.camera),
                  onTap: () {
                    getImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    Future<void> submitPost() async {
      if (formKey.currentState!.validate() && image.value != null) {
        isSubmitting.value = true;

        await ref.read(createPostControllerProvider.notifier).createPost(
              image.value!,
              descriptionController.text,
              locationController.text,
            );

        descriptionController.clear();
        locationController.clear();
        image.value = null;
        isSubmitting.value = false;

        const TimelineRouteData().go(context);
        isSubmitting.value = false;

        if (context.mounted) {
          const TimelineRouteData().go(context);
        }
      }
    }

    ref.listen<AsyncValue<void>>(
      createPostControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(t.createPost.appBar.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (image.value != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      image.value!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: showImagePicker,
                    icon: const Icon(Icons.photo_camera),
                    label: Text(t.createPost.buttons.reSelectPhoto),
                  ),
                ] else
                  Center(
                    child: ElevatedButton.icon(
                      onPressed: showImagePicker,
                      icon: const Icon(Icons.add_photo_alternate),
                      label: Text(t.createPost.buttons.selectPhoto),
                    ),
                  ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: t.createPost.fields.description.label,
                    hintText: t.createPost.fields.description.hint,
                    border: const OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return t.createPost.fields.description.errors.required;
                    }
                    if (value.length > 2000) {
                      return t.createPost.fields.description.errors.tooLong;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: locationController,
                  decoration: InputDecoration(
                    labelText: t.createPost.fields.location.label,
                    hintText: t.createPost.fields.location.hint,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.location_on),
                  ),
                ),
                const SizedBox(height: 32),
                FilledButton.icon(
                  onPressed: (image.value != null && !isSubmitting.value)
                      ? submitPost
                      : null,
                  label: Text(
                    isSubmitting.value
                        ? t.createPost.buttons.posting
                        : t.createPost.buttons.post,
                  ),
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

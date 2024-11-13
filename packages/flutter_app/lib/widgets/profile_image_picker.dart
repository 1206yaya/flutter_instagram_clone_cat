import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

// 選択された画像のためのProvider
final selectedImageProvider = StateProvider<XFile?>((ref) => null);

// 画像選択機能を提供するProvider
final imagePickerServiceProvider = Provider((ref) => ImagePickerService());

class ImagePickerService {
  final _picker = ImagePicker();
  Future<XFile?> pickImage() async {
    return _picker.pickImage(source: ImageSource.gallery);
  }
}

// 画像選択用のカスタムフック
final useImagePickerProvider =
    Provider.family<Future<void> Function(), void Function(File)>(
  (ref, onImageSelected) => () async {
    final pickerService = ref.read(imagePickerServiceProvider);
    final xFile = await pickerService.pickImage();
    if (xFile != null) {
      final file = File(xFile.path);
      ref.read(selectedImageProvider.notifier).state = xFile;
      onImageSelected(file);
    }
  },
);

class ProfileImagePicker extends HookConsumerWidget {
  const ProfileImagePicker({
    super.key,
    required this.onImageSelected,
    this.currentImageUrl,
    this.radius = 40,
    this.showEditButton = true,
  });

  final void Function(File file) onImageSelected;
  final String? currentImageUrl;
  final double radius;
  final bool showEditButton;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedImage = ref.watch(selectedImageProvider);
    final pickImage = ref.watch(useImagePickerProvider(onImageSelected));

    Widget buildImage() {
      if (selectedImage != null) {
        return ClipOval(
          child: Image.file(
            File(selectedImage.path),
            width: radius * 2,
            height: radius * 2,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Icon(
              Icons.error_outline,
              size: radius,
              color: Colors.grey[400],
            ),
          ),
        );
      }

      if (currentImageUrl != null && currentImageUrl!.isNotEmpty) {
        // ネットワーク画像の表示（CachedNetworkImageを使用）
        return ClipOval(
          child: CachedNetworkImage(
            imageUrl: currentImageUrl!,
            width: radius * 2,
            height: radius * 2,
            fit: BoxFit.cover,
            placeholder: (context, url) => Center(
              child: SizedBox(
                width: radius,
                height: radius,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.grey[400],
                ),
              ),
            ),
            errorWidget: (context, url, error) => Icon(
              Icons.error_outline,
              size: radius,
              color: Colors.grey[400],
            ),
          ),
        );
      }

      // デフォルトのアイコン表示
      return Icon(
        Icons.person,
        size: radius,
        color: Colors.grey[400],
      );
    }

    return GestureDetector(
      onTap: showEditButton ? null : pickImage,
      child: Stack(
        children: [
          CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey[200],
            child: buildImage(),
          ),
          if (showEditButton)
            Positioned(
              bottom: 0,
              right: 0,
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.circular(radius * 0.45),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor,
                  radius: radius * 0.45,
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      size: radius * 0.45,
                      color: Colors.white,
                    ),
                    onPressed: pickImage,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

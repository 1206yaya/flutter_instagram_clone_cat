import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../widgets/profile_image_picker.dart';
import '../../../user/domain/user_firestore.dart';
import '../dashboard_controller.dart';
import 'profile_stats.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({
    super.key,
    required this.profile,
  });

  final UserFirestore? profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('ProfileHeader profile: ${profile?.data}');
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: ProfileImagePicker(
            currentImageUrl: profile?.data.photoUrl,
            showEditButton: false,
            onImageSelected: ref
                .read(dashboardControllerProvider.notifier)
                .updateProfileImage,
          ),
        ),
        Flexible(
          flex: 2,
          child: ProfileStats(profile: profile),
        ),
      ],
    );
  }
}

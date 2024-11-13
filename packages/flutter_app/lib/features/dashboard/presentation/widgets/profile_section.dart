import "package:flutter/material.dart";
import "package:flutter_app/features/dashboard/presentation/widgets/profile_action_button.dart";
import "package:flutter_app/features/dashboard/presentation/widgets/profile_header.dart";
import "package:flutter_app/features/dashboard/presentation/widgets/user_info.dart";
import "package:flutter_app/features/user/domain/user_firestore.dart";
import "package:flutter_app/widgets/async_value_widget.dart";
import "package:hooks_riverpod/hooks_riverpod.dart";

class ProfileSection extends ConsumerWidget {
  const ProfileSection({
    super.key,
    required this.profileData,
    required this.isCurrentUser,
  });

  final AsyncValue<UserFirestore?> profileData;
  final bool isCurrentUser;

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueSliverWidget<UserFirestore?>(
      value: profileData,
      data: (profile) => SliverToBoxAdapter(
        child: profile != null
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    ProfileHeader(profile: profile),
                    const SizedBox(height: 16),
                    UserInfo(profile: profile),
                    ProfileActionButton(
                      profile: profile,
                      showFollowButton: !isCurrentUser,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../gen/strings.g.dart';
import '../../../../router/router.dart';
import '../../../../widgets/widgets.dart';
import '../../../user/application/user_service.dart';
import '../../../user/domain/user_firestore.dart';
import '../dashboard_controller.dart';
import 'profile_field_type.dart';

class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({
    super.key,
    // required this.uid,
  });

  // final String uid;
  static const inputDisplayNameKey = Key('input-display-name');
  static const inputBioKey = Key('input-bio');

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends ConsumerState<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final userAsync = ref.watch(userStreamProvider());

    Widget buildProfileField(
      BuildContext context,
      WidgetRef ref,
      ProfileFieldType fieldType,
      UserFirestore profile,
      Key key,
    ) {
      return InkWell(
        onTap: () => ProfileEditFieldRouteData(
          userId: profile.uid.value,
          title: fieldType.getLabel(context),
          fieldType: fieldType,
        ).go(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              SizedBox(
                width: 100,
                child: Text(
                  fieldType.getLabel(context),
                ),
              ),
              Expanded(
                child: Text(
                  fieldType.getValue(profile),
                  key: key,
                ),
              ),
              const Icon(
                Icons.chevron_right,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(t.dashboard.profileEdit.appBar.title),
      ),
      body: SingleChildScrollView(
        child: AsyncValueWidget<UserFirestore?>(
          value: userAsync,
          data: (UserFirestore? user) {
            return Column(
              children: [
                const SizedBox(height: 20),
                // Avatar section
                Center(
                  child: ProfileImagePicker(
                    currentImageUrl: user?.data.photoUrl,
                    showEditButton: false,
                    onImageSelected: ref
                        .read(dashboardControllerProvider.notifier)
                        .updateProfileImage,
                  ),
                ),
                const SizedBox(height: 30),
                // Profile fields
                buildProfileField(
                  context,
                  ref,
                  ProfileFieldType.displayName,
                  user ?? UserFirestore.empty(),
                  ProfileEditScreen.inputDisplayNameKey,
                ),
                buildProfileField(
                  context,
                  ref,
                  ProfileFieldType.bio,
                  user ?? UserFirestore.empty(),
                  ProfileEditScreen.inputBioKey,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

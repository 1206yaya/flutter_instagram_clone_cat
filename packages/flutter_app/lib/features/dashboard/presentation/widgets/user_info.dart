import "package:flutter/material.dart";
import "package:flutter_app/features/user/domain/user_firestore.dart";

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
    required this.profile,
  });

  final UserFirestore? profile;

  static const Key inputDisplayNameKey = Key("input-display-name");
  static const Key inputBioKey = Key("input-bio");

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                profile?.data.displayName ?? "No name",
                style: Theme.of(context).textTheme.titleSmall,
                key: inputDisplayNameKey,
              ),
              const SizedBox(height: 8),
              Text(
                profile?.data.bio ?? "",
                style: Theme.of(context).textTheme.bodyMedium,
                key: inputBioKey,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

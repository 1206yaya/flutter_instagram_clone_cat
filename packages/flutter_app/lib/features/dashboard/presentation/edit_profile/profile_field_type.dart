// lib/features/dashboard/domain/profile_field.dart
import "package:flutter/material.dart";
import "package:flutter_app/features/user/domain/user_firestore.dart";
import "package:flutter_app/gen/strings.g.dart";

enum ProfileField {
  displayName,
  bio;

  String getValue(UserFirestore profile) {
    switch (this) {
      case ProfileField.displayName:
        return profile.data.displayName;
      case ProfileField.bio:
        return profile.data.bio;
    }
  }

  UserFirestore updateValue(UserFirestore profile, String newValue) {
    switch (this) {
      case ProfileField.displayName:
        return profile.copyWith(displayName: newValue);
      case ProfileField.bio:
        return profile.copyWith(bio: newValue);
    }
  }
}

// lib/features/dashboard/presentation/profile_field_type.dart
enum ProfileFieldType {
  displayName,
  bio;

  ProfileField toDomain() {
    switch (this) {
      case ProfileFieldType.displayName:
        return ProfileField.displayName;
      case ProfileFieldType.bio:
        return ProfileField.bio;
    }
  }

  String getLabel(BuildContext context) {
    final t = Translations.of(context);
    switch (this) {
      case ProfileFieldType.displayName:
        return t.dashboard.profileEdit.fields.displayName;
      case ProfileFieldType.bio:
        return t.dashboard.profileEdit.fields.bio;
    }
  }

  String getValue(UserFirestore profile) => toDomain().getValue(profile);

  UserFirestore updateValue(UserFirestore profile, String newValue) =>
      toDomain().updateValue(profile, newValue);
}

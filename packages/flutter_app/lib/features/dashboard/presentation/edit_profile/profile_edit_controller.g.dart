// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'profile_edit_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileEditStateHash() => r'c6ed3f99e64569daa52a47854357254fcdca414e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProfileEditState
    extends BuildlessAutoDisposeAsyncNotifier<UserFirestore> {
  late final UserIdFirestore userId;

  FutureOr<UserFirestore> build(
    UserIdFirestore userId,
  );
}

/// See also [ProfileEditState].
@ProviderFor(ProfileEditState)
const profileEditStateProvider = ProfileEditStateFamily();

/// See also [ProfileEditState].
class ProfileEditStateFamily extends Family<AsyncValue<UserFirestore>> {
  /// See also [ProfileEditState].
  const ProfileEditStateFamily();

  /// See also [ProfileEditState].
  ProfileEditStateProvider call(
    UserIdFirestore userId,
  ) {
    return ProfileEditStateProvider(
      userId,
    );
  }

  @override
  ProfileEditStateProvider getProviderOverride(
    covariant ProfileEditStateProvider provider,
  ) {
    return call(
      provider.userId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'profileEditStateProvider';
}

/// See also [ProfileEditState].
class ProfileEditStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ProfileEditState, UserFirestore> {
  /// See also [ProfileEditState].
  ProfileEditStateProvider(
    UserIdFirestore userId,
  ) : this._internal(
          () => ProfileEditState()..userId = userId,
          from: profileEditStateProvider,
          name: r'profileEditStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profileEditStateHash,
          dependencies: ProfileEditStateFamily._dependencies,
          allTransitiveDependencies:
              ProfileEditStateFamily._allTransitiveDependencies,
          userId: userId,
        );

  ProfileEditStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final UserIdFirestore userId;

  @override
  FutureOr<UserFirestore> runNotifierBuild(
    covariant ProfileEditState notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(ProfileEditState Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProfileEditStateProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProfileEditState, UserFirestore>
      createElement() {
    return _ProfileEditStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileEditStateProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProfileEditStateRef
    on AutoDisposeAsyncNotifierProviderRef<UserFirestore> {
  /// The parameter `userId` of this provider.
  UserIdFirestore get userId;
}

class _ProfileEditStateProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<ProfileEditState,
        UserFirestore> with ProfileEditStateRef {
  _ProfileEditStateProviderElement(super.provider);

  @override
  UserIdFirestore get userId => (origin as ProfileEditStateProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

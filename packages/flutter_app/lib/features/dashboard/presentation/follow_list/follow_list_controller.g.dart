// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'follow_list_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$followListUsersHash() => r'5c0be6266a226f0ce495a3b62f4f3d64df1d87c3';

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

/// See also [followListUsers].
@ProviderFor(followListUsers)
const followListUsersProvider = FollowListUsersFamily();

/// See also [followListUsers].
class FollowListUsersFamily extends Family<AsyncValue<List<UserFirestore>>> {
  /// See also [followListUsers].
  const FollowListUsersFamily();

  /// See also [followListUsers].
  FollowListUsersProvider call({
    required UserIdFirestore userId,
    required bool isFollowers,
  }) {
    return FollowListUsersProvider(
      userId: userId,
      isFollowers: isFollowers,
    );
  }

  @override
  FollowListUsersProvider getProviderOverride(
    covariant FollowListUsersProvider provider,
  ) {
    return call(
      userId: provider.userId,
      isFollowers: provider.isFollowers,
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
  String? get name => r'followListUsersProvider';
}

/// See also [followListUsers].
class FollowListUsersProvider
    extends AutoDisposeStreamProvider<List<UserFirestore>> {
  /// See also [followListUsers].
  FollowListUsersProvider({
    required UserIdFirestore userId,
    required bool isFollowers,
  }) : this._internal(
          (ref) => followListUsers(
            ref as FollowListUsersRef,
            userId: userId,
            isFollowers: isFollowers,
          ),
          from: followListUsersProvider,
          name: r'followListUsersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$followListUsersHash,
          dependencies: FollowListUsersFamily._dependencies,
          allTransitiveDependencies:
              FollowListUsersFamily._allTransitiveDependencies,
          userId: userId,
          isFollowers: isFollowers,
        );

  FollowListUsersProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
    required this.isFollowers,
  }) : super.internal();

  final UserIdFirestore userId;
  final bool isFollowers;

  @override
  Override overrideWith(
    Stream<List<UserFirestore>> Function(FollowListUsersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FollowListUsersProvider._internal(
        (ref) => create(ref as FollowListUsersRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
        isFollowers: isFollowers,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<UserFirestore>> createElement() {
    return _FollowListUsersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FollowListUsersProvider &&
        other.userId == userId &&
        other.isFollowers == isFollowers;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, isFollowers.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FollowListUsersRef on AutoDisposeStreamProviderRef<List<UserFirestore>> {
  /// The parameter `userId` of this provider.
  UserIdFirestore get userId;

  /// The parameter `isFollowers` of this provider.
  bool get isFollowers;
}

class _FollowListUsersProviderElement
    extends AutoDisposeStreamProviderElement<List<UserFirestore>>
    with FollowListUsersRef {
  _FollowListUsersProviderElement(super.provider);

  @override
  UserIdFirestore get userId => (origin as FollowListUsersProvider).userId;
  @override
  bool get isFollowers => (origin as FollowListUsersProvider).isFollowers;
}

String _$followListControllerHash() =>
    r'd6c4c55fb9e69f3b972691b2e02103f87b650538';

/// See also [FollowListController].
@ProviderFor(FollowListController)
final followListControllerProvider =
    AutoDisposeAsyncNotifierProvider<FollowListController, void>.internal(
  FollowListController.new,
  name: r'followListControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$followListControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FollowListController = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

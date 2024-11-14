// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'follower_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$followerServiceHash() => r'12acafa77109486cd8829d02dc21eaec03e99b9c';

/// See also [followerService].
@ProviderFor(followerService)
final followerServiceProvider = AutoDisposeProvider<FollowerService>.internal(
  followerService,
  name: r'followerServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$followerServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FollowerServiceRef = AutoDisposeProviderRef<FollowerService>;
String _$userFollowersHash() => r'df0dac7161d2b95e6623ab033a923c5de8c7d865';

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

/// See also [userFollowers].
@ProviderFor(userFollowers)
const userFollowersProvider = UserFollowersFamily();

/// See also [userFollowers].
class UserFollowersFamily extends Family<AsyncValue<List<UserFirestore>>> {
  /// See also [userFollowers].
  const UserFollowersFamily();

  /// See also [userFollowers].
  UserFollowersProvider call(
    UserIdFirestore userId,
  ) {
    return UserFollowersProvider(
      userId,
    );
  }

  @override
  UserFollowersProvider getProviderOverride(
    covariant UserFollowersProvider provider,
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
  String? get name => r'userFollowersProvider';
}

/// See also [userFollowers].
class UserFollowersProvider
    extends AutoDisposeStreamProvider<List<UserFirestore>> {
  /// See also [userFollowers].
  UserFollowersProvider(
    UserIdFirestore userId,
  ) : this._internal(
          (ref) => userFollowers(
            ref as UserFollowersRef,
            userId,
          ),
          from: userFollowersProvider,
          name: r'userFollowersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userFollowersHash,
          dependencies: UserFollowersFamily._dependencies,
          allTransitiveDependencies:
              UserFollowersFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserFollowersProvider._internal(
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
  Override overrideWith(
    Stream<List<UserFirestore>> Function(UserFollowersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserFollowersProvider._internal(
        (ref) => create(ref as UserFollowersRef),
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
  AutoDisposeStreamProviderElement<List<UserFirestore>> createElement() {
    return _UserFollowersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserFollowersProvider && other.userId == userId;
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
mixin UserFollowersRef on AutoDisposeStreamProviderRef<List<UserFirestore>> {
  /// The parameter `userId` of this provider.
  UserIdFirestore get userId;
}

class _UserFollowersProviderElement
    extends AutoDisposeStreamProviderElement<List<UserFirestore>>
    with UserFollowersRef {
  _UserFollowersProviderElement(super.provider);

  @override
  UserIdFirestore get userId => (origin as UserFollowersProvider).userId;
}

String _$isFollowedByUserHash() => r'8362c8850e6180df3de8bfeeaf1413c815ffc6a6';

/// See also [isFollowedByUser].
@ProviderFor(isFollowedByUser)
const isFollowedByUserProvider = IsFollowedByUserFamily();

/// See also [isFollowedByUser].
class IsFollowedByUserFamily extends Family<AsyncValue<bool>> {
  /// See also [isFollowedByUser].
  const IsFollowedByUserFamily();

  /// See also [isFollowedByUser].
  IsFollowedByUserProvider call(
    UserIdFirestore userId,
  ) {
    return IsFollowedByUserProvider(
      userId,
    );
  }

  @override
  IsFollowedByUserProvider getProviderOverride(
    covariant IsFollowedByUserProvider provider,
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
  String? get name => r'isFollowedByUserProvider';
}

/// See also [isFollowedByUser].
class IsFollowedByUserProvider extends AutoDisposeStreamProvider<bool> {
  /// See also [isFollowedByUser].
  IsFollowedByUserProvider(
    UserIdFirestore userId,
  ) : this._internal(
          (ref) => isFollowedByUser(
            ref as IsFollowedByUserRef,
            userId,
          ),
          from: isFollowedByUserProvider,
          name: r'isFollowedByUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFollowedByUserHash,
          dependencies: IsFollowedByUserFamily._dependencies,
          allTransitiveDependencies:
              IsFollowedByUserFamily._allTransitiveDependencies,
          userId: userId,
        );

  IsFollowedByUserProvider._internal(
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
  Override overrideWith(
    Stream<bool> Function(IsFollowedByUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFollowedByUserProvider._internal(
        (ref) => create(ref as IsFollowedByUserRef),
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
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _IsFollowedByUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFollowedByUserProvider && other.userId == userId;
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
mixin IsFollowedByUserRef on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `userId` of this provider.
  UserIdFirestore get userId;
}

class _IsFollowedByUserProviderElement
    extends AutoDisposeStreamProviderElement<bool> with IsFollowedByUserRef {
  _IsFollowedByUserProviderElement(super.provider);

  @override
  UserIdFirestore get userId => (origin as IsFollowedByUserProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

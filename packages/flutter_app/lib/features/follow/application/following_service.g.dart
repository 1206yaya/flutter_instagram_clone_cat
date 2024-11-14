// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'following_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$followingServiceHash() => r'6915bbbfb6038dee78009602ea4050bf4f195e88';

/// See also [followingService].
@ProviderFor(followingService)
final followingServiceProvider = AutoDisposeProvider<FollowingService>.internal(
  followingService,
  name: r'followingServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$followingServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FollowingServiceRef = AutoDisposeProviderRef<FollowingService>;
String _$isFollowingUserHash() => r'87f8f7eaf4a4f0f81e1bcd543be9f26fe9390950';

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

/// See also [isFollowingUser].
@ProviderFor(isFollowingUser)
const isFollowingUserProvider = IsFollowingUserFamily();

/// See also [isFollowingUser].
class IsFollowingUserFamily extends Family<AsyncValue<bool>> {
  /// See also [isFollowingUser].
  const IsFollowingUserFamily();

  /// See also [isFollowingUser].
  IsFollowingUserProvider call(
    UserIdFirestore targetUid,
  ) {
    return IsFollowingUserProvider(
      targetUid,
    );
  }

  @override
  IsFollowingUserProvider getProviderOverride(
    covariant IsFollowingUserProvider provider,
  ) {
    return call(
      provider.targetUid,
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
  String? get name => r'isFollowingUserProvider';
}

/// See also [isFollowingUser].
class IsFollowingUserProvider extends AutoDisposeStreamProvider<bool> {
  /// See also [isFollowingUser].
  IsFollowingUserProvider(
    UserIdFirestore targetUid,
  ) : this._internal(
          (ref) => isFollowingUser(
            ref as IsFollowingUserRef,
            targetUid,
          ),
          from: isFollowingUserProvider,
          name: r'isFollowingUserProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$isFollowingUserHash,
          dependencies: IsFollowingUserFamily._dependencies,
          allTransitiveDependencies:
              IsFollowingUserFamily._allTransitiveDependencies,
          targetUid: targetUid,
        );

  IsFollowingUserProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.targetUid,
  }) : super.internal();

  final UserIdFirestore targetUid;

  @override
  Override overrideWith(
    Stream<bool> Function(IsFollowingUserRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsFollowingUserProvider._internal(
        (ref) => create(ref as IsFollowingUserRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        targetUid: targetUid,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _IsFollowingUserProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsFollowingUserProvider && other.targetUid == targetUid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, targetUid.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsFollowingUserRef on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `targetUid` of this provider.
  UserIdFirestore get targetUid;
}

class _IsFollowingUserProviderElement
    extends AutoDisposeStreamProviderElement<bool> with IsFollowingUserRef {
  _IsFollowingUserProviderElement(super.provider);

  @override
  UserIdFirestore get targetUid =>
      (origin as IsFollowingUserProvider).targetUid;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userServiceHash() => r'525d07ddf1a1ea55a69e0faa207a78e0bbd04c7a';

/// See also [userService].
@ProviderFor(userService)
final userServiceProvider = Provider<UserService>.internal(
  userService,
  name: r'userServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserServiceRef = ProviderRef<UserService>;
String _$userStreamHash() => r'fe8ccd56af1dde86a313bed275f8a46465a1854f';

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

/// See also [userStream].
@ProviderFor(userStream)
const userStreamProvider = UserStreamFamily();

/// See also [userStream].
class UserStreamFamily extends Family<AsyncValue<UserFirestore?>> {
  /// See also [userStream].
  const UserStreamFamily();

  /// See also [userStream].
  UserStreamProvider call([
    UserIdFirestore? userId,
  ]) {
    return UserStreamProvider(
      userId,
    );
  }

  @override
  UserStreamProvider getProviderOverride(
    covariant UserStreamProvider provider,
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
  String? get name => r'userStreamProvider';
}

/// See also [userStream].
class UserStreamProvider extends AutoDisposeStreamProvider<UserFirestore?> {
  /// See also [userStream].
  UserStreamProvider([
    UserIdFirestore? userId,
  ]) : this._internal(
          (ref) => userStream(
            ref as UserStreamRef,
            userId,
          ),
          from: userStreamProvider,
          name: r'userStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$userStreamHash,
          dependencies: UserStreamFamily._dependencies,
          allTransitiveDependencies:
              UserStreamFamily._allTransitiveDependencies,
          userId: userId,
        );

  UserStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final UserIdFirestore? userId;

  @override
  Override overrideWith(
    Stream<UserFirestore?> Function(UserStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserStreamProvider._internal(
        (ref) => create(ref as UserStreamRef),
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
  AutoDisposeStreamProviderElement<UserFirestore?> createElement() {
    return _UserStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserStreamProvider && other.userId == userId;
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
mixin UserStreamRef on AutoDisposeStreamProviderRef<UserFirestore?> {
  /// The parameter `userId` of this provider.
  UserIdFirestore? get userId;
}

class _UserStreamProviderElement
    extends AutoDisposeStreamProviderElement<UserFirestore?>
    with UserStreamRef {
  _UserStreamProviderElement(super.provider);

  @override
  UserIdFirestore? get userId => (origin as UserStreamProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postServiceHash() => r'31513565b5c33a832de42f0c1c2d38b79ae697b2';

/// See also [postService].
@ProviderFor(postService)
final postServiceProvider = AutoDisposeProvider<PostService>.internal(
  postService,
  name: r'postServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PostServiceRef = AutoDisposeProviderRef<PostService>;
String _$postsStreamHash() => r'ea9f795227f62c5500163b9f5f41da8ec2747297';

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

/// See also [postsStream].
@ProviderFor(postsStream)
const postsStreamProvider = PostsStreamFamily();

/// See also [postsStream].
class PostsStreamFamily extends Family<AsyncValue<List<PostFirestore>>> {
  /// See also [postsStream].
  const PostsStreamFamily();

  /// See also [postsStream].
  PostsStreamProvider call(
    UserIdFirestore userId,
  ) {
    return PostsStreamProvider(
      userId,
    );
  }

  @override
  PostsStreamProvider getProviderOverride(
    covariant PostsStreamProvider provider,
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
  String? get name => r'postsStreamProvider';
}

/// See also [postsStream].
class PostsStreamProvider
    extends AutoDisposeStreamProvider<List<PostFirestore>> {
  /// See also [postsStream].
  PostsStreamProvider(
    UserIdFirestore userId,
  ) : this._internal(
          (ref) => postsStream(
            ref as PostsStreamRef,
            userId,
          ),
          from: postsStreamProvider,
          name: r'postsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postsStreamHash,
          dependencies: PostsStreamFamily._dependencies,
          allTransitiveDependencies:
              PostsStreamFamily._allTransitiveDependencies,
          userId: userId,
        );

  PostsStreamProvider._internal(
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
    Stream<List<PostFirestore>> Function(PostsStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PostsStreamProvider._internal(
        (ref) => create(ref as PostsStreamRef),
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
  AutoDisposeStreamProviderElement<List<PostFirestore>> createElement() {
    return _PostsStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostsStreamProvider && other.userId == userId;
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
mixin PostsStreamRef on AutoDisposeStreamProviderRef<List<PostFirestore>> {
  /// The parameter `userId` of this provider.
  UserIdFirestore get userId;
}

class _PostsStreamProviderElement
    extends AutoDisposeStreamProviderElement<List<PostFirestore>>
    with PostsStreamRef {
  _PostsStreamProviderElement(super.provider);

  @override
  UserIdFirestore get userId => (origin as PostsStreamProvider).userId;
}

String _$trendingPostsStreamHash() =>
    r'f6db371745279cc7458c3c70b8bb6dbe16f9fe08';

/// See also [trendingPostsStream].
@ProviderFor(trendingPostsStream)
final trendingPostsStreamProvider =
    AutoDisposeStreamProvider<List<PostFirestore>>.internal(
  trendingPostsStream,
  name: r'trendingPostsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trendingPostsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TrendingPostsStreamRef
    = AutoDisposeStreamProviderRef<List<PostFirestore>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

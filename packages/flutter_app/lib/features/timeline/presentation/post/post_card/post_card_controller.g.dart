// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'post_card_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postCardControllerHash() =>
    r'6468a127a4b10885a6b1b8b4c6cef41a9d0874e8';

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

abstract class _$PostCardController
    extends BuildlessAutoDisposeAsyncNotifier<PostLikeData> {
  late final PostIdFirestore postId;

  FutureOr<PostLikeData> build(
    PostIdFirestore postId,
  );
}

/// See also [PostCardController].
@ProviderFor(PostCardController)
const postCardControllerProvider = PostCardControllerFamily();

/// See also [PostCardController].
class PostCardControllerFamily extends Family<AsyncValue<PostLikeData>> {
  /// See also [PostCardController].
  const PostCardControllerFamily();

  /// See also [PostCardController].
  PostCardControllerProvider call(
    PostIdFirestore postId,
  ) {
    return PostCardControllerProvider(
      postId,
    );
  }

  @override
  PostCardControllerProvider getProviderOverride(
    covariant PostCardControllerProvider provider,
  ) {
    return call(
      provider.postId,
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
  String? get name => r'postCardControllerProvider';
}

/// See also [PostCardController].
class PostCardControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    PostCardController, PostLikeData> {
  /// See also [PostCardController].
  PostCardControllerProvider(
    PostIdFirestore postId,
  ) : this._internal(
          () => PostCardController()..postId = postId,
          from: postCardControllerProvider,
          name: r'postCardControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$postCardControllerHash,
          dependencies: PostCardControllerFamily._dependencies,
          allTransitiveDependencies:
              PostCardControllerFamily._allTransitiveDependencies,
          postId: postId,
        );

  PostCardControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final PostIdFirestore postId;

  @override
  FutureOr<PostLikeData> runNotifierBuild(
    covariant PostCardController notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(PostCardController Function() create) {
    return ProviderOverride(
      origin: this,
      override: PostCardControllerProvider._internal(
        () => create()..postId = postId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<PostCardController, PostLikeData>
      createElement() {
    return _PostCardControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PostCardControllerProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PostCardControllerRef
    on AutoDisposeAsyncNotifierProviderRef<PostLikeData> {
  /// The parameter `postId` of this provider.
  PostIdFirestore get postId;
}

class _PostCardControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<PostCardController,
        PostLikeData> with PostCardControllerRef {
  _PostCardControllerProviderElement(super.provider);

  @override
  PostIdFirestore get postId => (origin as PostCardControllerProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

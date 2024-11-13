// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'comments_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$commentsControllerHash() =>
    r'6849616c33d7710d4944350c7907ff38ec0d59de';

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

abstract class _$CommentsController
    extends BuildlessAutoDisposeStreamNotifier<List<CommentFirestore>> {
  late final PostIdFirestore postId;

  Stream<List<CommentFirestore>> build(
    PostIdFirestore postId,
  );
}

/// See also [CommentsController].
@ProviderFor(CommentsController)
const commentsControllerProvider = CommentsControllerFamily();

/// See also [CommentsController].
class CommentsControllerFamily
    extends Family<AsyncValue<List<CommentFirestore>>> {
  /// See also [CommentsController].
  const CommentsControllerFamily();

  /// See also [CommentsController].
  CommentsControllerProvider call(
    PostIdFirestore postId,
  ) {
    return CommentsControllerProvider(
      postId,
    );
  }

  @override
  CommentsControllerProvider getProviderOverride(
    covariant CommentsControllerProvider provider,
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
  String? get name => r'commentsControllerProvider';
}

/// See also [CommentsController].
class CommentsControllerProvider extends AutoDisposeStreamNotifierProviderImpl<
    CommentsController, List<CommentFirestore>> {
  /// See also [CommentsController].
  CommentsControllerProvider(
    PostIdFirestore postId,
  ) : this._internal(
          () => CommentsController()..postId = postId,
          from: commentsControllerProvider,
          name: r'commentsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$commentsControllerHash,
          dependencies: CommentsControllerFamily._dependencies,
          allTransitiveDependencies:
              CommentsControllerFamily._allTransitiveDependencies,
          postId: postId,
        );

  CommentsControllerProvider._internal(
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
  Stream<List<CommentFirestore>> runNotifierBuild(
    covariant CommentsController notifier,
  ) {
    return notifier.build(
      postId,
    );
  }

  @override
  Override overrideWith(CommentsController Function() create) {
    return ProviderOverride(
      origin: this,
      override: CommentsControllerProvider._internal(
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
  AutoDisposeStreamNotifierProviderElement<CommentsController,
      List<CommentFirestore>> createElement() {
    return _CommentsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentsControllerProvider && other.postId == postId;
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
mixin CommentsControllerRef
    on AutoDisposeStreamNotifierProviderRef<List<CommentFirestore>> {
  /// The parameter `postId` of this provider.
  PostIdFirestore get postId;
}

class _CommentsControllerProviderElement
    extends AutoDisposeStreamNotifierProviderElement<CommentsController,
        List<CommentFirestore>> with CommentsControllerRef {
  _CommentsControllerProviderElement(super.provider);

  @override
  PostIdFirestore get postId => (origin as CommentsControllerProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

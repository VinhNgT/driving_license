// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$keepQuestionPageScrollControllerAliveHash() =>
    r'45d24a9a7b6e817d41d36895464663001f4cd660';

/// See also [keepQuestionPageScrollControllerAlive].
@ProviderFor(keepQuestionPageScrollControllerAlive)
final keepQuestionPageScrollControllerAliveProvider =
    AutoDisposeProvider<void>.internal(
      keepQuestionPageScrollControllerAlive,
      name: r'keepQuestionPageScrollControllerAliveProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$keepQuestionPageScrollControllerAliveHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef KeepQuestionPageScrollControllerAliveRef = AutoDisposeProviderRef<void>;
String _$questionPageScrollControllerHash() =>
    r'91fb436d0a3748eb1678a739410e3d54c5b5ffea';

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

abstract class _$QuestionPageScrollController
    extends BuildlessAutoDisposeNotifier<Raw<ScrollController?>> {
  late final int pageIndex;

  Raw<ScrollController?> build(int pageIndex);
}

/// See also [QuestionPageScrollController].
@ProviderFor(QuestionPageScrollController)
const questionPageScrollControllerProvider =
    QuestionPageScrollControllerFamily();

/// See also [QuestionPageScrollController].
class QuestionPageScrollControllerFamily
    extends Family<Raw<ScrollController?>> {
  /// See also [QuestionPageScrollController].
  const QuestionPageScrollControllerFamily();

  /// See also [QuestionPageScrollController].
  QuestionPageScrollControllerProvider call(int pageIndex) {
    return QuestionPageScrollControllerProvider(pageIndex);
  }

  @override
  QuestionPageScrollControllerProvider getProviderOverride(
    covariant QuestionPageScrollControllerProvider provider,
  ) {
    return call(provider.pageIndex);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'questionPageScrollControllerProvider';
}

/// See also [QuestionPageScrollController].
class QuestionPageScrollControllerProvider
    extends
        AutoDisposeNotifierProviderImpl<
          QuestionPageScrollController,
          Raw<ScrollController?>
        > {
  /// See also [QuestionPageScrollController].
  QuestionPageScrollControllerProvider(int pageIndex)
    : this._internal(
        () => QuestionPageScrollController()..pageIndex = pageIndex,
        from: questionPageScrollControllerProvider,
        name: r'questionPageScrollControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$questionPageScrollControllerHash,
        dependencies: QuestionPageScrollControllerFamily._dependencies,
        allTransitiveDependencies:
            QuestionPageScrollControllerFamily._allTransitiveDependencies,
        pageIndex: pageIndex,
      );

  QuestionPageScrollControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageIndex,
  }) : super.internal();

  final int pageIndex;

  @override
  Raw<ScrollController?> runNotifierBuild(
    covariant QuestionPageScrollController notifier,
  ) {
    return notifier.build(pageIndex);
  }

  @override
  Override overrideWith(QuestionPageScrollController Function() create) {
    return ProviderOverride(
      origin: this,
      override: QuestionPageScrollControllerProvider._internal(
        () => create()..pageIndex = pageIndex,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageIndex: pageIndex,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    QuestionPageScrollController,
    Raw<ScrollController?>
  >
  createElement() {
    return _QuestionPageScrollControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionPageScrollControllerProvider &&
        other.pageIndex == pageIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QuestionPageScrollControllerRef
    on AutoDisposeNotifierProviderRef<Raw<ScrollController?>> {
  /// The parameter `pageIndex` of this provider.
  int get pageIndex;
}

class _QuestionPageScrollControllerProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          QuestionPageScrollController,
          Raw<ScrollController?>
        >
    with QuestionPageScrollControllerRef {
  _QuestionPageScrollControllerProviderElement(super.provider);

  @override
  int get pageIndex =>
      (origin as QuestionPageScrollControllerProvider).pageIndex;
}

String _$questionPageScrollingAnimationPlayingHash() =>
    r'7c803c79c1c2b11f2dc4818094d8d11c276e8c07';

abstract class _$QuestionPageScrollingAnimationPlaying
    extends BuildlessAutoDisposeNotifier<bool> {
  late final int pageIndex;

  bool build(int pageIndex);
}

/// See also [QuestionPageScrollingAnimationPlaying].
@ProviderFor(QuestionPageScrollingAnimationPlaying)
const questionPageScrollingAnimationPlayingProvider =
    QuestionPageScrollingAnimationPlayingFamily();

/// See also [QuestionPageScrollingAnimationPlaying].
class QuestionPageScrollingAnimationPlayingFamily extends Family<bool> {
  /// See also [QuestionPageScrollingAnimationPlaying].
  const QuestionPageScrollingAnimationPlayingFamily();

  /// See also [QuestionPageScrollingAnimationPlaying].
  QuestionPageScrollingAnimationPlayingProvider call(int pageIndex) {
    return QuestionPageScrollingAnimationPlayingProvider(pageIndex);
  }

  @override
  QuestionPageScrollingAnimationPlayingProvider getProviderOverride(
    covariant QuestionPageScrollingAnimationPlayingProvider provider,
  ) {
    return call(provider.pageIndex);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'questionPageScrollingAnimationPlayingProvider';
}

/// See also [QuestionPageScrollingAnimationPlaying].
class QuestionPageScrollingAnimationPlayingProvider
    extends
        AutoDisposeNotifierProviderImpl<
          QuestionPageScrollingAnimationPlaying,
          bool
        > {
  /// See also [QuestionPageScrollingAnimationPlaying].
  QuestionPageScrollingAnimationPlayingProvider(int pageIndex)
    : this._internal(
        () => QuestionPageScrollingAnimationPlaying()..pageIndex = pageIndex,
        from: questionPageScrollingAnimationPlayingProvider,
        name: r'questionPageScrollingAnimationPlayingProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$questionPageScrollingAnimationPlayingHash,
        dependencies: QuestionPageScrollingAnimationPlayingFamily._dependencies,
        allTransitiveDependencies: QuestionPageScrollingAnimationPlayingFamily
            ._allTransitiveDependencies,
        pageIndex: pageIndex,
      );

  QuestionPageScrollingAnimationPlayingProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageIndex,
  }) : super.internal();

  final int pageIndex;

  @override
  bool runNotifierBuild(
    covariant QuestionPageScrollingAnimationPlaying notifier,
  ) {
    return notifier.build(pageIndex);
  }

  @override
  Override overrideWith(
    QuestionPageScrollingAnimationPlaying Function() create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuestionPageScrollingAnimationPlayingProvider._internal(
        () => create()..pageIndex = pageIndex,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageIndex: pageIndex,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<
    QuestionPageScrollingAnimationPlaying,
    bool
  >
  createElement() {
    return _QuestionPageScrollingAnimationPlayingProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionPageScrollingAnimationPlayingProvider &&
        other.pageIndex == pageIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QuestionPageScrollingAnimationPlayingRef
    on AutoDisposeNotifierProviderRef<bool> {
  /// The parameter `pageIndex` of this provider.
  int get pageIndex;
}

class _QuestionPageScrollingAnimationPlayingProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          QuestionPageScrollingAnimationPlaying,
          bool
        >
    with QuestionPageScrollingAnimationPlayingRef {
  _QuestionPageScrollingAnimationPlayingProviderElement(super.provider);

  @override
  int get pageIndex =>
      (origin as QuestionPageScrollingAnimationPlayingProvider).pageIndex;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

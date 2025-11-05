// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_progress_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$completionStatusHash() => r'351934f23faa82dc27cbda0a820a69a972cb0205';

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

/// See also [completionStatus].
@ProviderFor(completionStatus)
const completionStatusProvider = CompletionStatusFamily();

/// See also [completionStatus].
class CompletionStatusFamily
    extends
        Family<AsyncValue<({int questionsCount, UserAnswersSummary summary})>> {
  /// See also [completionStatus].
  const CompletionStatusFamily();

  /// See also [completionStatus].
  CompletionStatusProvider call({
    Chapter? chapter,
    bool filterDangerQuestions = false,
  }) {
    return CompletionStatusProvider(
      chapter: chapter,
      filterDangerQuestions: filterDangerQuestions,
    );
  }

  @override
  CompletionStatusProvider getProviderOverride(
    covariant CompletionStatusProvider provider,
  ) {
    return call(
      chapter: provider.chapter,
      filterDangerQuestions: provider.filterDangerQuestions,
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
  String? get name => r'completionStatusProvider';
}

/// See also [completionStatus].
class CompletionStatusProvider
    extends
        AutoDisposeStreamProvider<
          ({int questionsCount, UserAnswersSummary summary})
        > {
  /// See also [completionStatus].
  CompletionStatusProvider({
    Chapter? chapter,
    bool filterDangerQuestions = false,
  }) : this._internal(
         (ref) => completionStatus(
           ref as CompletionStatusRef,
           chapter: chapter,
           filterDangerQuestions: filterDangerQuestions,
         ),
         from: completionStatusProvider,
         name: r'completionStatusProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$completionStatusHash,
         dependencies: CompletionStatusFamily._dependencies,
         allTransitiveDependencies:
             CompletionStatusFamily._allTransitiveDependencies,
         chapter: chapter,
         filterDangerQuestions: filterDangerQuestions,
       );

  CompletionStatusProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chapter,
    required this.filterDangerQuestions,
  }) : super.internal();

  final Chapter? chapter;
  final bool filterDangerQuestions;

  @override
  Override overrideWith(
    Stream<({int questionsCount, UserAnswersSummary summary})> Function(
      CompletionStatusRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CompletionStatusProvider._internal(
        (ref) => create(ref as CompletionStatusRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chapter: chapter,
        filterDangerQuestions: filterDangerQuestions,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<
    ({int questionsCount, UserAnswersSummary summary})
  >
  createElement() {
    return _CompletionStatusProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CompletionStatusProvider &&
        other.chapter == chapter &&
        other.filterDangerQuestions == filterDangerQuestions;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);
    hash = _SystemHash.combine(hash, filterDangerQuestions.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CompletionStatusRef
    on
        AutoDisposeStreamProviderRef<
          ({int questionsCount, UserAnswersSummary summary})
        > {
  /// The parameter `chapter` of this provider.
  Chapter? get chapter;

  /// The parameter `filterDangerQuestions` of this provider.
  bool get filterDangerQuestions;
}

class _CompletionStatusProviderElement
    extends
        AutoDisposeStreamProviderElement<
          ({int questionsCount, UserAnswersSummary summary})
        >
    with CompletionStatusRef {
  _CompletionStatusProviderElement(super.provider);

  @override
  Chapter? get chapter => (origin as CompletionStatusProvider).chapter;
  @override
  bool get filterDangerQuestions =>
      (origin as CompletionStatusProvider).filterDangerQuestions;
}

String _$firstUnansweredQuestionIndexHash() =>
    r'0ad6bfa968255bc633832410ea8cbe269cc1275b';

/// See also [firstUnansweredQuestionIndex].
@ProviderFor(firstUnansweredQuestionIndex)
const firstUnansweredQuestionIndexProvider =
    FirstUnansweredQuestionIndexFamily();

/// See also [firstUnansweredQuestionIndex].
class FirstUnansweredQuestionIndexFamily extends Family<AsyncValue<int?>> {
  /// See also [firstUnansweredQuestionIndex].
  const FirstUnansweredQuestionIndexFamily();

  /// See also [firstUnansweredQuestionIndex].
  FirstUnansweredQuestionIndexProvider call({
    Chapter? chapter,
    bool filterDangerQuestions = false,
  }) {
    return FirstUnansweredQuestionIndexProvider(
      chapter: chapter,
      filterDangerQuestions: filterDangerQuestions,
    );
  }

  @override
  FirstUnansweredQuestionIndexProvider getProviderOverride(
    covariant FirstUnansweredQuestionIndexProvider provider,
  ) {
    return call(
      chapter: provider.chapter,
      filterDangerQuestions: provider.filterDangerQuestions,
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
  String? get name => r'firstUnansweredQuestionIndexProvider';
}

/// See also [firstUnansweredQuestionIndex].
class FirstUnansweredQuestionIndexProvider
    extends AutoDisposeFutureProvider<int?> {
  /// See also [firstUnansweredQuestionIndex].
  FirstUnansweredQuestionIndexProvider({
    Chapter? chapter,
    bool filterDangerQuestions = false,
  }) : this._internal(
         (ref) => firstUnansweredQuestionIndex(
           ref as FirstUnansweredQuestionIndexRef,
           chapter: chapter,
           filterDangerQuestions: filterDangerQuestions,
         ),
         from: firstUnansweredQuestionIndexProvider,
         name: r'firstUnansweredQuestionIndexProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$firstUnansweredQuestionIndexHash,
         dependencies: FirstUnansweredQuestionIndexFamily._dependencies,
         allTransitiveDependencies:
             FirstUnansweredQuestionIndexFamily._allTransitiveDependencies,
         chapter: chapter,
         filterDangerQuestions: filterDangerQuestions,
       );

  FirstUnansweredQuestionIndexProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chapter,
    required this.filterDangerQuestions,
  }) : super.internal();

  final Chapter? chapter;
  final bool filterDangerQuestions;

  @override
  Override overrideWith(
    FutureOr<int?> Function(FirstUnansweredQuestionIndexRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FirstUnansweredQuestionIndexProvider._internal(
        (ref) => create(ref as FirstUnansweredQuestionIndexRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chapter: chapter,
        filterDangerQuestions: filterDangerQuestions,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int?> createElement() {
    return _FirstUnansweredQuestionIndexProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FirstUnansweredQuestionIndexProvider &&
        other.chapter == chapter &&
        other.filterDangerQuestions == filterDangerQuestions;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);
    hash = _SystemHash.combine(hash, filterDangerQuestions.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FirstUnansweredQuestionIndexRef on AutoDisposeFutureProviderRef<int?> {
  /// The parameter `chapter` of this provider.
  Chapter? get chapter;

  /// The parameter `filterDangerQuestions` of this provider.
  bool get filterDangerQuestions;
}

class _FirstUnansweredQuestionIndexProviderElement
    extends AutoDisposeFutureProviderElement<int?>
    with FirstUnansweredQuestionIndexRef {
  _FirstUnansweredQuestionIndexProviderElement(super.provider);

  @override
  Chapter? get chapter =>
      (origin as FirstUnansweredQuestionIndexProvider).chapter;
  @override
  bool get filterDangerQuestions =>
      (origin as FirstUnansweredQuestionIndexProvider).filterDangerQuestions;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_questions_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$dbQuestionsCountHash() => r'9d6a7f654d3e07588b6b7fd4828028c7ae86a058';

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

/// See also [dbQuestionsCount].
@ProviderFor(dbQuestionsCount)
const dbQuestionsCountProvider = DbQuestionsCountFamily();

/// See also [dbQuestionsCount].
class DbQuestionsCountFamily extends Family<AsyncValue<int>> {
  /// See also [dbQuestionsCount].
  const DbQuestionsCountFamily();

  /// See also [dbQuestionsCount].
  DbQuestionsCountProvider call({
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultyQuestions = false,
  }) {
    return DbQuestionsCountProvider(
      chapter: chapter,
      filterDangerQuestions: filterDangerQuestions,
      filterDifficultyQuestions: filterDifficultyQuestions,
    );
  }

  @override
  DbQuestionsCountProvider getProviderOverride(
    covariant DbQuestionsCountProvider provider,
  ) {
    return call(
      chapter: provider.chapter,
      filterDangerQuestions: provider.filterDangerQuestions,
      filterDifficultyQuestions: provider.filterDifficultyQuestions,
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
  String? get name => r'dbQuestionsCountProvider';
}

/// See also [dbQuestionsCount].
class DbQuestionsCountProvider extends AutoDisposeFutureProvider<int> {
  /// See also [dbQuestionsCount].
  DbQuestionsCountProvider({
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultyQuestions = false,
  }) : this._internal(
         (ref) => dbQuestionsCount(
           ref as DbQuestionsCountRef,
           chapter: chapter,
           filterDangerQuestions: filterDangerQuestions,
           filterDifficultyQuestions: filterDifficultyQuestions,
         ),
         from: dbQuestionsCountProvider,
         name: r'dbQuestionsCountProvider',
         debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
             ? null
             : _$dbQuestionsCountHash,
         dependencies: DbQuestionsCountFamily._dependencies,
         allTransitiveDependencies:
             DbQuestionsCountFamily._allTransitiveDependencies,
         chapter: chapter,
         filterDangerQuestions: filterDangerQuestions,
         filterDifficultyQuestions: filterDifficultyQuestions,
       );

  DbQuestionsCountProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.chapter,
    required this.filterDangerQuestions,
    required this.filterDifficultyQuestions,
  }) : super.internal();

  final Chapter? chapter;
  final bool filterDangerQuestions;
  final bool filterDifficultyQuestions;

  @override
  Override overrideWith(
    FutureOr<int> Function(DbQuestionsCountRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DbQuestionsCountProvider._internal(
        (ref) => create(ref as DbQuestionsCountRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        chapter: chapter,
        filterDangerQuestions: filterDangerQuestions,
        filterDifficultyQuestions: filterDifficultyQuestions,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<int> createElement() {
    return _DbQuestionsCountProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DbQuestionsCountProvider &&
        other.chapter == chapter &&
        other.filterDangerQuestions == filterDangerQuestions &&
        other.filterDifficultyQuestions == filterDifficultyQuestions;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, chapter.hashCode);
    hash = _SystemHash.combine(hash, filterDangerQuestions.hashCode);
    hash = _SystemHash.combine(hash, filterDifficultyQuestions.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin DbQuestionsCountRef on AutoDisposeFutureProviderRef<int> {
  /// The parameter `chapter` of this provider.
  Chapter? get chapter;

  /// The parameter `filterDangerQuestions` of this provider.
  bool get filterDangerQuestions;

  /// The parameter `filterDifficultyQuestions` of this provider.
  bool get filterDifficultyQuestions;
}

class _DbQuestionsCountProviderElement
    extends AutoDisposeFutureProviderElement<int>
    with DbQuestionsCountRef {
  _DbQuestionsCountProviderElement(super.provider);

  @override
  Chapter? get chapter => (origin as DbQuestionsCountProvider).chapter;
  @override
  bool get filterDangerQuestions =>
      (origin as DbQuestionsCountProvider).filterDangerQuestions;
  @override
  bool get filterDifficultyQuestions =>
      (origin as DbQuestionsCountProvider).filterDifficultyQuestions;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

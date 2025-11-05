// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmarks_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isBookmarkedStreamHash() =>
    r'd01a3d1952d699608ff0e7cf5588e2929b9e8dca';

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

/// See also [isBookmarkedStream].
@ProviderFor(isBookmarkedStream)
const isBookmarkedStreamProvider = IsBookmarkedStreamFamily();

/// See also [isBookmarkedStream].
class IsBookmarkedStreamFamily extends Family<AsyncValue<bool>> {
  /// See also [isBookmarkedStream].
  const IsBookmarkedStreamFamily();

  /// See also [isBookmarkedStream].
  IsBookmarkedStreamProvider call(Question question) {
    return IsBookmarkedStreamProvider(question);
  }

  @override
  IsBookmarkedStreamProvider getProviderOverride(
    covariant IsBookmarkedStreamProvider provider,
  ) {
    return call(provider.question);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'isBookmarkedStreamProvider';
}

/// See also [isBookmarkedStream].
class IsBookmarkedStreamProvider extends AutoDisposeStreamProvider<bool> {
  /// See also [isBookmarkedStream].
  IsBookmarkedStreamProvider(Question question)
    : this._internal(
        (ref) => isBookmarkedStream(ref as IsBookmarkedStreamRef, question),
        from: isBookmarkedStreamProvider,
        name: r'isBookmarkedStreamProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$isBookmarkedStreamHash,
        dependencies: IsBookmarkedStreamFamily._dependencies,
        allTransitiveDependencies:
            IsBookmarkedStreamFamily._allTransitiveDependencies,
        question: question,
      );

  IsBookmarkedStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.question,
  }) : super.internal();

  final Question question;

  @override
  Override overrideWith(
    Stream<bool> Function(IsBookmarkedStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: IsBookmarkedStreamProvider._internal(
        (ref) => create(ref as IsBookmarkedStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        question: question,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<bool> createElement() {
    return _IsBookmarkedStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is IsBookmarkedStreamProvider && other.question == question;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, question.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin IsBookmarkedStreamRef on AutoDisposeStreamProviderRef<bool> {
  /// The parameter `question` of this provider.
  Question get question;
}

class _IsBookmarkedStreamProviderElement
    extends AutoDisposeStreamProviderElement<bool>
    with IsBookmarkedStreamRef {
  _IsBookmarkedStreamProviderElement(super.provider);

  @override
  Question get question => (origin as IsBookmarkedStreamProvider).question;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_answers_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userAnswersCountStreamHash() =>
    r'61805928a5aa63e99bcfe9d048c2095188550d09';

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

/// See also [userAnswersCountStream].
@ProviderFor(userAnswersCountStream)
const userAnswersCountStreamProvider = UserAnswersCountStreamFamily();

/// See also [userAnswersCountStream].
class UserAnswersCountStreamFamily extends Family<AsyncValue<int>> {
  /// See also [userAnswersCountStream].
  const UserAnswersCountStreamFamily();

  /// See also [userAnswersCountStream].
  UserAnswersCountStreamProvider call(License license) {
    return UserAnswersCountStreamProvider(license);
  }

  @override
  UserAnswersCountStreamProvider getProviderOverride(
    covariant UserAnswersCountStreamProvider provider,
  ) {
    return call(provider.license);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userAnswersCountStreamProvider';
}

/// See also [userAnswersCountStream].
class UserAnswersCountStreamProvider extends AutoDisposeStreamProvider<int> {
  /// See also [userAnswersCountStream].
  UserAnswersCountStreamProvider(License license)
    : this._internal(
        (ref) =>
            userAnswersCountStream(ref as UserAnswersCountStreamRef, license),
        from: userAnswersCountStreamProvider,
        name: r'userAnswersCountStreamProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$userAnswersCountStreamHash,
        dependencies: UserAnswersCountStreamFamily._dependencies,
        allTransitiveDependencies:
            UserAnswersCountStreamFamily._allTransitiveDependencies,
        license: license,
      );

  UserAnswersCountStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.license,
  }) : super.internal();

  final License license;

  @override
  Override overrideWith(
    Stream<int> Function(UserAnswersCountStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UserAnswersCountStreamProvider._internal(
        (ref) => create(ref as UserAnswersCountStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        license: license,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int> createElement() {
    return _UserAnswersCountStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserAnswersCountStreamProvider && other.license == license;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, license.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserAnswersCountStreamRef on AutoDisposeStreamProviderRef<int> {
  /// The parameter `license` of this provider.
  License get license;
}

class _UserAnswersCountStreamProviderElement
    extends AutoDisposeStreamProviderElement<int>
    with UserAnswersCountStreamRef {
  _UserAnswersCountStreamProviderElement(super.provider);

  @override
  License get license => (origin as UserAnswersCountStreamProvider).license;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

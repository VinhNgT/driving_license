// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sembast_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sembastHash() => r'fe71f0eef6f6111e576341331c5397dc80e6b2b5';

/// See also [sembast].
@ProviderFor(sembast)
final sembastProvider = FutureProvider<Database>.internal(
  sembast,
  name: r'sembastProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$sembastHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SembastRef = FutureProviderRef<Database>;
String _$inMemorySembastHash() => r'81057202af159c1b479e3d783e2492fb19bc6334';

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

abstract class _$InMemorySembast extends BuildlessAsyncNotifier<Database> {
  late final String dbName;

  FutureOr<Database> build(String dbName);
}

/// See also [InMemorySembast].
@ProviderFor(InMemorySembast)
const inMemorySembastProvider = InMemorySembastFamily();

/// See also [InMemorySembast].
class InMemorySembastFamily extends Family<AsyncValue<Database>> {
  /// See also [InMemorySembast].
  const InMemorySembastFamily();

  /// See also [InMemorySembast].
  InMemorySembastProvider call(String dbName) {
    return InMemorySembastProvider(dbName);
  }

  @override
  InMemorySembastProvider getProviderOverride(
    covariant InMemorySembastProvider provider,
  ) {
    return call(provider.dbName);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'inMemorySembastProvider';
}

/// See also [InMemorySembast].
class InMemorySembastProvider
    extends AsyncNotifierProviderImpl<InMemorySembast, Database> {
  /// See also [InMemorySembast].
  InMemorySembastProvider(String dbName)
    : this._internal(
        () => InMemorySembast()..dbName = dbName,
        from: inMemorySembastProvider,
        name: r'inMemorySembastProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$inMemorySembastHash,
        dependencies: InMemorySembastFamily._dependencies,
        allTransitiveDependencies:
            InMemorySembastFamily._allTransitiveDependencies,
        dbName: dbName,
      );

  InMemorySembastProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dbName,
  }) : super.internal();

  final String dbName;

  @override
  FutureOr<Database> runNotifierBuild(covariant InMemorySembast notifier) {
    return notifier.build(dbName);
  }

  @override
  Override overrideWith(InMemorySembast Function() create) {
    return ProviderOverride(
      origin: this,
      override: InMemorySembastProvider._internal(
        () => create()..dbName = dbName,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dbName: dbName,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<InMemorySembast, Database> createElement() {
    return _InMemorySembastProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InMemorySembastProvider && other.dbName == dbName;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dbName.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InMemorySembastRef on AsyncNotifierProviderRef<Database> {
  /// The parameter `dbName` of this provider.
  String get dbName;
}

class _InMemorySembastProviderElement
    extends AsyncNotifierProviderElement<InMemorySembast, Database>
    with InMemorySembastRef {
  _InMemorySembastProviderElement(super.provider);

  @override
  String get dbName => (origin as InMemorySembastProvider).dbName;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

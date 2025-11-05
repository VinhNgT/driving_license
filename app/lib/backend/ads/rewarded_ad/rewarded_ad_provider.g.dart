// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewarded_ad_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$rewardedAdFutureHash() => r'dcf94b2807b0b9e4c4e204c087efb660462a3471';

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

abstract class _$RewardedAdFuture extends BuildlessAsyncNotifier<RewardedAd> {
  late final AdUnit adUnit;

  FutureOr<RewardedAd> build(AdUnit adUnit);
}

/// See also [RewardedAdFuture].
@ProviderFor(RewardedAdFuture)
const rewardedAdFutureProvider = RewardedAdFutureFamily();

/// See also [RewardedAdFuture].
class RewardedAdFutureFamily extends Family<AsyncValue<RewardedAd>> {
  /// See also [RewardedAdFuture].
  const RewardedAdFutureFamily();

  /// See also [RewardedAdFuture].
  RewardedAdFutureProvider call(AdUnit adUnit) {
    return RewardedAdFutureProvider(adUnit);
  }

  @override
  RewardedAdFutureProvider getProviderOverride(
    covariant RewardedAdFutureProvider provider,
  ) {
    return call(provider.adUnit);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'rewardedAdFutureProvider';
}

/// See also [RewardedAdFuture].
class RewardedAdFutureProvider
    extends AsyncNotifierProviderImpl<RewardedAdFuture, RewardedAd> {
  /// See also [RewardedAdFuture].
  RewardedAdFutureProvider(AdUnit adUnit)
    : this._internal(
        () => RewardedAdFuture()..adUnit = adUnit,
        from: rewardedAdFutureProvider,
        name: r'rewardedAdFutureProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$rewardedAdFutureHash,
        dependencies: RewardedAdFutureFamily._dependencies,
        allTransitiveDependencies:
            RewardedAdFutureFamily._allTransitiveDependencies,
        adUnit: adUnit,
      );

  RewardedAdFutureProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.adUnit,
  }) : super.internal();

  final AdUnit adUnit;

  @override
  FutureOr<RewardedAd> runNotifierBuild(covariant RewardedAdFuture notifier) {
    return notifier.build(adUnit);
  }

  @override
  Override overrideWith(RewardedAdFuture Function() create) {
    return ProviderOverride(
      origin: this,
      override: RewardedAdFutureProvider._internal(
        () => create()..adUnit = adUnit,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        adUnit: adUnit,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<RewardedAdFuture, RewardedAd> createElement() {
    return _RewardedAdFutureProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RewardedAdFutureProvider && other.adUnit == adUnit;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, adUnit.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RewardedAdFutureRef on AsyncNotifierProviderRef<RewardedAd> {
  /// The parameter `adUnit` of this provider.
  AdUnit get adUnit;
}

class _RewardedAdFutureProviderElement
    extends AsyncNotifierProviderElement<RewardedAdFuture, RewardedAd>
    with RewardedAdFutureRef {
  _RewardedAdFutureProviderElement(super.provider);

  @override
  AdUnit get adUnit => (origin as RewardedAdFutureProvider).adUnit;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

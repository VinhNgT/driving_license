// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inline_banner_ad_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$inlineBannerAdStreamHash() =>
    r'34dab8bac3b3213ff97695569ef741b0cad29756';

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

abstract class _$InlineBannerAdStream
    extends BuildlessStreamNotifier<PlatformBannerAd> {
  late final AdUnit adUnit;
  late final InLineBannerAdConfig? config;

  Stream<PlatformBannerAd> build(AdUnit adUnit, InLineBannerAdConfig? config);
}

/// See also [InlineBannerAdStream].
@ProviderFor(InlineBannerAdStream)
const inlineBannerAdStreamProvider = InlineBannerAdStreamFamily();

/// See also [InlineBannerAdStream].
class InlineBannerAdStreamFamily extends Family<AsyncValue<PlatformBannerAd>> {
  /// See also [InlineBannerAdStream].
  const InlineBannerAdStreamFamily();

  /// See also [InlineBannerAdStream].
  InlineBannerAdStreamProvider call(
    AdUnit adUnit,
    InLineBannerAdConfig? config,
  ) {
    return InlineBannerAdStreamProvider(adUnit, config);
  }

  @override
  InlineBannerAdStreamProvider getProviderOverride(
    covariant InlineBannerAdStreamProvider provider,
  ) {
    return call(provider.adUnit, provider.config);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'inlineBannerAdStreamProvider';
}

/// See also [InlineBannerAdStream].
class InlineBannerAdStreamProvider
    extends StreamNotifierProviderImpl<InlineBannerAdStream, PlatformBannerAd> {
  /// See also [InlineBannerAdStream].
  InlineBannerAdStreamProvider(AdUnit adUnit, InLineBannerAdConfig? config)
    : this._internal(
        () => InlineBannerAdStream()
          ..adUnit = adUnit
          ..config = config,
        from: inlineBannerAdStreamProvider,
        name: r'inlineBannerAdStreamProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$inlineBannerAdStreamHash,
        dependencies: InlineBannerAdStreamFamily._dependencies,
        allTransitiveDependencies:
            InlineBannerAdStreamFamily._allTransitiveDependencies,
        adUnit: adUnit,
        config: config,
      );

  InlineBannerAdStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.adUnit,
    required this.config,
  }) : super.internal();

  final AdUnit adUnit;
  final InLineBannerAdConfig? config;

  @override
  Stream<PlatformBannerAd> runNotifierBuild(
    covariant InlineBannerAdStream notifier,
  ) {
    return notifier.build(adUnit, config);
  }

  @override
  Override overrideWith(InlineBannerAdStream Function() create) {
    return ProviderOverride(
      origin: this,
      override: InlineBannerAdStreamProvider._internal(
        () => create()
          ..adUnit = adUnit
          ..config = config,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        adUnit: adUnit,
        config: config,
      ),
    );
  }

  @override
  StreamNotifierProviderElement<InlineBannerAdStream, PlatformBannerAd>
  createElement() {
    return _InlineBannerAdStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is InlineBannerAdStreamProvider &&
        other.adUnit == adUnit &&
        other.config == config;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, adUnit.hashCode);
    hash = _SystemHash.combine(hash, config.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin InlineBannerAdStreamRef on StreamNotifierProviderRef<PlatformBannerAd> {
  /// The parameter `adUnit` of this provider.
  AdUnit get adUnit;

  /// The parameter `config` of this provider.
  InLineBannerAdConfig? get config;
}

class _InlineBannerAdStreamProviderElement
    extends
        StreamNotifierProviderElement<InlineBannerAdStream, PlatformBannerAd>
    with InlineBannerAdStreamRef {
  _InlineBannerAdStreamProviderElement(super.provider);

  @override
  AdUnit get adUnit => (origin as InlineBannerAdStreamProvider).adUnit;
  @override
  InLineBannerAdConfig? get config =>
      (origin as InlineBannerAdStreamProvider).config;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

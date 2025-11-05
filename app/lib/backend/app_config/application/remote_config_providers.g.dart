// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_config_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firebaseRemoteConfigFutureHash() =>
    r'13207ddabd6de2d935e9ac76d971f8a56727f456';

/// See also [firebaseRemoteConfigFuture].
@ProviderFor(firebaseRemoteConfigFuture)
final firebaseRemoteConfigFutureProvider =
    FutureProvider<FirebaseRemoteConfig>.internal(
      firebaseRemoteConfigFuture,
      name: r'firebaseRemoteConfigFutureProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$firebaseRemoteConfigFutureHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirebaseRemoteConfigFutureRef = FutureProviderRef<FirebaseRemoteConfig>;
String _$remoteConfigUpdateStreamHash() =>
    r'577733ce17a2dc2d148e2dccae8bf5c1b9223e85';

/// See also [_remoteConfigUpdateStream].
@ProviderFor(_remoteConfigUpdateStream)
final _remoteConfigUpdateStreamProvider =
    StreamProvider<RemoteConfigUpdate>.internal(
      _remoteConfigUpdateStream,
      name: r'_remoteConfigUpdateStreamProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$remoteConfigUpdateStreamHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef _RemoteConfigUpdateStreamRef = StreamProviderRef<RemoteConfigUpdate>;
String _$remoteConfigDataFutureHash() =>
    r'3e8eee6efa4213a2a4fe8b8e942dd28d02ab3406';

/// See also [RemoteConfigDataFuture].
@ProviderFor(RemoteConfigDataFuture)
final remoteConfigDataFutureProvider =
    AsyncNotifierProvider<RemoteConfigDataFuture, AppConfigData>.internal(
      RemoteConfigDataFuture.new,
      name: r'remoteConfigDataFutureProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$remoteConfigDataFutureHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RemoteConfigDataFuture = AsyncNotifier<AppConfigData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

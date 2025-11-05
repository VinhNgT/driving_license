import 'package:driving_license/backend/app_config/application/local_config_providers.dart';
import 'package:driving_license/backend/app_config/application/remote_config_providers.dart';
import 'package:driving_license/backend/app_config/domain/app_config_data.dart';
import 'package:driving_license/backend/env/application/env_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_config.g.dart';

@Riverpod(keepAlive: true)
FutureOr<AppConfigData> appConfig(Ref ref) {
  final isRemoteConfigEnabled = ref.watch(
    envProvider.select((value) => value.enableRemoteConfig),
  );

  if (isRemoteConfigEnabled) {
    return ref.watch(remoteConfigDataFutureProvider).requireValue;
  }

  return ref.watch(localConfigDataProvider);
}

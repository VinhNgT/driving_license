import 'package:driving_license/backend/app_config/domain/app_config_data.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'local_config_providers.g.dart';

@Riverpod(keepAlive: true)
AppConfigData localConfigData(Ref ref) {
  return const AppConfigData(
    gsFeedbackPostLink: '',
    disableDonationCard: false,
    unlockAllFeatures: false,
  );
}

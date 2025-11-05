import 'package:driving_license/backend/env/domain/env_data.dart';
import 'package:driving_license/logging/logger_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'env_provider.g.dart';

@Riverpod(keepAlive: true)
EnvData env(Ref ref) {
  final envData = EnvData.fromEnviroment();
  final logger = ref.watch(loggerProvider);

  debugPrint('Environment variables loaded');
  logger.i(envData.toJson());

  return envData;
}

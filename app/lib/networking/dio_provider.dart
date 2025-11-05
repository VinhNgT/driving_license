import 'package:dio/dio.dart';
import 'package:driving_license/constants/app_flavor.dart';
import 'package:driving_license/logging/logger_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dio_provider.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) {
  final dio = Dio();
  final logger = ref.watch(loggerProvider);

  if (!isAppBuiltWithFlavor(AppFlavor.prod)) {
    dio.interceptors.addAll([LogInterceptor(), DataLogIntercepter(logger)]);
  }

  ref.onDispose(dio.close);
  return dio;
}

class DataLogIntercepter extends Interceptor {
  const DataLogIntercepter(this.logger);
  final Logger logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.queryParameters.isNotEmpty) {
      debugPrint('Query Parameters:');
      logger.i(options.queryParameters);
    }

    if (options.data != null) {
      debugPrint('Request Data:');
      logger.i(options.data);
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('Response Data:');
    logger.i(response);

    handler.next(response);
  }
}

import 'package:driving_license/backend/ads/ad_unit.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

mixin AdStatusLogger {
  void log(
    Logger logger,
    AdUnit adUnit,
    AsyncValue? previous,
    AsyncValue next,
  ) {
    switch (next) {
      case AsyncValue(:final error, :final stackTrace) when error != null:
        logger.e(
          '$adUnit ad failed to load',
          error: error,
          stackTrace: stackTrace,
        );

      case AsyncValue(isLoading: true):
        debugPrint('Loading $adUnit ad');

      case AsyncValue(:final value):
        if (previous?.value == value) {
          debugPrint('$adUnit ad updated');
          return;
        }
        debugPrint('$adUnit ad loaded');
    }
  }
}

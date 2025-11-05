import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'debug_menu_controller.g.dart';

@Riverpod(keepAlive: true)
class DebugMenuController extends _$DebugMenuController {
  int _count = 0;

  @override
  bool build() {
    listenSelf((previous, next) {
      if (previous == false && next) {
        debugPrint('Debug menu is enabled');
      }

      if (previous == true && !next) {
        debugPrint('Debug menu is disabled');
        _count = 0;
      }
    });

    return false;
  }

  void trigger() {
    _count++;
    debugPrint('Debug trigger count: $_count');
    state = _count % 3 == 0;
  }
}

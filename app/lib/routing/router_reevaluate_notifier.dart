import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router_reevaluate_notifier.g.dart';

class RouterReevaluateNotifier extends ChangeNotifier {
  void notifyRouter() {
    notifyListeners();
  }
}

@Riverpod(keepAlive: true)
Raw<RouterReevaluateNotifier> routerReevaluateNotifier(Ref ref) {
  return RouterReevaluateNotifier();
}

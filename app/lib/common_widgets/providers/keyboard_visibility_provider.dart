import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'keyboard_visibility_provider.g.dart';

@riverpod
class KeyboardVisibility extends _$KeyboardVisibility {
  @override
  bool build() {
    final keyboardVisibilityController = KeyboardVisibilityController();

    final sub = keyboardVisibilityController.onChange.listen((isVisible) {
      state = isVisible;
    });
    ref.onDispose(sub.cancel);

    return keyboardVisibilityController.isVisible;
  }
}

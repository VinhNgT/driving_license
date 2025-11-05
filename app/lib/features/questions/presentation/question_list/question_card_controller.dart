import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'question_card_controller.g.dart';

@riverpod
class QuestionCardPrototypeHeight extends _$QuestionCardPrototypeHeight {
  @override
  double? build() {
    return null;
  }

  set value(double value) {
    state = value;
  }
}

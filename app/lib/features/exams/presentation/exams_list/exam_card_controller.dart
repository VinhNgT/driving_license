import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exam_card_controller.g.dart';

@riverpod
class ExamCardPrototypeHeight extends _$ExamCardPrototypeHeight {
  @override
  double? build() {
    return null;
  }

  set value(double value) {
    state = value;
  }
}

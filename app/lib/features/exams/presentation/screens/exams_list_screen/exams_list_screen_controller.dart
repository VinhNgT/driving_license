import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exams_list_screen_controller.g.dart';

enum ExamsListState { view, edit, delete }

@riverpod
class ExamsListScreenState extends _$ExamsListScreenState {
  @override
  ExamsListState build() {
    return ExamsListState.view;
  }

  set value(ExamsListState value) {
    super.state = value;
  }
}

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/questions/application/question/providers/db_questions_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chapters_providers.g.dart';

@riverpod
FutureOr<List<Chapter>> notEmptyChapters(Ref ref) async {
  final chaptersQuestionsCount = await Future.wait(
    Chapter.values.map(
      (chapter) => ref.watch(dbQuestionsCountProvider(chapter: chapter).future),
    ),
  );

  return Chapter.values
      .where((chapter) => chaptersQuestionsCount[chapter.index] > 0)
      .toList();
}

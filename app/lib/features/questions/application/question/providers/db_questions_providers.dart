import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_questions_providers.g.dart';

@riverpod
FutureOr<int> dbQuestionsCount(
  Ref ref, {
  Chapter? chapter,
  bool filterDangerQuestions = false,
  bool filterDifficultyQuestions = false,
}) async {
  final license = await ref.watch(userSelectedLicenseProvider.future);
  final questionsRepository = ref.watch(questionsRepositoryProvider);

  return questionsRepository.getQuestionsCount(
    license,
    chapter: chapter,
    filterDangerQuestions: filterDangerQuestions,
    filterDifficultQuestions: filterDifficultyQuestions,
  );
}

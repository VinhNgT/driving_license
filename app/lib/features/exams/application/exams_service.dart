import 'package:driving_license/features/exams/application/questions_selector.dart';
import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exams_service.g.dart';

class ExamsService {
  ExamsService({
    required this.examsRepository,
    required this.questionsRepository,
    required this.license,
  }) {
    _questionSelector = QuestionSelector(
      license: license,
      questionsRepository: questionsRepository,
    );
  }

  final ExamsRepository examsRepository;
  final QuestionsRepository questionsRepository;
  final License license;

  late final QuestionSelector _questionSelector;

  FutureOr<void> createExam() async {
    final examQuestions = await _questionSelector.generateQuestions();
    final exam = Exam.createNew(
      license: license,
      questionDbIndexes: examQuestions,
    );

    examsRepository.saveExam(exam);
  }
}

@riverpod
FutureOr<ExamsService> examsService(Ref ref) async {
  final examsRepository = ref.watch(examsRepositoryProvider);
  final questionsRepository = ref.watch(questionsRepositoryProvider);
  final license = await ref.watch(userSelectedLicenseProvider.future);

  return ExamsService(
    examsRepository: examsRepository,
    questionsRepository: questionsRepository,
    license: license,
  );
}

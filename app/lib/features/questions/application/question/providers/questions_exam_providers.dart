import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/questions/application/question/questions_service.dart';
import 'package:driving_license/features/questions/application/question/questions_service_mode.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_exam_providers.g.dart';

@riverpod
Stream<Exam> currentExam(Ref ref) async* {
  final currentQuestionsServiceMode = ref.watch(
    currentQuestionsServiceModeProvider,
  );
  final examsRepository = ref.watch(examsRepositoryProvider);

  if (currentQuestionsServiceMode case ExamOperatingMode(
    exam: Exam(:final examId),
  )) {
    yield* examsRepository.watchExamById(examId);
  }

  throw StateError(
    'QuestionsService is not in ExamOperatingMode, cannot get '
    'current exam.',
  );
}

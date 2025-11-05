import 'package:driving_license/features/exams/data/exams_repository.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'exams_providers.g.dart';

@riverpod
Stream<List<Exam>> examsListStream(Ref ref) async* {
  final license = await ref.watch(userSelectedLicenseProvider.future);
  final examsRepository = ref.watch(examsRepositoryProvider);
  yield* examsRepository.watchAllExamsByLicense(license);
}

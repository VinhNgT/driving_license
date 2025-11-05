import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_answers_provider.g.dart';

@riverpod
Stream<int> userAnswersCountStream(Ref ref, License license) {
  return ref
      .watch(userAnswersRepositoryProvider)
      .watchUserAnswersCount(license);
}

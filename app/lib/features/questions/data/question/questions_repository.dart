import 'package:driving_license/backend/database/sqlite_provider.dart';
import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/chapters/domain/sub_chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/sqlite_questions_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'questions_repository.g.dart';

abstract interface class QuestionsRepository {
  static int pageSize = 20;

  FutureOr<Question> getQuestionByDbIndex(int dbIndex);

  FutureOr<Question> getQuestion(
    License license,
    int index, {
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultQuestions = false,
  });

  FutureOr<int> getQuestionsCount(
    License license, {
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultQuestions = false,
  });

  FutureOr<Iterable<int>> getQuestionDbIndexes(
    License license, {
    Chapter? chapter,
    SubChapter? subChapter,
    bool filterDangerQuestions = false,
    bool skipDangerQuesions = false,
  });

  FutureOr<List<Question>> getQuestionsPage(
    License license,
    int pageNumber, {
    Chapter? chapter,
    bool filterDangerQuestions = false,
    bool filterDifficultQuestions = false,
  });

  FutureOr<List<Question>> getQuestionsPageByDbIndexes(
    Iterable<int> dbIndexes,
    int pageNumber,
  );
}

@riverpod
QuestionsRepository questionsRepository(Ref ref) {
  final sqliteDatabase = ref.watch(sqliteProvider).requireValue;
  return SqliteQuestionsRepository(sqliteDatabase);
}

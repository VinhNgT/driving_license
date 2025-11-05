import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/user_answer/user_answers_repository.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/domain/user_answer.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:driving_license/features/questions/domain/user_answers_summary.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sembast/sembast.dart';

class SembastUserAnswersRepository
    with _FilterMixin
    implements UserAnswersRepository {
  SembastUserAnswersRepository(this.db);

  final Database db;
  final allAnswersStore = intMapStoreFactory.store('all_answers');

  @override
  Future<void> saveAnswer(
    Question question,
    int selectedAnswerIndex,
  ) async {
    final userAnswer = UserAnswer(
      questionMetadata: question.metadata,
      selectedAnswerIndex: selectedAnswerIndex,
    );

    await allAnswersStore
        .record(question.questionDbIndex)
        .put(db, userAnswer.toJson());
  }

  @override
  Future<void> clearAnswer(Question question) async {
    await allAnswersStore.record(question.questionDbIndex).delete(db);
  }

  @override
  Future<void> clearAllAnswers(
    License license, {
    Chapter? chapter,
    bool filterDangerAnswers = false,
  }) async {
    await allAnswersStore.delete(
      db,
      finder: Finder(
        filter: Filter.and([
          _licenseFilter(license),
          if (chapter != null) _chapterFilter(chapter),
          if (filterDangerAnswers) _dangerQuestionsFilter,
        ]),
      ),
    );
  }

  @override
  Future<void> clearDatabase() async {
    await allAnswersStore.delete(db);
  }

  @override
  Stream<int?> watchUserSelectedAnswerIndex(Question question) {
    final recordSnapshotStream =
        allAnswersStore.record(question.questionDbIndex).onSnapshot(db);

    return recordSnapshotStream.map((snapshot) {
      if (snapshot == null) {
        return null;
      }

      final userAnswerJson = snapshot.value as Map<String, dynamic>;
      final userAnswer = UserAnswer.fromJson(userAnswerJson);
      return userAnswer.selectedAnswerIndex;
    });
  }

  @override
  Future<UserAnswersMap> getAllAnswers(
    License license, {
    Chapter? chapter,
    bool filterWrongAnswers = false,
    bool filterDangerAnswers = false,
    bool filterDifficultAnswers = false,
  }) async {
    final recordSnapshot = await allAnswersStore.find(
      db,
      finder: Finder(
        filter: Filter.and([
          _licenseFilter(license),
          if (chapter != null) _chapterFilter(chapter),
          if (filterWrongAnswers) _wrongAnswersFilter,
          if (filterDangerAnswers) _dangerQuestionsFilter,
          if (filterDifficultAnswers) _difficultQuestionsFilter,
        ]),
      ),
    );

    return UserAnswersMap.fromUserAnswers(
      recordSnapshot.map(
        (record) => UserAnswer.fromJson(record.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  Stream<UserAnswersSummary> watchUserAnswersSummary(
    License license, {
    Chapter? chapter,
    bool filterDangerAnswers = false,
  }) {
    final counter = _Counter(
      db: db,
      store: allAnswersStore,
      license: license,
      chapter: chapter,
    );

    final correctCountStream = counter.count([
      _correctAnswersFilter,
      if (filterDangerAnswers) _dangerQuestionsFilter,
    ]);

    final wrongCountStream = counter.count([
      _wrongAnswersFilter,
      if (filterDangerAnswers) _dangerQuestionsFilter,
    ]);

    final isDangerCountStream = counter.count([
      _dangerQuestionsFilter,
    ]);

    final wrongIsDangerCountStream = counter.count([
      _wrongAnswersFilter,
      _dangerQuestionsFilter,
    ]);

    return Rx.combineLatestList([
      correctCountStream,
      wrongCountStream,
      isDangerCountStream,
      wrongIsDangerCountStream,
    ]).map((counts) {
      final [correct, wrong, isDanger, wrongIsDanger] = counts;
      return UserAnswersSummary(
        correct: correct,
        wrong: wrong,
        isDanger: isDanger,
        wrongIsDanger: wrongIsDanger,
      );
    });
  }

  @override
  Future<int?> getFirstUnansweredPositionInList(Iterable<int> dbIndexes) async {
    int location = -1;

    for (final dbIndex in dbIndexes) {
      location++;

      final recordSnapshot =
          await allAnswersStore.record(dbIndex).getSnapshot(db);

      if (recordSnapshot == null) {
        return location;
      }
    }

    return null;
  }

  @override
  Future<UserAnswersMap> getAnswersByQuestionDbIndexes(
    Iterable<int> dbIndexes,
  ) async {
    final recordSnapshot = await allAnswersStore.find(
      db,
      finder: Finder(
        filter: Filter.inList(
          'questionMetadata.questionDbIndex',
          dbIndexes.toList(),
        ),
      ),
    );

    return UserAnswersMap.fromUserAnswers(
      recordSnapshot.map(
        (record) => UserAnswer.fromJson(record.value as Map<String, dynamic>),
      ),
    );
  }

  @override
  Stream<int> watchUserAnswersCount(License license) {
    return _Counter(
      db: db,
      store: allAnswersStore,
      license: license,
    ).count();
  }
}

mixin _FilterMixin {
  Filter _chapterFilter(Chapter chapter) {
    return Filter.equals(
      'questionMetadata.chapterDbIndex',
      chapter.chapterDbIndex,
    );
  }

  Filter _licenseFilter(License license) {
    if (license == License.all) {
      return Filter.custom((_) => true);
    }

    return Filter.matches(
      'questionMetadata.includedLicenses',
      license.name,
      anyInList: true,
    );
  }

  Filter get _correctAnswersFilter {
    return Filter.custom((record) {
      return record['questionMetadata.correctAnswerIndex'] ==
          record['selectedAnswerIndex'];
    });
  }

  Filter get _wrongAnswersFilter {
    return Filter.not(_correctAnswersFilter);
  }

  Filter get _difficultQuestionsFilter {
    return Filter.equals('questionMetadata.isDifficult', true);
  }

  Filter get _dangerQuestionsFilter {
    return Filter.equals('questionMetadata.isDanger', true);
  }
}

/// A helper class to count the number of records in an user answers store.
class _Counter with _FilterMixin {
  _Counter({
    required this.db,
    required this.store,
    required this.license,
    this.chapter,
  });

  final Database db;
  final StoreRef store;
  final License license;
  final Chapter? chapter;

  Stream<int> count([List<Filter> filters = const []]) {
    return store
        .query(
          finder: Finder(
            filter: Filter.and([
              _licenseFilter(license),
              if (chapter != null) _chapterFilter(chapter!),
              ...filters,
            ]),
          ),
        )
        .onCount(db);
  }
}

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/chapters/domain/sub_chapter.dart';
import 'package:driving_license/features/exams/domain/exam_info.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/data/question/questions_repository.dart';
import 'package:driving_license/utils/random_utils.dart';
import 'package:flutter/foundation.dart';

class QuestionSelector {

  const QuestionSelector({
    required this.license,
    required this.questionsRepository,
  });
  final QuestionsRepository questionsRepository;
  final License license;

  Future<List<int>> generateQuestions() async {
    final chapterExamDetails =
        license.examInfo.examStructure.chapterExamDetails;
    final result = <int>[];

    // Add is_danger questions
    result.addAll(
      await _chooseDangerQuestion(
        license.examInfo.examStructure.dangerQuestionsCount,
      ),
    );

    // Add questions of chapters that does not use pool
    final chapterExamDetailsWithoutPool = {
      for (final entry in chapterExamDetails.entries)
        if (!entry.value.isInPool) entry.key: entry.value,
    };
    result.addAll(
      await _generateChapterQuestions(chapterExamDetailsWithoutPool),
    );

    // Add questions of chapters that use pool
    final chapterExamDetailsWithPool = {
      for (final entry in chapterExamDetails.entries)
        if (entry.value.isInPool) entry.key: entry.value,
    };

    if (chapterExamDetailsWithPool.isNotEmpty) {
      final randomInPool = chooseRandomFromMap(chapterExamDetailsWithPool, 1);
      result.addAll(
        await _generateChapterQuestions(randomInPool),
      );
    }

    // Validate the generated questions list length
    try {
      if (result.length != license.examInfo.totalExamQuestions) {
        throw Exception(
          'Generated questions list length does not match the total '
          'exam questions\n'
          'Generated questions count: ${result.length}, '
          'Total exam questions: ${license.examInfo.totalExamQuestions}',
        );
      }
    } catch (e) {
      debugPrint('Error generating questions: $e');
    }

    // Return the final result
    return result..sort();
  }
}

extension _QuestionSelectorX on QuestionSelector {
  Future<List<int>> _generateChapterQuestions(
    Map<Chapter, ChapterExamInfo> chapterExamDetails,
  ) async {
    final result = <int>[];

    for (final chapterInfo in chapterExamDetails.entries) {
      switch (chapterInfo.value) {
        case SubChapterExamInfo(:final questionsCountBySubChapter):
          for (final subChapterQuestionsCount
              in questionsCountBySubChapter.entries) {
            result.addAll(
              await _chooseSubChapterQuestions(
                subChapterQuestionsCount.key,
                subChapterQuestionsCount.value,
              ),
            );
          }

        case ChapterExamInfo(:final chapterQuestionsCount):
          result.addAll(
            await _chooseChapterQuestions(
              chapterInfo.key,
              chapterQuestionsCount,
            ),
          );
      }
    }

    return result;
  }

  Future<List<int>> _chooseDangerQuestion(int count) async {
    final dangerQuestionDbIndexes = await this
        .questionsRepository
        .getQuestionDbIndexes(license, filterDangerQuestions: true);

    if (dangerQuestionDbIndexes.length < count) {
      throw Exception(
        'Not enough danger questions to choose from\n'
        'Count: $count, '
        'Danger questions list length: ${dangerQuestionDbIndexes.length}',
      );
    }

    return chooseRandomsFromList(
      dangerQuestionDbIndexes.toList(),
      count,
    );
  }

  Future<List<int>> _chooseSubChapterQuestions(
    SubChapter subChapter,
    int count,
  ) async {
    final subChapterQuestionDbIndexes =
        await this.questionsRepository.getQuestionDbIndexes(
              license,
              subChapter: subChapter,
              skipDangerQuesions: true,
            );

    if (subChapterQuestionDbIndexes.length < count) {
      throw Exception(
        'Not enough sub chapter questions to choose from\n'
        'Sub chapter: $subChapter, '
        'Count: $count, '
        'Sub chapter questions list length: '
        '${subChapterQuestionDbIndexes.length}',
      );
    }

    return chooseRandomsFromList(
      subChapterQuestionDbIndexes.toList(),
      count,
    );
  }

  Future<List<int>> _chooseChapterQuestions(
    Chapter chapter,
    int count,
  ) async {
    final chapterQuestionDbIndexes =
        await this.questionsRepository.getQuestionDbIndexes(
              license,
              chapter: chapter,
              skipDangerQuesions: true,
            );

    if (chapterQuestionDbIndexes.length < count) {
      throw Exception(
        'Not enough chapter questions to choose from\n'
        'Chapter: $chapter, '
        'Count: $count, '
        'Chapter questions list length: ${chapterQuestionDbIndexes.length}',
      );
    }

    return chooseRandomsFromList(
      chapterQuestionDbIndexes.toList(),
      count,
    );
  }
}

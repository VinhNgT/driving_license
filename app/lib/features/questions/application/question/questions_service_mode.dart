import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/exams/domain/exam.dart';
import 'package:flutter/material.dart';

@immutable
sealed class QuestionsServiceMode {
  const QuestionsServiceMode();
  String get description;
}

class FullOperatingMode extends QuestionsServiceMode {
  const FullOperatingMode();

  @override
  String get description => 'All 600 questions operating mode';
}

class ChapterOperatingMode extends QuestionsServiceMode {
  const ChapterOperatingMode(this.chapter);
  final Chapter chapter;

  @override
  String get description => 'Chapter ${chapter.chapterDbIndex} operating mode';
}

class DangerOperatingMode extends QuestionsServiceMode {
  const DangerOperatingMode();

  @override
  String get description => 'All danger questions operating mode';
}

class DifficultOperatingMode extends QuestionsServiceMode {
  const DifficultOperatingMode();

  @override
  String get description => 'All difficult questions operating mode';
}

class WrongAnswersOperatingMode extends QuestionsServiceMode {
  const WrongAnswersOperatingMode();

  @override
  String get description => 'All wrong answer questions operating mode';
}

class BookmarkOperatingMode extends QuestionsServiceMode {
  const BookmarkOperatingMode();

  @override
  String get description => 'All user bookmarked questions operating mode';
}

class ExamOperatingMode extends QuestionsServiceMode {
  const ExamOperatingMode(this.exam);
  final Exam exam;

  @override
  String get description => 'Exam questions operating mode';
}

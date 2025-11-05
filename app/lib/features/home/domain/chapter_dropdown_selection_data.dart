import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:flutter/material.dart';

@immutable
sealed class ChapterDropdownSelectionData {
  const ChapterDropdownSelectionData();
}

class AllChapterSelection extends ChapterDropdownSelectionData {
  const AllChapterSelection();
}

class DangerChapterSelection extends ChapterDropdownSelectionData {
  const DangerChapterSelection();
}

class ChapterSelection extends ChapterDropdownSelectionData {
  const ChapterSelection(this.chapter) : super();
  final Chapter chapter;

  @override
  String toString() {
    return 'ChapterSelection: \'${chapter.chapterName}\'';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is ChapterSelection && other.chapter == chapter;
  }

  @override
  int get hashCode => chapter.hashCode;
}

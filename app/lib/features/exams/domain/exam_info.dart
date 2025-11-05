/// This file contains the ExamInfo enum which defines the structure and
/// details of different types of exams. It includes information such as
/// the total number of questions, minimum passing score, exam duration,
/// and the structure of the exam.
library;

import 'package:driving_license/features/chapters/domain/chapter.dart';
import 'package:driving_license/features/chapters/domain/sub_chapter.dart';

enum ExamInfo {
  all(
    totalExamQuestions: 600,
    minimumPassingScore: 0,
    examDurationInMinutes: 60,
    examStructure: ExamStructure(
      dangerQuestionsCount: 0,
      chapterExamDetails: {},
    ),
  ),

  a1(
    totalExamQuestions: 25,
    minimumPassingScore: 21,
    examDurationInMinutes: 19,
    examStructure: ExamStructure(
      dangerQuestionsCount: 1,
      chapterExamDetails: {
        Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
          questionsCountBySubChapter: {
            SubChapter.cacKhaiNiem: 1,
            SubChapter.quyTacGiaoThong: 6,
            SubChapter.tocDoKhoangCach: 1,
          },
        ),
        Chapter.nghiepVuVanTai: ChapterExamInfo(
          chapterQuestionsCount: 0,
        ),
        Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.kyThuatLaiXe: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.cauTaoVaSuaChua: ChapterExamInfo(
          chapterQuestionsCount: 0,
        ),
        Chapter.bienBaoDuongBo: ChapterExamInfo(
          chapterQuestionsCount: 7,
        ),
        Chapter.saHinhVaTinhHuong: ChapterExamInfo(
          chapterQuestionsCount: 7,
        ),
      },
    ),
  ),

  a2(
    totalExamQuestions: 25,
    minimumPassingScore: 23,
    examDurationInMinutes: 19,
    examStructure: ExamStructure(
      dangerQuestionsCount: 1,
      chapterExamDetails: {
        Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
          questionsCountBySubChapter: {
            SubChapter.cacKhaiNiem: 1,
            SubChapter.quyTacGiaoThong: 6,
            SubChapter.tocDoKhoangCach: 1,
          },
        ),
        Chapter.nghiepVuVanTai: ChapterExamInfo(
          chapterQuestionsCount: 0,
        ),
        Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.kyThuatLaiXe: ChapterExamInfo(
          chapterQuestionsCount: 1,
          isInPool: true,
        ),
        Chapter.cauTaoVaSuaChua: ChapterExamInfo(
          chapterQuestionsCount: 1,
          isInPool: true,
        ),
        Chapter.bienBaoDuongBo: ChapterExamInfo(
          chapterQuestionsCount: 7,
        ),
        Chapter.saHinhVaTinhHuong: ChapterExamInfo(
          chapterQuestionsCount: 7,
        ),
      },
    ),
  ),

  a34(
    totalExamQuestions: 25,
    minimumPassingScore: 23,
    examDurationInMinutes: 19,
    examStructure: ExamStructure(
      dangerQuestionsCount: 1,
      chapterExamDetails: {
        Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
          questionsCountBySubChapter: {
            SubChapter.cacKhaiNiem: 1,
            SubChapter.quyTacGiaoThong: 6,
            SubChapter.tocDoKhoangCach: 1,
          },
        ),
        Chapter.nghiepVuVanTai: ChapterExamInfo(
          chapterQuestionsCount: 0,
        ),
        Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.kyThuatLaiXe: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.cauTaoVaSuaChua: ChapterExamInfo(
          chapterQuestionsCount: 0,
        ),
        Chapter.bienBaoDuongBo: ChapterExamInfo(
          chapterQuestionsCount: 7,
        ),
        Chapter.saHinhVaTinhHuong: ChapterExamInfo(
          chapterQuestionsCount: 7,
        ),
      },
    ),
  ),

  b1(
    totalExamQuestions: 30,
    minimumPassingScore: 27,
    examDurationInMinutes: 20,
    examStructure: ExamStructure(
      dangerQuestionsCount: 1,
      chapterExamDetails: {
        Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
          questionsCountBySubChapter: {
            SubChapter.cacKhaiNiem: 1,
            SubChapter.quyTacGiaoThong: 6,
            SubChapter.tocDoKhoangCach: 1,
          },
        ),
        Chapter.nghiepVuVanTai: ChapterExamInfo(
          chapterQuestionsCount: 0,
        ),
        Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.kyThuatLaiXe: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.cauTaoVaSuaChua: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.bienBaoDuongBo: ChapterExamInfo(
          chapterQuestionsCount: 9,
        ),
        Chapter.saHinhVaTinhHuong: ChapterExamInfo(
          chapterQuestionsCount: 9,
        ),
      },
    ),
  ),

  b2(
    totalExamQuestions: 35,
    minimumPassingScore: 32,
    examDurationInMinutes: 22,
    examStructure: ExamStructure(
      dangerQuestionsCount: 1,
      chapterExamDetails: {
        Chapter.khaiNiemVaQuyTac: SubChapterExamInfo(
          questionsCountBySubChapter: {
            SubChapter.cacKhaiNiem: 1,
            SubChapter.quyTacGiaoThong: 7,
            SubChapter.tocDoKhoangCach: 1,
          },
        ),
        Chapter.nghiepVuVanTai: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.vanHoaVaDaoDuc: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.kyThuatLaiXe: ChapterExamInfo(
          chapterQuestionsCount: 2,
        ),
        Chapter.cauTaoVaSuaChua: ChapterExamInfo(
          chapterQuestionsCount: 1,
        ),
        Chapter.bienBaoDuongBo: ChapterExamInfo(
          chapterQuestionsCount: 10,
        ),
        Chapter.saHinhVaTinhHuong: ChapterExamInfo(
          chapterQuestionsCount: 10,
        ),
      },
    ),
  );

  const ExamInfo({
    required this.totalExamQuestions,
    required this.minimumPassingScore,
    required this.examDurationInMinutes,
    required this.examStructure,
  });

  final int totalExamQuestions;
  final int minimumPassingScore;
  final int examDurationInMinutes;
  final ExamStructure examStructure;
}

class ExamStructure {
  const ExamStructure({
    required this.dangerQuestionsCount,
    required this.chapterExamDetails,
  });

  final int dangerQuestionsCount;
  final Map<Chapter, ChapterExamInfo> chapterExamDetails;
}

class ChapterExamInfo {
  const ChapterExamInfo({
    required this.chapterQuestionsCount,
    this.isInPool = false,
  });

  final int chapterQuestionsCount;
  final bool isInPool;
}

class SubChapterExamInfo extends ChapterExamInfo {
  const SubChapterExamInfo({
    required this.questionsCountBySubChapter,
    super.isInPool,
  }) : super(
          chapterQuestionsCount: 0,
        );

  final Map<SubChapter, int> questionsCountBySubChapter;

  @override
  int get chapterQuestionsCount =>
      questionsCountBySubChapter.values.fold(0, (a, b) => a + b);
}

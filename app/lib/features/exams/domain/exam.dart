import 'package:driving_license/features/exams/domain/exam_result_status.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/user_answers_map.dart';
import 'package:driving_license/utils/datetime_formatter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exam.freezed.dart';
part 'exam.g.dart';

@freezed
abstract class Exam with _$Exam {
  const factory Exam({
    @Default('000000000000000000000000000') String examId,
    required String name,
    required DateTime createdUtcTime,
    required List<int> questionDbIndexes,
    required License license,
    @Default(UserAnswersMap.empty) UserAnswersMap userAnswers,
    DateTime? lastAttemptedUtcTime,
  }) = _Exam;
  const Exam._();

  factory Exam.createNew({
    required License license,
    required List<int> questionDbIndexes,
  }) =>
      Exam(
        name: 'Đề ${DateTimeFormatter.formatLocalTimeDay(DateTime.now())}',
        createdUtcTime: DateTime.now().toUtc(),
        questionDbIndexes: questionDbIndexes,
        license: license,
      );

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  static final prototype = Exam(
    name: 'Prototype\nPrototype',
    createdUtcTime: DateTime(1999),
    questionDbIndexes: [0],
    license: License.all,
  );
}

extension ExamOperations on Exam {
  String get licenseType => license.name.toUpperCase();
  Duration get examDuration =>
      Duration(minutes: license.examInfo.examDurationInMinutes);
  int get minimumPassingScore => license.examInfo.minimumPassingScore;
  int get questionsCount => questionDbIndexes.length;
  int get dangerQuestionsCount =>
      license.examInfo.examStructure.dangerQuestionsCount;

  ExamResultStatus get examResult => ExamResultStatus.grade(
        exam: this,
        userAnswersSummary: userAnswers.summary,
      );
}

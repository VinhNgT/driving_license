import 'package:driving_license/features/exams/domain/exam_info.dart';

enum License {
  all(
    iconAssetPath: 'assets/icons/vehicles/_compiled/danger_fire.svg.vec',
  ),
  a1(
    iconAssetPath: 'assets/icons/vehicles/_compiled/motorbike-1.svg.vec',
    examInfo: ExamInfo.a1,
  ),
  a2(
    iconAssetPath: 'assets/icons/vehicles/_compiled/motorbike-2.svg.vec',
    examInfo: ExamInfo.a2,
  ),
  a3(
    iconAssetPath: 'assets/icons/vehicles/_compiled/motorbike-scooter.svg.vec',
    examInfo: ExamInfo.a34,
  ),
  a4(
    iconAssetPath: 'assets/icons/vehicles/_compiled/loader-truck.svg.vec',
    examInfo: ExamInfo.a34,
  ),
  b1(
    iconAssetPath: 'assets/icons/vehicles/_compiled/car.svg.vec',
    examInfo: ExamInfo.b1,
  ),
  b2(
    iconAssetPath: 'assets/icons/vehicles/_compiled/taxi.svg.vec',
    examInfo: ExamInfo.b2,
  );

  const License({
    required this.iconAssetPath,
    this.examInfo = ExamInfo.all,
  });

  final String iconAssetPath;
  final ExamInfo examInfo;

  bool get isTypeA => name.startsWith('a');
}

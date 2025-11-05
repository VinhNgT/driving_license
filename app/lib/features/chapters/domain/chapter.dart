import 'package:driving_license/features/chapters/domain/sub_chapter.dart';

enum Chapter {
  khaiNiemVaQuyTac(
    chapterDbIndex: 1,
    chapterName: 'Khái niệm và quy tắc',
    iconAssetPath: 'assets/icons/home_screen/_compiled/books.svg.vec',
    subChapters: [
      SubChapter.cacKhaiNiem,
      SubChapter.quyTacGiaoThong,
      SubChapter.tocDoKhoangCach,
    ],
  ),
  nghiepVuVanTai(
    chapterDbIndex: 2,
    chapterName: 'Nghiệp vụ vận tải',
    iconAssetPath: 'assets/icons/home_screen/_compiled/truck.svg.vec',
  ),
  vanHoaVaDaoDuc(
    chapterDbIndex: 3,
    chapterName: 'Văn hóa và đạo đức',
    iconAssetPath: 'assets/icons/home_screen/_compiled/person.svg.vec',
  ),
  kyThuatLaiXe(
    chapterDbIndex: 4,
    chapterName: 'Kỹ thuật lái xe',
    iconAssetPath: 'assets/icons/home_screen/_compiled/steering_wheel.svg.vec',
  ),
  cauTaoVaSuaChua(
    chapterDbIndex: 5,
    chapterName: 'Cấu tạo và sửa chữa',
    iconAssetPath: 'assets/icons/home_screen/_compiled/car_repair.svg.vec',
  ),
  bienBaoDuongBo(
    chapterDbIndex: 6,
    chapterName: 'Biển báo đường bộ',
    iconAssetPath: 'assets/icons/home_screen/_compiled/turn_right_sign.svg.vec',
  ),
  saHinhVaTinhHuong(
    chapterDbIndex: 7,
    chapterName: 'Sa hình và tình huống',
    iconAssetPath: 'assets/icons/home_screen/_compiled/traffic_light.svg.vec',
  );

  const Chapter({
    required this.chapterDbIndex,
    required this.chapterName,
    required this.iconAssetPath,
    this.subChapters = const [],
  });

  final int chapterDbIndex;
  final String chapterName;
  final String iconAssetPath;
  final List<SubChapter> subChapters;
}

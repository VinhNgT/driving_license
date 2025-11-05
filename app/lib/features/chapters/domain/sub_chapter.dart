enum SubChapter {
  cacKhaiNiem(
    subChapterDbIndex: 1,
    subChapterName: 'Các khái niệm cơ bản',
  ),
  quyTacGiaoThong(
    subChapterDbIndex: 2,
    subChapterName: 'Quy tắc giao thông',
  ),
  tocDoKhoangCach(
    subChapterDbIndex: 3,
    subChapterName: 'Quy định tốc độ, khoảng cách',
  );

  const SubChapter({
    required this.subChapterDbIndex,
    required this.subChapterName,
  });

  final int subChapterDbIndex;
  final String subChapterName;
}

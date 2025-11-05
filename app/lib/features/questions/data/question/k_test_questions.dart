import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';

List<Question> kTestQuestions = [
  const Question(
    questionDbIndex: 0,
    chapterDbIndex: 1,
    title:
        '''Khi tránh xe đi ngược chiều, các xe phải nhường đường như thế nào là đúng quy tắc giao thông?''',
    answers: [
      '''Nơi đường hẹp chỉ đủ cho một xe chạy và có chỗ tránh xe thì xe nào ở gần chỗ tránh hơn phải vào vị trí tránh, nhường đường cho xe kia đi''',
      '''Xe xuống dốc phải nhường đường cho xe đang lên dốc; xe nào có chướng ngại vật phía trước phải nhường đường cho xe không có chướng ngại vật đi trước''',
      '''Xe lên dốc phải nhường đường cho xe xuống dốc; xe nào không có chướng ngại vật đi phía trước phải nhường đường cho xe có chướng ngại vật đi trước''',
      '''Cả ý 1 và ý 2''',
    ],
    isDanger: true,
    isDifficult: true,
    correctAnswerIndex: 3,
    explanation:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
    includedLicenses: {License.a1, License.a2, License.a3, License.a4},
  ),
  const Question(
    questionDbIndex: 1,
    chapterDbIndex: 2,
    title:
        '''Vạch kẻ đường nào dưới đây là vạch phân chia hai chiều xe chạy (vạch tim đường), xe không được lấn làn, không được đè lên vạch?''',
    answers: ['Vạch 1', 'Vạch 2', 'Vạch 3', 'Cả 3 vạch'],
    questionImagePath: 'assets/images/question_images/question_479.jpg',
    isDanger: false,
    isDifficult: false,
    correctAnswerIndex: 1,
    explanation:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
    includedLicenses: {License.a1, License.a2, License.a3, License.a4},
  ),
  const Question(
    questionDbIndex: 2,
    chapterDbIndex: 3,
    title: 'Các xe đi theo hướng mũi tên, xe nào vi phạm quy tắc giao thông?',
    answers: [
      'Xe khách, xe tải, mô tô',
      'Xe tải, xe con, mô tô',
      'Xe khách, xe con, mô tô',
    ],
    questionImagePath: 'assets/images/question_images/question_503.jpg',
    correctAnswerIndex: 0,
    isDanger: false,
    isDifficult: true,
    explanation:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
    includedLicenses: {License.a1, License.a2, License.a3, License.a4},
  ),
  const Question(
    questionDbIndex: 3,
    chapterDbIndex: 4,
    title: 'Bạn được dừng xe ở vị trí nào trong tình huống này?',
    answers: [
      'Được phép dừng ở vị trí A',
      'Được phép dừng ở vị trí B',
      'Được phép dừng ở vị trí A và B',
      'Không được dùng',
    ],
    questionImagePath: 'assets/images/question_images/question_558.jpg',
    correctAnswerIndex: 3,
    isDanger: false,
    isDifficult: false,
    explanation:
        '''Pirate ipsum arrgh bounty warp jack. Shiver her topgallant yard chase fleet me.''',
    rememberTip:
        '''Pirate ipsum arrgh bounty warp jack. Crack pirate bounty smartly jack yer cog fluke. Coffer locker on hempen or. Locker the spyglass jack red.''',
    includedLicenses: {License.a1, License.a2, License.a3, License.a4},
  ),
];

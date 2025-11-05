import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'feedback_form.freezed.dart';
part 'feedback_form.g.dart';

@freezed
abstract class FeedbackForm with _$FeedbackForm {
  factory FeedbackForm({
    required DateTime dateTime,
    required String version,
    String? email,
    required String feedback,
  }) = _FeedbackForm;

  factory FeedbackForm.fromJson(Map<String, dynamic> json) =>
      _$FeedbackFormFromJson(json);

  @factory
  static Future<FeedbackForm> create({
    required String feedback,
    String? email,
  }) async {
    final packageInfo = await PackageInfo.fromPlatform();

    return FeedbackForm(
      dateTime: DateTime.now(),
      version: '${packageInfo.version} (${packageInfo.buildNumber})',
      email: email,
      feedback: feedback,
    );
  }
}

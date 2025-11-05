import 'package:driving_license/backend/shared_preferences/share_preferences_provider.dart';
import 'package:driving_license/features/licenses/data/providers/user_selected_license_provider.dart';
import 'package:driving_license/features/questions/data/user_answer/providers/user_answers_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'review_cta_card_controller.g.dart';

@riverpod
class HideReviewCtaCardPrefs extends _$HideReviewCtaCardPrefs {
  @override
  bool build() {
    final prefs = ref.watch(sharedPreferencesProvider).requireValue;
    return prefs.getBool('hide-review-cta-card') ?? false;
  }

  void set(bool value) {
    final prefs = ref.read(sharedPreferencesProvider).requireValue;
    prefs.setBool('hide-review-cta-card', value);
    ref.invalidateSelf();
  }
}

class ReviewCtaCardController {
  ReviewCtaCardController(this.ref);
  final Ref ref;

  void hideReviewCtaCard() {
    ref.read(hideReviewCtaCardPrefsProvider.notifier).set(true);
  }

  void showReviewCtaCard() {
    ref.read(hideReviewCtaCardPrefsProvider.notifier).set(false);
  }
}

@riverpod
ReviewCtaCardController reviewCtaCardControllerFuture(Ref ref) {
  return ReviewCtaCardController(ref);
}

@riverpod
Future<bool> shouldShowReviewCtaCardFuture(Ref ref) async {
  final hideReviewCtaCardPrefs = ref.watch(hideReviewCtaCardPrefsProvider);
  final license = await ref.watch(userSelectedLicenseProvider.future);
  final userAnswersCount = await ref.watch(
    userAnswersCountStreamProvider(license).future,
  );

  // Wait until the user has answered at least 100 questions.
  if (userAnswersCount < 100) {
    return false;
  }

  // The user has dismissed the review cta card.
  if (hideReviewCtaCardPrefs) {
    return false;
  }

  return true;
}

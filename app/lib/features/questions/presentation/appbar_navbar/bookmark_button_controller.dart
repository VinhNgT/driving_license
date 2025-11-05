import 'package:driving_license/features/bookmark/data/bookmarks_repository.dart';
import 'package:driving_license/features/bookmark/data/providers/bookmarks_providers.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:driving_license/features/questions/presentation/question_screen_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmark_button_controller.g.dart';

@riverpod
class BookmarkButtonController extends _$BookmarkButtonController {
  @override
  FutureOr<void> build() {}

  BookmarksRepository get _bookmarksRepository =>
      ref.read(bookmarksRepositoryProvider);

  Future<void> bookmarkQuestion(Question question) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _bookmarksRepository.saveBookmark(question),
    );
  }

  Future<void> unbookmarkQuestion(Question question) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _bookmarksRepository.removeBookmark(question),
    );
  }
}

@riverpod
Stream<bool> isCurrentQuestionBookmarkedStream(Ref ref) async* {
  final currentQuestion = await ref.watch(currentQuestionProvider.future);
  final isBookmarked = await ref.watch(
    isBookmarkedStreamProvider(currentQuestion).future,
  );

  yield isBookmarked;
}

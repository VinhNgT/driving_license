import 'package:driving_license/backend/database/sembast_provider.dart';
import 'package:driving_license/features/bookmark/data/sembast_bookmarks_repository.dart';
import 'package:driving_license/features/bookmark/domain/bookmark.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:driving_license/features/questions/domain/question.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bookmarks_repository.g.dart';

abstract interface class BookmarksRepository {
  Future<void> saveBookmark(Question question);
  Future<void> removeBookmark(Question question);
  Future<List<Bookmark>> getAllBookmarksByLicense(License license);
  Future<void> clearAllBookmarks();
  Stream<bool> watchIsBookmarked(Question question);
}

@riverpod
BookmarksRepository bookmarksRepository(Ref ref) {
  final sembastDatabase = ref.watch(sembastProvider).requireValue;
  return SembastBookmarksRepository(sembastDatabase);
}

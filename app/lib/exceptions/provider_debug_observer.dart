import 'package:driving_license/features/questions/application/question/providers/questions_providers.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProviderDebugObserver extends ProviderObserver {

  ProviderDebugObserver();
  List<int> activePageNumbers = [];

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    switch (provider.runtimeType) {
      case const (QuestionsPageFutureProvider):
        final questionPageFutureProvider =
            provider as QuestionsPageFutureProvider;
        activePageNumbers.add(questionPageFutureProvider.pageIndex);

        activePageNumbers.sort();
        debugPrint(activePageNumbers.toString());
    }

    super.didAddProvider(provider, value, container);
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    switch (provider.runtimeType) {
      case const (QuestionsPageFutureProvider):
        final questionPageFutureProvider =
            provider as QuestionsPageFutureProvider;
        activePageNumbers.remove(questionPageFutureProvider.pageIndex);

        activePageNumbers.sort();
        debugPrint(activePageNumbers.toString());
    }

    super.didDisposeProvider(provider, container);
  }
}

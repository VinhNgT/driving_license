// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionsServiceHash() => r'e06406208b7602d98c0c7d36fbd11b02b1a686a8';

/// See also [questionsService].
@ProviderFor(questionsService)
final questionsServiceProvider =
    AutoDisposeFutureProvider<QuestionsService>.internal(
      questionsService,
      name: r'questionsServiceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$questionsServiceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef QuestionsServiceRef = AutoDisposeFutureProviderRef<QuestionsService>;
String _$currentQuestionsServiceModeHash() =>
    r'09796b481abf2edddf167d12c987c52369ff00df';

/// A provider that controls the current mode of the questions service.
///
/// Copied from [CurrentQuestionsServiceMode].
@ProviderFor(CurrentQuestionsServiceMode)
final currentQuestionsServiceModeProvider =
    NotifierProvider<
      CurrentQuestionsServiceMode,
      QuestionsServiceMode
    >.internal(
      CurrentQuestionsServiceMode.new,
      name: r'currentQuestionsServiceModeProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$currentQuestionsServiceModeHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CurrentQuestionsServiceMode = Notifier<QuestionsServiceMode>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

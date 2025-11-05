---
applyTo: '**'
description: 'A short human-written instruction to apply to the codebase.'
---

- Use `dart run` instead of `flutter pub run` for all Dart tooling.

- Place documentation comments before metadata/annotations (text starting with @). For example:

  ```dart
  /// This is a documentation comment.
  @override
  Widget build(BuildContext context) {
      // ...
  }

  /// This is a documentation comment.
  @protected
  int get value;

  /// This is a documentation comment.
  @Deprecated('Use NewClass instead')
  class OldClass {
      // ...
  }
  ```

- mocktail's `Mock` subclasses must be empty. Do not add constructors, fields, methods or overrides to them. Use when-(thenReturn, thenThrow, thenAnswer) instead.

import 'package:rxdart/rxdart.dart';

/// An in-memory store backed by BehaviorSubject that can be used to
/// store the data for all the fake repositories in the app.
class InMemoryStore<T> {
  InMemoryStore(T initial) : _subject = BehaviorSubject<T>.seeded(initial);

  /// The BehaviorSubject that holds the data
  final BehaviorSubject<T> _subject;

  /// The output stream that can be used to listen to the data
  Stream<T> get stream => _subject.stream;

  /// A synchronous getter for the current value
  T get value => _subject.value;

  /// A setter for updating the value
  set value(T value) => _subject.add(value);

  /// A method to manually emit the current value
  void emmit() => _subject.add(_subject.value);

  /// Don't forget to call this when done
  Future<void> close() async => _subject.close();
}

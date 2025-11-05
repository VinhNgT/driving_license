import 'dart:async';

import 'package:flutter/material.dart';

enum SnapshotState {
  loading,
  error,
  done,
}

extension SnapshotUtils<T> on AsyncSnapshot<T> {
  SnapshotState get state {
    return switch (this) {
      AsyncSnapshot(connectionState: ConnectionState.waiting) =>
        SnapshotState.loading,
      AsyncSnapshot(hasError: true)
          when connectionState != ConnectionState.waiting =>
        SnapshotState.error,
      _ => SnapshotState.done,
    };
  }
}

extension SnapshotWhen<T, R> on AsyncSnapshot<T> {
  R when({
    required R Function(T? data) data,
    required R Function(Object error, StackTrace stackTrace) error,
    required R Function() loading,
  }) =>
      switch (this) {
        AsyncSnapshot(connectionState: ConnectionState.waiting) => loading(),
        AsyncSnapshot(
          hasError: true,
          error: final Object e,
          stackTrace: final StackTrace s,
        )
            when connectionState != ConnectionState.waiting =>
          error(e, s),
        AsyncSnapshot(data: final T? d) => data(d),
      };
}

class FuturesTracker<T> {
  final List<Future<T>> _futures = [];

  void add(Future<T> future) {
    future.then(
      (_) => _futures.remove(future),
      onError: (_) => _futures.remove(future),
    );
    _futures.add(future);
  }
}

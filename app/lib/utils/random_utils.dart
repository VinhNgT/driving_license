import 'dart:math';

Map<K, V> chooseRandomFromMap<K, V>(Map<K, V> map, int count) {
  if (map.length < count) {
    throw Exception(
      'Count must be less than or equal to the map length\n'
      'Count: $count, Map length: ${map.length}',
    );
  }

  final result = <K, V>{};
  final keys = map.keys.toList();
  final random = Random();

  for (var i = 0; i < count; i++) {
    final randomIndex = random.nextInt(keys.length);
    final randomKey = keys[randomIndex];

    result[randomKey] = map[randomKey] as V;
    keys.removeAt(randomIndex);
  }

  return result;
}

List<T> chooseRandomsFromList<T>(List<T> list, int count) {
  if (list.length < count) {
    throw Exception(
      'Count must be less than or equal to the list length\n'
      'Count: $count, List length: ${list.length}',
    );
  }

  final random = Random();
  final result = <T>[];

  for (var i = 0; i < count; i++) {
    final randomIndex = random.nextInt(list.length);
    result.add(list[randomIndex]);

    // Remove the chosen element from the original list because we don't want
    // to choose the same value again
    list.removeAt(randomIndex);
  }

  return result;
}

Map<String, dynamic> weightedRandom<T>(List<T> items, List<int> weights) {
  if (items.length != weights.length) {
    throw Exception('Items and weights must be of the same size');
  }

  if (items.isEmpty) {
    throw Exception('Items must not be empty');
  }

  final List<int> cumulativeWeights = [];
  for (int i = 0; i < weights.length; i++) {
    cumulativeWeights.add(weights[i] + (i == 0 ? 0 : cumulativeWeights[i - 1]));
  }

  final maxCumulativeWeight = cumulativeWeights[cumulativeWeights.length - 1];
  final randomNumber = maxCumulativeWeight * Random().nextDouble();
  Map<String, dynamic> result = {};

  for (int itemIndex = 0; itemIndex < items.length; itemIndex++) {
    if (cumulativeWeights[itemIndex] >= randomNumber) {
      return result = {
        'item': items[itemIndex],
        'index': itemIndex,
      };
    }
  }
  return result;
}

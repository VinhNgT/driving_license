import 'dart:convert';

// Copy from PrettyPrinter in the Logger package
String stringify(dynamic object) {
  final message = object is Function ? object() : object;
  if (message is Map || message is Iterable) {
    const encoder = JsonEncoder.withIndent('  ', _toEncodableFallback);
    return encoder.convert(message);
  } else {
    return message.toString();
  }
}

Object _toEncodableFallback(dynamic object) {
  return object.toString();
}

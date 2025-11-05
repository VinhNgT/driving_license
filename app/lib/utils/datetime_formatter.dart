import 'package:intl/intl.dart';

class DateTimeFormatter {
  /// Format a [DateTime] to a string with format 'HH:mm dd/MM/yy'.
  static String formatLocalTimeDay(DateTime utcDateTime) {
    final localTime = utcDateTime.toLocal();
    return DateFormat('HH:mm dd/MM/yyyy').format(localTime);
  }
}

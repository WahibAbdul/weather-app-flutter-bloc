import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String formattedDate(String pattern) {
    DateFormat format = DateFormat(pattern);
    final value = format.format(this);
    return value;
  }

  bool get isToday {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }
}

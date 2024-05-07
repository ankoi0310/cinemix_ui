import 'package:intl/intl.dart';

class DateUtil {
  static Map<String, DateTime> getUpcomingDates(int days) {
    final now = DateTime.now();
    final dates = <String, DateTime>{};

    dates['Hôm nay'] = now;
    for (var i = 1; i < days; i++) {
      final date = now.add(Duration(days: i));
      dates[DateFormat.EEEE('vi').format(date)] = date;
    }

    return dates;
  }
}

extension DateTimeExtension on DateTime {
  String format([String format = 'dd/MM/yyyy HH:mm:ss']) {
    return DateFormat(format).format(this);
  }
}

extension StringExtension on String {
  DateTime toDateTime({
    String format = 'dd/MM/yyyy HH:mm:ss',
  }) {
    return DateFormat(format).parse(this);
  }
}

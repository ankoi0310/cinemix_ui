import 'package:intl/intl.dart';

class DateUtil {
  static String getFormattedDate(
    DateTime date, {
    String format = 'dd-MM-yyyy',
  }) {
    return DateFormat(format).format(date);
  }

  static String getFormattedTime(
    DateTime date, {
    String format = 'HH:mm',
  }) {
    return DateFormat(format).format(date);
  }

  static Map<String, String> getUpcomingDates(int days) {
    final now = DateTime.now();
    final dates = <String, String>{};

    dates['Hôm nay'] = getFormattedDate(now, format: 'dd-MM');
    for (var i = 1; i < days; i++) {
      final date = now.add(Duration(days: i));
      dates[DateFormat.EEEE('vi').format(date)] =
          getFormattedDate(date, format: 'dd-MM');
    }

    return dates;
  }
}

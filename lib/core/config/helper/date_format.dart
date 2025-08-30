import 'package:intl/intl.dart';

class FormatDate {
  static String formatMonthYear(String date) {
    final dateParse = DateTime.parse(date);
    final formatDate = DateFormat('MMM yyyy').format(dateParse);
    return formatDate;
  }
}

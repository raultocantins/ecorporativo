import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class DateUtils {
  static String formatterDatePeriod(DateTime date) {
    initializeDateFormatting();

    String dateFormatter =
        DateFormat("dd/MM/yyyy HH:mm", "pt_BR").format(date.toLocal());
    return dateFormatter;
  }

  static String formatterDate(DateTime date) {
    initializeDateFormatting();
    String dateFormatter =
        DateFormat("dd/MM/yyyy", "pt_BR").format(date.toLocal());

    return dateFormatter;
  }

  static String formatterDateMonth(DateTime date) {
    initializeDateFormatting();
    String dateFormatter =
        DateFormat("MMMM yyyy", "pt_BR").format(date.toLocal());
    return dateFormatter.replaceAll(
        dateFormatter[0], dateFormatter[0].toUpperCase());
  }
}

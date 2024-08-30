import 'package:intl/intl.dart';

extension NumberParsing on dynamic {
  String cleanTextFieldInputNumber(String s) => s.replaceAll(RegExp(r'\D'), '');
  String formattedNumber(int s) =>
      NumberFormat('#,###', 'en_US').format(s).replaceAll(',', '.');
  String formattedNumberCurrency(int s) =>
      NumberFormat.currency(locale: "vi").format(s);
  String formattedDateTime(DateTime s) =>
      DateFormat('dd-MM-yyyy HH:mm').format(s);
  String formattedStringDateTime(String s) {
    final dateTime = DateTime.parse(s).toLocal();

    final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
    final DateFormat timeFormat = DateFormat('HH:mm');

    // Kết hợp kết quả định dạng
    return '${timeFormat.format(dateTime)} ${dateFormat.format(dateTime)}';
  }
}

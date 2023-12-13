import 'package:intl/intl.dart';

String formatDate(String date) {
  final DateTime dateTime = DateTime.parse(date);
  final formatter = DateFormat('dd/MM/yyyy', 'fr');
  return formatter.format(dateTime);
}

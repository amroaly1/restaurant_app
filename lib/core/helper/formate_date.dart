import 'package:intl/intl.dart';

String formatDate(String inputDate) {
  DateTime dateTime =
      DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").parseUtc(inputDate);
  dateTime = dateTime.toLocal(); // Convert to local time if needed
  return DateFormat("dd MMM, hh:mm a").format(dateTime);
}

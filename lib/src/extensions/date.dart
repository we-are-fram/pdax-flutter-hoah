import 'package:intl/intl.dart';

extension DateExt on DateTime {
  String get formattedDate {
    return DateFormat('dd MMM, yyyy').format(this);
  }
}
import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  String readable() {
    return DateFormat('MM-dd-yyyy HH:mm').format(this);
  }
}

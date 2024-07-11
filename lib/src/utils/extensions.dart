extension DateTimeExtension on DateTime {
  DateTime dateOnly() {
    return DateTime(year, month, day);
  }
}

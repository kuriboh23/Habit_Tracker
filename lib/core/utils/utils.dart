extension DateUtils on DateTime {
  DateTime startOfDay() {
    return DateTime(year, month, day);
  }

  bool isSameDayAs(DateTime other) {
    return startOfDay().isAtSameMomentAs(other.startOfDay());
  }
}
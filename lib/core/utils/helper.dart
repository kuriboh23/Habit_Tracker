import 'package:intl/intl.dart';
class Helper {
List<String> getWeekDays() {
  DateTime now = DateTime.now();
  // Start of the week (Monday)
  DateTime monday = now.subtract(Duration(days: now.weekday - 1));

  return List.generate(7, (index) {
    DateTime day = monday.add(Duration(days: index));
    return DateFormat('EEE').format(day); // Mon, Tue, ...
  });
}

List<int> getWeekDates() {
  DateTime now = DateTime.now();
  DateTime monday = now.subtract(Duration(days: now.weekday - 1));

  return List.generate(7, (index) {
    DateTime day = monday.add(Duration(days: index));
    return day.day; // 1, 2, 3, ...
  });
}

int getTodayDate() {
  // Monday = 0, Sunday = 6
  return DateTime.now().day;
}



  // --- Private helper to format date dynamically ---
  String getFormattedDate({DateTime? date}) {
    DateTime now = date ?? DateTime.now();

    String day = DateFormat('EEE').format(now);   // Fri
    String month = DateFormat('MMM').format(now); // May
    int dayNumber = now.day;
    String suffix = getDaySuffix(dayNumber);

    return "$day, $dayNumber$suffix $month";
  }

  String getDaySuffix(int day) {
    if (day >= 11 && day <= 13) return "th";

    switch (day % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }
}
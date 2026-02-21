import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
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

  final List<Color> colorsPalletes = HabitPalettes.colors;

  final List<IconData> iconOptions = [
    Icons.emoji_emotions_outlined,
    Icons.star_outline,
    Icons.fitness_center,
    Icons.bookmark_outline,
    Icons.brush_outlined,
    Icons.coffee_outlined,
    Icons.ramen_dining_sharp,
    Icons.qr_code_rounded,
    Icons.travel_explore_rounded,
    Icons.man_2_rounded,
    Icons.bedroom_baby_rounded,
    Icons.woman_2_rounded
  ];

  IconData selectedIcon = Icons.emoji_emotions_outlined;
  Color selectedColor = HabitPalettes.colors[2];

  Future<IconData> showIconPicker(BuildContext context) async {
    final icon = await showModalBottomSheet<IconData>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        final theme = Theme.of(context);
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: iconOptions.map((ic) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(ic),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: theme.colorScheme.onSurface,
                    ),
                    child: Icon(ic, size: 28, color: theme.colorScheme.surface)),
                ),
              );
            }).toList(),
          ),
        );
      },
    );

    if (icon != null) {
      selectedIcon = icon;
      return icon;
    }
    return selectedIcon;
  }

  Future<Color> showColorPicker(BuildContext context) async {
    final color = await showModalBottomSheet<Color>(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 4,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            children: colorsPalletes.map((c) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(c),
                child: Container(
                  decoration: BoxDecoration(
                    color: c,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      },
    );

    if (color != null) {
      selectedColor = color;
      return color;
    }
    return selectedColor;
  }
}
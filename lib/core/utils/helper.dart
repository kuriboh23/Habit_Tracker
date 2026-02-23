import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/lists.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
import 'package:habit_tracker/data/models/icon_section.dart';
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

  final List<IconSection> iconSections = AppLists.iconSections;

  IconData selectedIcon = Icons.emoji_emotions_outlined;
  Color selectedColor = HabitPalettes.colors[2];

Future<IconData> showIconPicker(BuildContext context) async {
  final icon = await showModalBottomSheet<IconData>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      final theme = Theme.of(context);

      return Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Drag handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withAlpha(40),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            Text(
              "Choose an Icon",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 22
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 400, // keeps it compact, not full screen
              child: ListView.builder(
                itemCount: iconSections.length,
                itemBuilder: (context, index) {
                  final section = iconSections[index];

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.title,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 12),

                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                        itemCount: section.icons.length,
                        itemBuilder: (context, i) {
                          final ic = section.icons[i];
                          final isSelected = ic == selectedIcon;

                          return GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pop(ic),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? selectedColor.withAlpha(50)
                                    : theme.colorScheme.surface,
                                border: isSelected
                                    ? Border.all(
                                        color: selectedColor,
                                        width: 2,
                                      )
                                    : null,
                              ),
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                ic,
                                size: 24,
                                color: isSelected
                                    ? selectedColor
                                    : theme.colorScheme.onSurface,
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20),
                    ],
                  );
                },
              ),
            ),
          ],
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
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      final theme = Theme.of(context);

      return Container(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            // Drag handle
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: theme.colorScheme.onSurface.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            Text(
              "Choose a Color",
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            GridView.builder(
              shrinkWrap: true,
              itemCount: colorsPalletes.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
              ),
              itemBuilder: (context, index) {
                final c = colorsPalletes[index];
                final isSelected = c == selectedColor;

                return GestureDetector(
                  onTap: () => Navigator.of(context).pop(c),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    decoration: BoxDecoration(
                      color: c,
                      shape: BoxShape.circle,
                      border: isSelected
                          ? Border.all(
                              color: theme.colorScheme.onSurface,
                              width: 2,
                            )
                          : null,
                    ),
                    child: isSelected
                        ? const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          )
                        : null,
                  ),
                );
              },
            ),
          ],
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
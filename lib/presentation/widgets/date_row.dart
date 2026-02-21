import 'package:flutter/material.dart';
import 'package:habit_tracker/core/utils/helper.dart';

class DateRow extends StatelessWidget {

  const DateRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final days = Helper().getWeekDays();
    final dates = Helper().getWeekDates();
    final today = Helper().getTodayDate();
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(6),
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (index) {
          final isToday = dates[index] == today;
          return Column(
            children: [
              Text(
                days[index],
                style: TextStyle(
                      color: isToday ? colors.onSurface : colors.onSurface.withAlpha(130),
                      fontWeight: isToday ? FontWeight.w700 : FontWeight.normal,
                      fontSize: isToday ? 14 : 13,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  border: BoxBorder.all(
                  color: Theme.of(context).colorScheme.onSurface.withAlpha(20),
                  width: 1.5,
                ),
                  shape: BoxShape.circle,
                  color: isToday ? colors.secondary.withAlpha(205) : Colors.white,
                ),
                child: Center(
                  child: Text(
                    '${dates[index]}',
                    style: TextStyle(
                      color: isToday ? colors.onSurface : colors.onSurface.withAlpha(180),
                      fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
                      fontSize: isToday ? 14 : 13,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
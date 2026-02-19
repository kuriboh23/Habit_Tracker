import 'package:flutter/material.dart';

class DateRow extends StatelessWidget {

  const DateRow({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final dates = [7, 8, 9, 10, 11, 12, 13];
    final todayIndex = 'thu';
    return Container(
      width: double.infinity,
      decoration: BoxDecoration( // Light background like in the image
        borderRadius: BorderRadius.circular(8), // Optional rounded corners
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(7, (index) {
          final isToday = days[index].toLowerCase() == todayIndex;
          return Column(
            children: [
              Text(
                days[index],
                style: TextStyle(
                      color: isToday ? colors.onSurface : colors.onSurface.withAlpha(130),
                      fontWeight: isToday ? FontWeight.w700 : FontWeight.normal,
                      fontSize: 13,
                    ),
              ),
              const SizedBox(height: 8),
              Container(
                width: 43,
                height: 43,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isToday ? colors.secondary : Colors.white,
                ),
                child: Center(
                  child: Text(
                    '${dates[index]}',
                    style: TextStyle(
                      color: isToday ? colors.onSurface : colors.onSurface.withAlpha(180),
                      fontWeight: isToday ? FontWeight.w700 : FontWeight.w500,
                      fontSize: 13,
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
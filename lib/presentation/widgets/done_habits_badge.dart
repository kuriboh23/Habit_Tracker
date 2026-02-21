import 'package:flutter/material.dart';

class DoneHabitsBadge extends StatelessWidget {
  final int count;
  final int total;
  final Color color;
  final Color doneColor;

  const DoneHabitsBadge({
    super.key,
    required this.count,
    required this.total,
    required this.color,
    required this.doneColor,
  });



  @override
  Widget build(BuildContext context) {
    final bool isDone = (count >0 && count == total);
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
      decoration: BoxDecoration(
        border: BoxBorder.all(
          color: isDone ? doneColor : color.withAlpha(150),
          width: 2,
        ),
        color:Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
         Text(
            count.toString(),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: isDone ? doneColor : color.withAlpha(150),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            '/ $total',
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

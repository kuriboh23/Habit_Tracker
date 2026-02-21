import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
import 'package:habit_tracker/data/models/habit.dart';

class HabitListTile extends StatefulWidget {
  final Habit habit;
  final Function(BuildContext)? onPressed;

  const HabitListTile({super.key, required this.habit, this.onPressed});

  @override
  State<HabitListTile> createState() => _HabitListTileState();
}

class _HabitListTileState extends State<HabitListTile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final baseColor = Color(widget.habit.colorValue);

    final icon = IconData(
      widget.habit.iconCodePoint,
      fontFamily: 'MaterialIcons',
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Slidable(
        key: ValueKey(widget.habit.title),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          extentRatio: 0.24,
          children: [
            SlidableAction(
              onPressed: widget.onPressed,
              borderRadius: BorderRadius.circular(24),
              icon: Icons.no_adult_content_rounded,
              backgroundColor: baseColor,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: baseColor.lightBg,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: baseColor.border, width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: baseColor.shadow,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: baseColor.iconBg,
                  child: Icon(icon, color: colors.surface),
                ),
                const SizedBox(width: 16),

                Text(
                  widget.habit.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: baseColor.textColor,
                  ),
                ),
              ],
            ),

            Checkbox(
              value: widget.habit.isCompleted,
              onChanged: (value) {
                setState(() {
                  widget.habit.isCompleted = !widget.habit.isCompleted;
                });
              },
              activeColor: baseColor.checkboxFill,
              shape: CircleBorder(),
              side: WidgetStateBorderSide.resolveWith(
                (states) => BorderSide(
                  width: 4.0, // Thicker border pushes checkmark inward
                  strokeAlign: 2.0, // Positive value moves border inward
                      color: baseColor,
                ),
              ),
            ),
          ],
        ),
          ),
        ),
      ),
    );
  }
}

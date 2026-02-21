import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:habit_tracker/data/repositories/habit_repository.dart';

class HabitListTile extends StatefulWidget {
  final Habit habit;
  final Function(BuildContext)? onPressed;
  final Function(BuildContext)? onDelete;

  const HabitListTile({super.key, required this.habit, this.onPressed, this.onDelete});

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
          extentRatio: 0.5,
          children: [
            SlidableAction(
              onPressed: widget.onPressed,
              icon: Icons.skip_next_rounded,
              backgroundColor: baseColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16),bottomLeft: Radius.circular(16)),
              label: 'Skip',
            ),
            SlidableAction(
              onPressed: widget.onDelete,
              icon: Icons.delete_forever_rounded,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(topRight: Radius.circular(16),bottomRight: Radius.circular(16)),
              label: 'Delete',
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
                HabitRepository().toggleHabitCompletion(widget.habit);
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

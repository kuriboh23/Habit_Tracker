import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
import 'package:habit_tracker/data/models/habit.dart';

class HabitListTile extends StatefulWidget {

  final Habit habit;

  const HabitListTile({
    super.key,
    required this.habit,
  });

  @override
  State<HabitListTile> createState() => _HabitListTileState();
}

class _HabitListTileState extends State<HabitListTile> {
  @override
  Widget build(BuildContext context) {

    final baseColor = Color(widget.habit.colorValue);

    final icon = IconData(
      widget.habit.iconCodePoint,
      fontFamily: 'MaterialIcons',
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: baseColor.lightBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: baseColor.border,
          width: 1.5,
        ),
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

          /// LEFT SIDE
          Row(
            children: [
              CircleAvatar(
                backgroundColor: baseColor.iconBg,
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 16),

              Text(
                widget.habit.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: baseColor.textColor,
                      decoration: widget.habit.isCompleted
                          ? TextDecoration.lineThrough
                          : null,
                    ),
              ),
            ],
          ),

          /// CHECKBOX
          Checkbox(
            value: widget.habit.isCompleted,
            onChanged: (value) {
              setState(() {
                widget.habit.isCompleted = !widget.habit.isCompleted;
              });
            },
            activeColor: baseColor.checkboxFill,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            side: BorderSide(
              color: baseColor,
              width: 2,
            ),
          ),
        ],
      ),
    );
  }
}

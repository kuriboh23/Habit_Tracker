import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
import 'package:habit_tracker/data/local/habit_provider.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:provider/provider.dart';

class HabitListTile extends StatefulWidget {
  final Habit habit;
  final Function(BuildContext)? onPressed;
  final Function(BuildContext)? onDelete;

  const HabitListTile({
    super.key,
    required this.habit,
    this.onPressed,
    this.onDelete,
  });

  @override
  State<HabitListTile> createState() => _HabitListTileState();
}

class _HabitListTileState extends State<HabitListTile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final baseColor = Color(widget.habit.colorValue);

    final checkValue = widget.habit.isCompleted;

    final habitProvider = context.read<HabitProvider>();

    final icon = IconData(
      widget.habit.iconCodePoint,
      fontFamily: 'MaterialIcons',
    );

    return RepaintBoundary(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Slidable(
          key: ValueKey(widget.habit.key),
        endActionPane: ActionPane(
          motion: BehindMotion(),
          extentRatio: 0.5,
          children: [
            SlidableAction(
              onPressed: widget.onPressed,
              icon: Icons.skip_next_rounded,
              backgroundColor: colors.onSurface.withAlpha(220),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              label: 'Skip',
            ),
            SlidableAction(
              onPressed: widget.onDelete,
              icon: Icons.delete_forever_rounded,
              backgroundColor: colors.error,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              label: 'Delete',
            ),
          ],
        ),
          child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: checkValue ? baseColor : Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: ListTile(
              onTap: () async{
                await habitProvider.toggleHabitCompletion(widget.habit);
              },
              leading: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: checkValue ? colors.surface.border : baseColor.border,
                ),
                child: Icon(
                  icon,
                  color: checkValue ? colors.surface : baseColor,
                ),
              ),
              title: Text(
                widget.habit.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: checkValue
                      ? colors.surface
                      : colors.onSurface.withAlpha(220),
                ),
              ),
              subtitle: Text(
                'Streak ${widget.habit.streak} days',
                style: theme.textTheme.headlineLarge?.copyWith(
                  color: checkValue
                      ? colors.surface
                      : colors.onSurface.withAlpha(100),
                  fontSize: 12,
                ),
              ),
              trailing: checkValue
                  ? Icon(Icons.radio_button_checked, color: colors.surface)
                  : Icon(Icons.circle_outlined),
              /*     trailing: Checkbox(
                value: checkValue,
                onChanged: (value) {
                  HabitRepository().toggleHabitCompletion(widget.habit);
                },
                activeColor: colors.onSurface.checkboxFill,
                side: WidgetStateBorderSide.resolveWith(
                  (states) => BorderSide(
                    width: 2.0, 
                    strokeAlign: BorderSide.strokeAlignCenter, // Positive value moves border inward
                    color: colors.onSurface.withAlpha(100),
                  ),
                ),
              ), */
            ),
          ),
        ),
      ),
      ),
    );
  }
}

/* 
ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colors.onSurface.shadow,
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
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      color: baseColor.border,
                      ),
                      child: Icon(icon, color: baseColor),
                    ),
                    const SizedBox(width: 16),
            
                    Text(
                      widget.habit.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.onSurface,
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
                  side: WidgetStateBorderSide.resolveWith(
                    (states) => BorderSide(
                      width: 2.0, 
                      strokeAlign: BorderSide.strokeAlignCenter, // Positive value moves border inward
                      color: baseColor,
                    ),
                  ),
                ),
              ],
            ),
              ),
            ),
           */

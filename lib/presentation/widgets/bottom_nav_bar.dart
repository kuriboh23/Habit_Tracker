import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.colors,
    required this.theme,
  });

  final ColorScheme colors;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: colors.onSurface, // Black in LightMode, White in DarkMode (High Contrast)
        borderRadius: BorderRadius.circular(32), // Pill shape
        boxShadow: [
          BoxShadow(
            color: colors.surface.withAlpha(200),
            blurRadius: 10,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Center the button
        children: [
          TextButton.icon(
            onPressed: () {
              // TODO: Navigate to Add Habit Screen
            },
            style: TextButton.styleFrom(
              side: BorderSide(width: 1, color: colors.surface),
              backgroundColor: colors.secondary.withAlpha(25), // Primary color background
            ),
            icon: Icon(Icons.add_rounded,size: 26, color: colors.surface), // Inverted color
            label: Text(
              AppStrings.homeNewHabitBtn,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colors.surface,
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontFamily: 'Comfortaa',
              )
            ),
          ),
          
          const Spacer(),
          IconButton(
            onPressed: () {
              // TODO: Navigate to Add Habit Screen (e.g., Navigator.push(context, MaterialPageRoute(builder: (_) => AddHabitScreen())));
            },
            icon: Icon(Icons.auto_graph_rounded, size: 24, color: colors.surface), // Just the plus icon
            style: IconButton.styleFrom(
              backgroundColor: colors.secondary.withAlpha(25), // Primary color background
              shape: CircleBorder(
                side: BorderSide(width: 2, color: colors.surface),
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
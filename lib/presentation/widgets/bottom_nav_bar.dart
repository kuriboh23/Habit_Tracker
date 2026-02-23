import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/data/local/habit_provider.dart';
import 'package:habit_tracker/presentation/widgets/app_button.dart';
import 'package:habit_tracker/presentation/widgets/nav_icon_button.dart';
import 'package:provider/provider.dart';

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
        color: colors.onSurface, 
        borderRadius: BorderRadius.circular(40), 
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [
          AppButton(
            iconColor: colors.onSurface,
            bgColor: colors.surface,
            theme: theme,
            icon: Icons.add_rounded,
            size: 26,
            label: AppStrings.homeNewHabitBtn,
            function: () {
              Navigator.pushNamed(context, '/addHabitPage');
            },
          ),
          const Spacer(),
          NavIconButton(colors: colors, icon: Icons.auto_graph_rounded,),
          
        ],
      ),
    );
  }
}
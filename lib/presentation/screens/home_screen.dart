import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/core/constants/lists.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:habit_tracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:habit_tracker/presentation/widgets/date_row.dart';
import 'package:habit_tracker/presentation/widgets/done_habits_badge.dart';
import 'package:habit_tracker/presentation/widgets/habit_list_tile.dart';
import 'package:habit_tracker/presentation/widgets/streak_badge.dart';

class HomeScreen extends StatelessWidget {
  final List<Habit> habits = AppLists.habits;

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(AppStrings.homeDateHeading, style: theme.textTheme.headlineLarge),
        backgroundColor: Colors.transparent,
        actions: [
          StreakBadge(count: 2, iconPath: 'assets/icons/flame.svg', backgroundColor: colors.secondary),
          SizedBox(width: 12,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16,),
            DateRow(),
            SizedBox(height: 26,),
            Row(
              children: [
                Text(AppStrings.homeTodayHeading, style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 32
                ),),
                SizedBox(width: 24,),
                DoneHabitsBadge(count: 5, total: 5, color: colors.onSurface, doneColor: colors.secondary),

              ],
            ),
            Expanded(child: 
            Container(
              margin: const EdgeInsets.only(top: 12),
              child: habits.isEmpty
              ? Center(
                child: SvgPicture.asset('assets/icons/empty.svg'),
              )
              : ListView.builder(
                padding: const EdgeInsets.only(top: 10, bottom: 100),
                itemCount: habits.length,
                itemBuilder: (context, index) {
                return HabitListTile(habit: habits[index]);
              },),
            ))
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomNavBar(colors: colors, theme: theme),
    );
  }
}

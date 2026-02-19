import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:habit_tracker/presentation/widgets/date_row.dart';
import 'package:habit_tracker/presentation/widgets/done_habits_badge.dart';
import 'package:habit_tracker/presentation/widgets/streak_badge.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.homeDateHeading,
          style: theme.textTheme.headlineLarge,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          StreakBadge(count: 4, iconPath: 'assets/icons/flame.svg',backgroundColor: colors.secondary,),
          SizedBox(width: 12),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            DateRow(),
            SizedBox(height: 24),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  AppStrings.homeTodayHeading,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 32,
                  ),
                ),
                SizedBox(width: 24),
                DoneHabitsBadge(count: 5, total: 5, color: colors.onSurface, doneColor: colors.secondary,),
              ],
            ),
            SizedBox(width: 12),
                Expanded(
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {

                     return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: colors.primary,
                          ),
                        ),
                        title: Text(
                          'Morning Run',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                   } ,
                  ),
                ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomNavBar(colors: colors, theme: theme),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/data/local/habit_provider.dart';
import 'package:habit_tracker/presentation/widgets/bottom_nav_bar.dart';
import 'package:habit_tracker/presentation/widgets/date_row.dart';
import 'package:habit_tracker/presentation/widgets/done_habits_badge.dart';
import 'package:habit_tracker/presentation/widgets/habit_list_tile.dart';
import 'package:habit_tracker/presentation/widgets/nav_icon_button.dart';
// import 'package:habit_tracker/presentation/widgets/streak_badge.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
void initState() {
  super.initState();
  Future.microtask(() {
    // ignore: use_build_context_synchronously
    context.read<HabitProvider>().loadHabits();
  });
}

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final habits = context.watch<HabitProvider>().habits;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(AppStrings.homeDateHeading, style: theme.textTheme.headlineLarge),
        backgroundColor: Colors.transparent,
         actions: [
          // StreakBadge(count: 0, iconPath: 'assets/icons/flame.svg', backgroundColor: colors.secondary),
          CircleAvatar(
            backgroundColor: colors.onSurface,
            child: IconButton(onPressed: () {
              
            }, icon: Icon(Icons.person_2_rounded)),
          ),
          SizedBox(width: 12,)
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24,),
              DateRow(),
              SizedBox(height: 26,),
              Row(
                children: [
                  Text(AppStrings.homeTodayHeading, style: theme.textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 32
                  ),),
                  SizedBox(width: 24,),
                  DoneHabitsBadge(count: habits.where((h) => h.isCompleted).length, total: habits.length, color: colors.onSurface, doneColor: colors.secondary),
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
                  return HabitListTile(
                    habit: habits[index],
                    onDelete: (p0) => context.read<HabitProvider>().deleteHabit(habits[index]),
                  );
                },),
              )),
            ],
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BottomNavBar(colors: colors, theme: theme),
    );
  }
}

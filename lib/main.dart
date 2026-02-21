import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/app_theme.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:habit_tracker/data/repositories/habit_repository.dart';
import 'package:habit_tracker/presentation/screens/add_habit_page.dart';
import 'package:habit_tracker/presentation/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(HabitAdapter());

  await Hive.openBox<Habit>(HabitRepository.boxName);

  runApp(const MainApp());
  
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Habit Tracker",
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/addHabitPage' : (context) => AddHabitPage()
      },
    );
  }
}

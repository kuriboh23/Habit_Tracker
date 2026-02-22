import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/app_theme.dart';
import 'package:habit_tracker/data/local/habit_provider.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:habit_tracker/data/repositories/habit_repository.dart';
import 'package:habit_tracker/presentation/screens/add_habit_page.dart';
import 'package:habit_tracker/presentation/screens/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(HabitAdapter());

  await Hive.openBox<Habit>(HabitRepository.boxName);

  runApp(
    ChangeNotifierProvider(
      create: (_) => HabitProvider(),
      child: const MainApp(),
    ),
  );
  
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

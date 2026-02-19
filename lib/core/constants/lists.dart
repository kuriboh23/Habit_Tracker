import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
import 'package:habit_tracker/data/models/habit.dart';

class AppLists {
  static const List<String> weekDays = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun"
  ];

  static List<Habit> habits = [
    Habit(
      title: "Morning Run",
      colorValue: HabitPalettes.colors[0].value,
      iconCodePoint: Icons.directions_run.codePoint,
      isCompleted: true
    ),
    Habit(
      title: "Read Book",
      colorValue: HabitPalettes.colors[1].value,
      iconCodePoint: Icons.book.codePoint,
    ),
    Habit(
      title: "Meditation",
      colorValue: HabitPalettes.colors[2].value,
      iconCodePoint: Icons.self_improvement.codePoint,
      isCompleted: true
    ),
    Habit(
      title: "Drink Water",
      colorValue: HabitPalettes.colors[3].value,
      iconCodePoint: Icons.local_drink.codePoint,
    ),
    Habit(
      title: "Morning Run",
      colorValue: HabitPalettes.colors[0].value,
      iconCodePoint: Icons.directions_run.codePoint,

    ),
    Habit(
      title: "Read Book",
      colorValue: HabitPalettes.colors[1].value,
      iconCodePoint: Icons.book.codePoint,
      isCompleted: true
    ),
    Habit(
      title: "Meditation",
      colorValue: HabitPalettes.colors[2].value,
      iconCodePoint: Icons.self_improvement.codePoint,
      
    ),
    Habit(
      title: "Drink Water",
      colorValue: HabitPalettes.colors[3].value,
      iconCodePoint: Icons.local_drink.codePoint,
      isCompleted: true
    ),
  ];
}
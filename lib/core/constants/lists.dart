import 'package:flutter/material.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
import 'package:habit_tracker/data/models/habit.dart';

class AppLists {

  static List<Habit> habits = [
    Habit(title: 'Rich Dad Poor Dad', colorValue: 0xFFE91E63, iconCodePoint: Icons.sports_gymnastics_rounded.codePoint)
  ];

  static List<IconData> iconOptions = [
    Icons.emoji_emotions_outlined,
    Icons.star_outline,
    Icons.fitness_center,
    Icons.bookmark_outline,
    Icons.brush_outlined,
    Icons.coffee_outlined,
    Icons.ramen_dining_sharp,
    Icons.qr_code_rounded,
    Icons.travel_explore_rounded,
    Icons.man_2_rounded,
    Icons.bedroom_baby_rounded,
    Icons.woman_2_rounded
  ];
}
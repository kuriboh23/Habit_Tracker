import 'package:flutter/material.dart';
import 'package:habit_tracker/data/models/icon_section.dart';

class AppLists {

  static final List<IconSection> iconSections = [

  IconSection(
    title: "Mood & Mind",
    icons: [
      Icons.emoji_emotions_outlined,
      Icons.sentiment_satisfied_alt_outlined,
      Icons.psychology_outlined,
      Icons.self_improvement,
      Icons.spa_outlined,
      Icons.nightlight_round,
      Icons.wb_sunny_outlined,
    ],
  ),

  IconSection(
    title: "Fitness & Health",
    icons: [
      Icons.fitness_center,
      Icons.directions_run,
      Icons.monitor_heart_outlined,
      Icons.favorite_border,
      Icons.sports_gymnastics,
      Icons.pedal_bike_outlined,
      Icons.pool_outlined,
    ],
  ),

  IconSection(
    title: "Productivity",
    icons: [
      Icons.check_circle_outline,
      Icons.task_alt,
      Icons.timer_outlined,
      Icons.schedule,
      Icons.event_outlined,
      Icons.work_outline,
      Icons.laptop_mac_outlined,
    ],
  ),

  IconSection(
    title: "Learning & Growth",
    icons: [
      Icons.menu_book_outlined,
      Icons.school_outlined,
      Icons.edit_outlined,
      Icons.brush_outlined,
      Icons.code_outlined,
      Icons.calculate_outlined,
    ],
  ),

  IconSection(
    title: "Food & Lifestyle",
    icons: [
      Icons.coffee_outlined,
      Icons.local_drink_outlined,
      Icons.restaurant_outlined,
      Icons.ramen_dining_sharp,
      Icons.local_pizza_outlined,
      Icons.home_outlined,
      Icons.cleaning_services_outlined,
    ],
  ),

  IconSection(
    title: "Travel & Fun",
    icons: [
      Icons.travel_explore_rounded,
      Icons.flight_outlined,
      Icons.directions_car_outlined,
      Icons.map_outlined,
      Icons.music_note_outlined,
      Icons.videogame_asset_outlined,
    ],
  ),
];
}
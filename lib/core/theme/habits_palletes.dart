import 'package:flutter/material.dart';

class HabitPalettes {
  static const List<Color> colors = [

    // Greens
    Color(0xFF4CAF50), // Green
    Color(0xFF2E7D32), // Dark Green
    Color(0xFF81C784), // Light Green

    // Blues
    Color(0xFF2196F3), // Blue
    Color(0xFF1565C0), // Dark Blue
    Color(0xFF64B5F6), // Light Blue

    // Purples
    Color(0xFF9C27B0), // Purple
    Color(0xFF6A1B9A), // Deep Purple
    Color(0xFFBA68C8), // Soft Purple

    // Pinks
    Color(0xFFE91E63), // Pink
    Color(0xFFC2185B), // Dark Pink
    Color(0xFFF48FB1), // Light Pink

    // Oranges
    Color(0xFFFF9800), // Orange
    Color(0xFFEF6C00), // Deep Orange
    Color(0xFFFFB74D), // Soft Orange

    // Reds
    Color(0xFFF44336), // Red
    Color(0xFFD32F2F), // Dark Red

    // Teals
    Color(0xFF009688), // Teal
    Color(0xFF00796B), // Dark Teal
    Color(0xFF4DB6AC), // Light Teal

    // Yellows
    Color(0xFFFFC107), // Amber
    Color(0xFFFFD54F), // Soft Amber

    // Neutrals
    Color(0xFF607D8B), // Blue Grey
    Color(0xFF795548), // Brown
    Color(0xFF9E9E9E), // Grey

  ];
}

extension HabitColorScheme on Color {

  Color get lightBg => withAlpha(8);

  Color get border => withAlpha(50);

  Color get shadow => withAlpha(20);

  Color get checkboxFill => this;

  Color get iconBg => this;

  Color get textColor => darken(0.2);

  Color darken([double amount = .1]) {
    final hsl = HSLColor.fromColor(this);
    final darkened =
        hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));
    return darkened.toColor();
  }
}

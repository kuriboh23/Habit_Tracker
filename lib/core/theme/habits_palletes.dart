import 'package:flutter/material.dart';

class HabitPalettes {
  static const List<Color> colors = [
    Color(0xFF4CAF50), // Green
    Color(0xFF2196F3), // Blue
    Color(0xFFFF9800), // Orange
    Color(0xFFE91E63), // Pink
    Color(0xFFC508DA), // Violet
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

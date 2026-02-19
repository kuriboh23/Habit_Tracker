import 'package:flutter/material.dart';

class AppColors {
  // Prevent instantiation
  AppColors._();

  // --- Core Colors ---
  static const Color primary = Color(0xFF6B4EFF); // A nice purple/indigo
  static const Color secondary = Color(0xFFFFAF26); // Pastel orange for accents

  // --- Backgrounds ---
  static const Color lightBackground = Color(0xFFF3F4F6); // Soft grey, not harsh white
  static const Color darkBackground = Color(0xFF1E1E1E);  // Soft black, not #000000

  // --- Surfaces (Cards, Dialogs) ---
  static const Color lightSurface = Colors.white;
  static const Color darkSurface = Color(0xFF2C2C2C);

  // --- Text Colors ---
  static const Color lightText = Color(0xFF1F2937);
  static const Color darkText = Color(0xFFF3F4F6);
  static const Color subText = Color(0xFF9CA3AF);

  // --- Status ---
  static const Color success = Color(0xFF4ADE80);
  static const Color error = Color(0xFFEF4444);
}
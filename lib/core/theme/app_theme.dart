import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_tracker/core/theme/app_color.dart';

class AppTheme {
  // Use "static final", NOT "static const" because ThemeData calculates things
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light, // iOS
      ),
    ),
    scaffoldBackgroundColor: AppColors.lightBackground,
    primaryColor: AppColors.primary,
    fontFamily: 'Nunito',
    
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.lightSurface,
      onSurface: AppColors.lightText,
    ),

    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        fontSize: 30, 
        fontWeight: FontWeight.bold, 
        color: AppColors.lightText,
      ),
      bodyMedium: TextStyle(
        fontSize: 16, 
        color: AppColors.lightText,
      ),
      labelSmall: TextStyle(
        color: AppColors.subText,
      )
    ),

    // DO NOT put 'const' here
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.subText),
    ),
    
    // DO NOT put 'const' here because 'resolveWith' is a function
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return Colors.transparent;
      }),
    ),
  );
}
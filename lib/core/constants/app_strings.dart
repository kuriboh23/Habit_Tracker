import 'package:habit_tracker/core/utils/helper.dart';

class AppStrings {
  // Prevent instantiation
  AppStrings._();

  // --- General ---
  static const String appName = "Habit Streak";

  // --- Home Screen ---
  static String get homeDateHeading => Helper().getFormattedDate();
  static const String homeTodayHeading = "Today";
  static const String homeNewHabitBtn = "Add Habit";
  static const String homeNoHabits = "No habits for today. Start small!";
  static const String homeProgressTitle = "Progress";

  // --- Add New Habit Screen ---
  static const String addHabitTitle = "Add New Habit";
  static const String done = "Done";

  // Default Categories
  static const String catHealth = "Health";
  static const String catProductivity = "Work & Study";
  static const String catMindfulness = "Mindfulness";
  static const String catFitness = "Fitness";
  static const String catFinance = "Finance";
  static const String catSocial = "Social";

  // --- Create Habit Screen ---
  static const String createHabitTitle = "Create New Habit";
  static const String habitNameHint = "Details...";
  static const String selectIcon = "Icon";
  static const String selectColor = "Color";
  static const String createBtn = "Create";
  static const String updateBtn = "Update";

  // --- Dialogs & Alerts ---
  static const String deleteConfirmTitle = "Delete Habit?";
  static const String deleteConfirmDesc = "Are you sure you want to delete this habit? Your streak will be lost!";
  static const String cancel = "Cancel";
  static const String delete = "Delete";
  static const String fieldRequired = "This field cannot be empty";

}
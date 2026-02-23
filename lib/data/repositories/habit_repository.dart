import 'package:hive_flutter/hive_flutter.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:habit_tracker/core/utils/utils.dart';

class HabitRepository {
  static const String boxName = 'habits_box';

  Box<Habit> get _box => Hive.box<Habit>(boxName);

  // CREATE
  Future<void> addHabit(Habit habit) async {
    await _box.add(habit);
  }

  // READ
  Future<List<Habit>> getAllHabits() async {
    final habits = _box.values.toList();

    for (final habit in habits) {
      await _updateHabitForNewDayIfNeeded(habit);
    }

    return habits;
  }

  // DELETE
  Future<void> deleteHabit(Habit habit) async {
    await habit.delete();
  }

  // TOGGLE COMPLETION
  Future<void> toggleHabitCompletion(Habit habit) async {
    await _updateHabitForNewDayIfNeeded(habit);

    final today = DateTime.now().startOfDay();
    final yesterday = today.subtract(const Duration(days: 1));

    final wasCompleted = habit.isCompleted;
    habit.isCompleted = !habit.isCompleted;

    if (habit.isCompleted) {
      // Completing today
      if (habit.lastCompletedDate != null &&
          habit.lastCompletedDate!.startOfDay().isAtSameMomentAs(yesterday)) {
        habit.streak += 1;
      } else {
        habit.streak = 1;
      }

      habit.lastCompletedDate = today;
    } else {
      // Un-completing today
      if (wasCompleted &&
          habit.lastCompletedDate?.startOfDay().isAtSameMomentAs(today) == true) {
        if (habit.streak > 1) {
          habit.streak -= 1;
          habit.lastCompletedDate = yesterday;
        } else {
          habit.streak = 0;
          habit.lastCompletedDate = null;
        }
      }
    }

    await habit.save();
  }

  // DAILY RESET LOGIC
  Future<void> _updateHabitForNewDayIfNeeded(Habit habit) async {
    final today = DateTime.now().startOfDay();

    if (habit.lastCompletedDate == null) {
      if (habit.isCompleted || habit.streak != 0) {
        habit.isCompleted = false;
        habit.streak = 0;
        await habit.save();
      }
      return;
    }

    final last = habit.lastCompletedDate!.startOfDay();
    final yesterday = today.subtract(const Duration(days: 1));

    if (last.isAtSameMomentAs(today)) return;

    if (!last.isAtSameMomentAs(yesterday)) {
      habit.streak = 0;
    }

    habit.isCompleted = false;

    await habit.save();
  }
}
import 'package:hive_flutter/hive_flutter.dart';
import 'package:habit_tracker/data/models/habit.dart';

class HabitRepository {
  // Box name
  static const String boxName = 'habits_box';

  // Get the box that is already opened in main.dart
  Box<Habit> get _box => Hive.box<Habit>(boxName);

  // 1. Create (Add)
  Future<void> addHabit(Habit habit) async {
    await _box.add(habit);
  }

  // 2. Read (Get All)
  List<Habit> getHabits() {
    return _box.values.toList();
  }

  // 3. Update (Since we extended HiveObject, we can save directly)
  Future<void> updateHabit(Habit habit) async {
    await habit.save();
  }

  Future<void> toggleHabitCompletion(Habit habit) async {
    // 1. Change the value in memory
    habit.isCompleted = !habit.isCompleted; 
    
    // 2. Save changes to Hive immediately
    await habit.save(); 
  }

  // 4. Delete
  Future<void> deleteHabit(Habit habit) async {
    await habit.delete();
  }
}
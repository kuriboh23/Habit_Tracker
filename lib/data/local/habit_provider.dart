import 'package:flutter/material.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:habit_tracker/data/repositories/habit_repository.dart';

class HabitProvider extends ChangeNotifier {
  final HabitRepository _repository = HabitRepository();

  List<Habit> _habits = [];

  List<Habit> get habits => _habits.reversed.toList();

  // INITIAL LOAD
  Future<void> loadHabits() async {
    _habits = await _repository.getAllHabits();
    notifyListeners();
  }

  // ADD
  Future<void> addHabit(Habit habit) async {
    await _repository.addHabit(habit);
    await loadHabits();
  }

  // DELETE
  Future<void> deleteHabit(Habit habit) async {
    await _repository.deleteHabit(habit);
    _habits.remove(habit);
    notifyListeners();
  }

  // TOGGLE
  Future<void> toggleHabit(Habit habit) async {
    await _repository.toggleHabitCompletion(habit);
    notifyListeners(); // No reload needed
  }
}
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:habit_tracker/data/repositories/habit_repository.dart';

class HabitProvider extends ChangeNotifier {
  List<Habit> _habits = [];
  final HabitRepository _repo = HabitRepository();
  late final Box<Habit> _box;
  VoidCallback? _boxListener;

  List<Habit> get habits => _habits;

  HabitProvider() {
    _box = Hive.box<Habit>(HabitRepository.boxName);
    // initialize cache from box synchronously
    _habits = _box.values.toList();

    // keep provider state in sync with Hive box changes
    _boxListener = () {
      _habits = _box.values.toList();
      notifyListeners();
    };
    _box.listenable().addListener(_boxListener!);
  }

  Future<List<Habit>> loadHabits() async {
    // Explicit refresh if needed
    _habits = _box.values.toList();
    notifyListeners();
    return _habits;
  }

  Future<void> toggleHabitCompletion(Habit habit) async {
    // Persist change; box listener will update `_habits` and notify.
    await _repo.toggleHabitCompletion(habit);
  }

  Future<void> addHabit(Habit habit) async {
    // Add to persistence; box listener will update cache and notify.
    await _repo.addHabit(habit);
  }

  Future<void> deleteHabit(Habit habit) async{
    // Delete from persistence; box listener will update cache and notify.
    await _repo.deleteHabit(habit);
  }

  @override
  void dispose() {
    if (_boxListener != null) {
      _box.listenable().removeListener(_boxListener!);
    }
    super.dispose();
  }

}
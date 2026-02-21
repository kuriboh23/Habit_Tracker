import 'package:hive/hive.dart';

part 'habit.g.dart';

@HiveType(typeId: 0)
class Habit extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  int colorValue;

  @HiveField(2)
  int iconCodePoint;

  @HiveField(3)
  bool isCompleted;

  Habit({
    required this.title,
    required this.colorValue,
    required this.iconCodePoint,
    this.isCompleted = false,
  });
}
class Habit {
  String title;
  int colorValue;
  int iconCodePoint;
  bool isCompleted;

  Habit({
    required this.title,
    required this.colorValue,
    required this.iconCodePoint,
    this.isCompleted = false,
  });
}
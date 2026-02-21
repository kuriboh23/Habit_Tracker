import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/core/constants/lists.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
import 'package:habit_tracker/presentation/widgets/app_button.dart';
import 'package:habit_tracker/presentation/widgets/select_buttons.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final TextEditingController _titleController = TextEditingController();

  IconData? _selectedIcon;
  Color? _selectedColor;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _onSelectionChanged(IconData icon, Color color) {
    setState(() {
      _selectedIcon = icon;
      _selectedColor = color;
    });
  }

  void _onDone() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final colorValue = _selectedColor?.value ?? HabitPalettes.colors[0].value;
    final iconCodePoint = _selectedIcon?.codePoint ?? Icons.emoji_emotions_outlined.codePoint;

    final newHabit = Habit(
      title: title,
      colorValue: colorValue,
      iconCodePoint: iconCodePoint,
    );

    AppLists.habits.add(newHabit);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppStrings.createHabitTitle,
          style: theme.textTheme.headlineLarge,
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: Column(
          children: [
            SelectButtons(onChanged: _onSelectionChanged),
            const SizedBox(height: 24,),
            Expanded(
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(hintText: 'Habit title'),
              ),
            ),
            AppButton(
              label: AppStrings.done,
              iconColor: colors.surface,
              bgColor: colors.onSurface,
              theme: theme,
              function: _onDone,
            )
          ],
        ),
      ),
    );
  }
}



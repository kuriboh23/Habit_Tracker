import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/core/constants/lists.dart';
import 'package:habit_tracker/data/models/habit.dart';
import 'package:habit_tracker/core/theme/habits_palletes.dart';
import 'package:habit_tracker/data/repositories/habit_repository.dart';
import 'package:habit_tracker/presentation/widgets/app_button.dart';
import 'package:habit_tracker/presentation/widgets/select_ic_buttons.dart';

class AddHabitPage extends StatefulWidget {
  const AddHabitPage({super.key});

  @override
  State<AddHabitPage> createState() => _AddHabitPageState();
}

class _AddHabitPageState extends State<AddHabitPage> {
  final TextEditingController _titleController = TextEditingController();
  final FocusNode _titleFocusNode = FocusNode();

  // Selection State
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

  void _onDone() async{
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    final colorValue = _selectedColor?.toARGB32() ?? HabitPalettes.colors[0].toARGB32();
    final iconCodePoint = _selectedIcon?.codePoint ?? Icons.emoji_emotions_outlined.codePoint;

    final newHabit = Habit(
      title: title,
      colorValue: colorValue,
      iconCodePoint: iconCodePoint,
    );

    await HabitRepository().addHabit(newHabit);
     if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close_rounded, size: 26),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          AppStrings.createHabitTitle, 
          style: theme.textTheme.headlineLarge?.copyWith(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            SelectICButtons(onChanged: _onSelectionChanged),
            const SizedBox(height: 24),
      
            Expanded(
              child: GestureDetector(
                onTap: () => _titleFocusNode.requestFocus(),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: colors.onSurface.withAlpha(20),
                        blurRadius: 10,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    border: Border.all(color: colors.onSurface.withAlpha(25)),
                  ),
                  child: TextField(
                    focusNode: _titleFocusNode,
                    controller: _titleController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    inputFormatters: [LengthLimitingTextInputFormatter(16)],
                    style: const TextStyle(fontWeight: FontWeight.w500),
                    decoration: InputDecoration.collapsed(
                      hintText: 'e.g. No junk food',
                      hintStyle: TextStyle(color: colors.onSurface.withAlpha(120)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 24,),
            AppButton(
              label: AppStrings.done,
              textColor: colors.surface,
              bgColor: colors.onSurface,
              theme: theme,
              function: _onDone,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

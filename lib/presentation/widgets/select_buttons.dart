import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:habit_tracker/core/utils/helper.dart';
import 'package:habit_tracker/presentation/widgets/app_button.dart';

class SelectButtons extends StatefulWidget {
  final void Function(IconData selectedIcon, Color selectedColor)? onChanged;

  const SelectButtons({super.key, this.onChanged});

  @override
  State<SelectButtons> createState() => _SelectButtonsState();
}

class _SelectButtonsState extends State<SelectButtons> {

  final helper = Helper();
  IconData get selectedIcon => helper.selectedIcon;
  Color get selectedColor => helper.selectedColor;
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Row(
      children: [
        AppButton(
          bgColor: colors.onSurface,
          iconColor: colors.surface,
          theme: theme,
          icon: selectedIcon,
          size: 26,
          label: AppStrings.selectIcon,
          border: 14,
          function: () async {
            await helper.showIconPicker(context);
            setState(() {});
            widget.onChanged?.call(helper.selectedIcon, helper.selectedColor);
          },
        ),
        const SizedBox(width: 12),
        AppButton(
          bgColor: colors.onSurface,
          iconColor: selectedColor,
          textColor: colors.surface,
          theme: theme,
          icon: Icons.rectangle_rounded,
          size: 26,
          label: AppStrings.selectColor,
          border: 14,
          function: () async {
            await helper.showColorPicker(context);
            setState(() {});
            widget.onChanged?.call(helper.selectedIcon, helper.selectedColor);
          },
        ),
      ],
    );
  }
}
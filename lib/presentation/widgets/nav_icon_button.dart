import 'package:flutter/material.dart';

class NavIconButton extends StatelessWidget {
  const NavIconButton({
    super.key,
    required this.colors,
    required this.icon,
    this.onPressed,
  });

  final ColorScheme colors;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? (){},
      icon: Icon(icon, size: 24, color: colors.onSurface), 
      style: IconButton.styleFrom(
        backgroundColor: colors.surface, 
        shape: CircleBorder(
          side: BorderSide(width: 2, color: colors.surface),
        ),
      ),
    );
  }
}

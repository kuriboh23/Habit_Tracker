import 'package:flutter/material.dart';

class NavIconButton extends StatelessWidget {
  const NavIconButton({
    super.key,
    this.bgColor,
    this.iconColor,
    required this.colors,
    required this.icon,
    this.onPressed,
  });

  final Color? bgColor;
  final Color? iconColor;
  final ColorScheme colors;
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed ?? (){},
      icon: Icon(icon, size: 24, color: iconColor ?? colors.onSurface), 
      style: IconButton.styleFrom(
        backgroundColor: bgColor ?? colors.surface, 
        shape: CircleBorder(
          side: BorderSide(width: 2, color: bgColor ?? colors.surface),
        ),
      ),
    );
  }
}

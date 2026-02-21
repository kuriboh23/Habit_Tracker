import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.iconColor,
    required this.bgColor,
    required this.theme,
    this.icon,
    this.size,
    this.function,
    this.border = 26,
    Color? textColor,
  }) : textColor = textColor ?? iconColor;

  final String label;
  final Color? iconColor;
  final Color bgColor;
  final Color? textColor;
  final ThemeData theme;
  final IconData? icon;
  final double? size;
  final double border;
  final VoidCallback? function;


  @override
  Widget build(BuildContext context) {
    return icon != null ?
     TextButton.icon(
      onPressed: function,
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(border)),
      ),
      icon: Icon(icon, size: size, color: iconColor),
      label: Text(
        label,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: 'Comfortaa',
        ),
      ),
    ) 
    :
    TextButton(
      onPressed: function,
      style: TextButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(border)),
      ),
      child : Container(
        width: double.infinity,
        
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 6),
          child: Text(
            textAlign: TextAlign.center,
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Comfortaa',
            ),
          ),
      ),
    ) ;
  }
}

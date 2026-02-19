import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StreakBadge extends StatelessWidget {
  final int count;
  final String iconPath;
  final Color backgroundColor;
  final Color? textColor;
  final double iconSize;

  const StreakBadge({
    super.key,
    required this.count,
    required this.iconPath,
    required this.backgroundColor,
    this.textColor,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor.withAlpha(75),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconPath,
            width: iconSize,
            height: iconSize,
          ),
          const SizedBox(width: 6),
          Text(
            count.toString(),
            style: theme.textTheme.bodyMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: textColor ?? Colors.orange.shade800,
            ),
          ),
        ],
      ),
    );
  }
}

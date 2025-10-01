import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/ui/theme.dart';

class RatingBar extends StatelessWidget {
  final int max;
  final int value;
  final double starSize;
  final ValueChanged<int>? onChanged;

  const RatingBar({
    super.key,
    this.max = 5,
    required this.value,
    this.starSize = 35.0,
    this.onChanged,
  }) : assert(value >= 0 && max > 0),
       assert(value <= max);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        max,
        (index) => _Star(
          enabled: index < value,
          starSize: starSize,
          onClick: onChanged == null ? null : () => onChanged?.call(index + 1),
        ),
      ),
    );
  }
}

class _Star extends StatelessWidget {
  final bool enabled;
  final double starSize;
  final VoidCallback? onClick;

  const _Star({
    required this.enabled,
    required this.starSize,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: onClick,
      child: Icon(
        AppIcons.star,
        size: starSize,
        color: enabled
            ? AppPalette.star
            : AppPalette.star.withValues(alpha: 0.3),
      ),
    );
  }
}

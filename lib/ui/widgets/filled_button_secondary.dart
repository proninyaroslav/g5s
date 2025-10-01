import 'package:flutter/material.dart';
import 'package:guest5stars/ui/theme.dart';

class FilledButtonSecondary extends StatelessWidget {
  final VoidCallback onClick;
  final Widget label;
  final Widget? icon;

  const FilledButtonSecondary({
    super.key,
    required this.onClick,
    required this.label,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: () {},
      label: label,
      icon: icon,
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.surfaceContainer,
        ),
        backgroundBuilder: (context, states, child) {
          return SizedBox(child: child);
        },
        foregroundColor: WidgetStatePropertyAll(AppPalette.light),
        textStyle: WidgetStatePropertyAll(
          TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

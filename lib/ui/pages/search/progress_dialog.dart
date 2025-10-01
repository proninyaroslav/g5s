import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/ui/theme.dart';
import 'package:guest5stars/ui/widgets/dots_indicator.dart';

class ProgressDialog extends StatelessWidget {
  final String title;

  const ProgressDialog({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(AppIcons.star, size: 35.0, color: AppPalette.star),

          SizedBox(height: 16.0),

          Text(title, style: Theme.of(context).textTheme.headlineSmall),

          SizedBox(height: 35.0),

          DotsIndicator(),
        ],
      ),
    );
  }
}

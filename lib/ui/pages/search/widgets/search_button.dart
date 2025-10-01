import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:guest5stars/locale.dart';

class SearchButton extends StatelessWidget {
  final VoidCallback onClick;

  const SearchButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      child: FilledButton.icon(
        onPressed: onClick,
        icon: Icon(AppIcons.search, size: 24.0),
        label: Text(S.of(context).find),
      ),
    );
  }
}

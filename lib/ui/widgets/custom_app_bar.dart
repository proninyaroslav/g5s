import 'package:flutter/material.dart';
import 'package:guest5stars/locale.dart';
import 'package:guest5stars/ui/theme.dart';
import 'package:guest5stars/ui/widgets/switch_locale_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      title: Row(
        spacing: 16.0,
        children: [
          if (leading == null) SizedBox(),
          Flexible(
            child: Text(
              S.of(context).appName,
              style: TextStyle(color: AppPalette.star),
            ),
          ),
          Flexible(child: Text(title)),
        ],
      ),
      actions: [
        SwitchLocaleButton(
          current: Localizations.localeOf(context),
          locales: AppLocalizations.supportedLocales,
          onChanged: (locale) {
            // TODO: switch locale
          },
        ),
        ...?actions,
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(58.0);
}

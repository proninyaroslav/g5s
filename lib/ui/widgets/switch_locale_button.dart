import 'package:flutter/material.dart';
import 'package:guest5stars/icons/app_icons.dart';
import 'package:language_code/language_code.dart';

class SwitchLocaleButton extends StatelessWidget {
  final Locale current;
  final List<Locale> locales;
  final ValueChanged<Locale> onChanged;

  const SwitchLocaleButton({
    super.key,
    required this.current,
    required this.locales,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
            return IconButton(
              onPressed: () {
                if (controller.isOpen) {
                  controller.close();
                } else {
                  controller.open();
                }
              },
              icon: Row(
                spacing: 1.5,
                children: [
                  Text(
                    current.languageCode.toUpperCase(),
                    style: Theme.of(context).appBarTheme.titleTextStyle,
                  ),
                  Icon(AppIcons.web),
                ],
              ),
            );
          },
      menuChildren: locales
          .map(
            (locale) => MenuItemButton(
              onPressed: () => onChanged(locale),
              child: Text(LanguageCodes.fromLocale(locale).nativeName),
            ),
          )
          .toList(),
    );
  }
}

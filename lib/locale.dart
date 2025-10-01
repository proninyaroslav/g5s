import 'package:flutter/material.dart';
import 'package:guest5stars/l10n/app_localizations.dart';

export 'package:guest5stars/l10n/app_localizations.dart';

class S {
  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }
}

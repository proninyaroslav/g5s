import 'package:flutter/material.dart';
import 'package:guest5stars/l10n/app_localizations.dart';
import 'package:guest5stars/ui/router/app_router.dart';
import 'package:guest5stars/ui/theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Guest 5 Stars',
      theme: AppTheme.ligth(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: _router.config(),
    );
  }
}

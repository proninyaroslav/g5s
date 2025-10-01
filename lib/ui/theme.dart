import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ColorScheme lightScheme() {
    return ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: AppPalette.reset,
      primary: AppPalette.reset,
      primaryFixedDim: AppPalette.dark,
      onPrimary: AppPalette.white,
      surface: AppPalette.background,
      surfaceContainer: AppPalette.white,
      surfaceContainerHigh: AppPalette.white,
      surfaceContainerHighest: AppPalette.white,
      surfaceContainerLow: AppPalette.white,
      surfaceContainerLowest: AppPalette.white,
      outline: AppPalette.outline,
      onSurfaceVariant: AppPalette.secondary,
    );
  }

  static ThemeData ligth() {
    return theme(lightScheme());
  }

  static ThemeData theme(ColorScheme colorScheme) {
    return ThemeData(
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      textTheme: _textTheme,
      unselectedWidgetColor: colorScheme.outline,
      scaffoldBackgroundColor: colorScheme.primary,
      shadowColor: AppPalette.outline,
      appBarTheme: AppBarThemeData(
        elevation: 0.0,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        titleTextStyle: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.w600,
          color: colorScheme.onPrimary,
        ),
        centerTitle: false,
        titleSpacing: 0.0,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(52.0)),
          elevation: WidgetStatePropertyAll(4.0),
          backgroundBuilder: (context, state, child) {
            return Ink(
              decoration: BoxDecoration(
                gradient: AppPalette.lightGradient,
                borderRadius: BorderRadius.circular(52.0),
              ),
              child: child,
            );
          },
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(52.0)),
          elevation: WidgetStatePropertyAll(4.0),
          foregroundColor: WidgetStatePropertyAll(AppPalette.light),
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
          ),
          iconSize: WidgetStatePropertyAll(24.0),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(AppPalette.light),
          textStyle: WidgetStatePropertyAll(
            TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationThemeData(
        hintStyle: _textTheme.headlineLarge!.copyWith(
          fontSize: 24.0,
          color: colorScheme.onSurfaceVariant,
        ),
        border: InputBorder.none,
        contentPadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 14.0),
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        labelStyle: TextStyle(color: colorScheme.onSurfaceVariant),
        prefixIconColor: colorScheme.primaryFixedDim,
        suffixIconColor: colorScheme.onSurfaceVariant,
      ),
      dialogTheme: DialogThemeData(
        barrierColor: AppPalette.barrierColor,
        elevation: 6.0,
        shadowColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        insetPadding: EdgeInsets.all(12.0),
        constraints: BoxConstraints(maxWidth: 320.0),
      ),
    );
  }
}

class AppPalette {
  const AppPalette._();

  static const Color black = Color(0xFF000000);
  static const Color outline = Color.from(
    alpha: 0.15,
    red: 0,
    green: 0,
    blue: 0,
  );
  static const Color secondary = Color.from(
    alpha: 0.5,
    red: 0,
    green: 0,
    blue: 0,
  );
  static const Color background = Color(0xFFF1F3FB);
  static const Color white = Color(0xFFFFFFFF);
  static const Color reset = Color(0xFF41A6FF);
  static const Color dark = Color(0xFF2C86FF);
  static const Color barrierColor = Color.fromARGB(150, 65, 166, 255);
  static const Color light = Color(0xFF3ECAAF);
  static const Gradient lightGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF16C9A9), Color(0xFF2BB9C2)],
  );
  static const Color star = Color(0xFFF0D90C);
}

final _textTheme = GoogleFonts.robotoTextTheme(
  TextTheme(
    headlineLarge: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
    headlineMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
    titleLarge: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
    titleSmall: TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
    bodyMedium: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
    bodySmall: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
  ),
);

class AppTextTheme {
  const AppTextTheme._();

  static TextStyle input = _textTheme.headlineLarge!.copyWith(fontSize: 24.0);
}

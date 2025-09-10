// Input Field Style Guide:
// - Input text color: Colors.black87 (dark)
// - Input font weight: FontWeight.w400 (normal)
// - Input font size: 24.0
import 'package:flutter/material.dart';

class AppTheme {
  // Colors
  static const Color primaryBlue = Color(0xFF3B82F6);
  static const Color accentGradientStart = Color(0xFF2BB9C2);
  static const Color accentGradientEnd = Color(0xFF16C9A9);
  static const Color navActiveBlue = Color(0xFF41A6FF);
  static const Color grey = Color(0xFFBDBDBD);
  static const Color cardBackground = Colors.white;

  // Font
  static const String fontFamily = 'Roboto';

  // Sizes
  static const double appBarHeight = 56.0;
  static const double bottomNavHeight = 72.0;
  static const double cardBorderRadius = 6.0;
  static const double cardWidthFraction = 0.9;
  static const double cardHeightFraction = 0.55;
  static const double iconSizeAppBar = 31.0;
  static const double iconSizeCardFraction = 0.15; // of card width
  static const double iconSizeNav = 26.0;
  static const double buttonHeight = 48.0;
  static const double buttonBorderRadius = 24.0;
  static const double textFieldFontSize = 24.0;
  static const double textFieldHintFontSize = 18.0;
  static const double navLabelFontSize = 18.0;
  static const FontWeight navLabelFontWeight = FontWeight.w500;
  static const double cardShadowBlur = 8.0;
  static const double cardShadowOffsetY = 4.0;
  static const double cardShadowOpacity = 0.1;
  static const double horizontalPadding = 16.0;
  static const double verticalPadding = 12.0;

  // Text Styles
  static const TextStyle appBarTitle = TextStyle(
    color: Colors.white,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 18,
  );
  static const TextStyle navLabel = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: navLabelFontSize,
  );
  static const TextStyle textField = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontSize: textFieldFontSize,
    color: grey,
  );
  static const TextStyle textFieldHint = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontSize: textFieldHintFontSize,
    color: grey,
  );
}

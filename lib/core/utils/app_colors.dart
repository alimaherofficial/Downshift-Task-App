import 'package:flutter/material.dart';

/// A utility class for centralized management of app colors.
///
/// Contains color definitions that can be used throughout the application.
class AppColors {
  /// Primary color swatch for the application.
  MaterialColor primarySwatchColor = const MaterialColor(
    0xFF070715,
    <int, Color>{
      50: Color(0xFF070715),
      100: Color(0xFF070715),
      200: Color(0xFF070715),
      300: Color(0xFF070715),
      400: Color(0xFF070715),
      500: Color(0xFF070715),
      600: Color(0xFF070715),
      700: Color(0xFF070715),
      800: Color(0xFF070715),
      900: Color(0xFF070715),
    },
  );

  /// The 'wood smoke' color.
  Color woodSmoke = const Color(0xFF0C0C0C);

  /// White color.
  Color white = const Color(0xFFFFFFFF);

  /// The 'green white' color.
  Color greenWhite = const Color(0xFFE7E8E8);

  /// The 'grey chateau' color.
  Color greyChateau = const Color(0xFFA8A7A7);

  /// Green color.
  Color green = const Color(0xFF27AE60);

  /// Grey color.
  Color grey = const Color(0xFFF9F9F9);

  /// A second shade of grey.
  Color grey2 = const Color(0xFF4F4F4F);

  /// Dark grey color.
  Color darkGrey = const Color(0xFF373737);

  /// Another shade of grey.
  Color grey6 = const Color(0xFFF2F2F2);

  /// The 'primaryBlue' color.
  Color primaryBlue = const Color(0xFF070715);

  /// A color for testing purposes.
  Color tryColor = const Color(0xFF797A7A);

  /// Color for dividers in the 'explore' section.
  Color exploreDividerColor = const Color(0xFFD6D6D6);
}

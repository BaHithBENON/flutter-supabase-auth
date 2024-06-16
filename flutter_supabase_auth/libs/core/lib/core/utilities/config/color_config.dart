// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';


/// Class containing color configuration for the application.
///
/// Contains static variables for primary, secondary, dark, neutral, and light colors.
/// Also contains static methods for getting input color, text color, text color inverse,
/// and a gradient based on the current theme.
class ColorConfig {
  /// Color for stars.
  static const Color starColor = Color.fromARGB(255, 255, 55, 0);

  /// Primary color of the application.
  static const Color primary = Color.fromARGB(235, 156, 28, 241);

  /// Primary color of the application.
  static const Color primaryColor = Color(0xFF003399);

  /// Secondary variant of the primary color.
  static const Color primaryColorSecondV = Color.fromARGB(255, 187, 73, 248);

  /// Third variant of the primary color.
  static const Color primaryColorThirdV = Color.fromARGB(255, 73, 17, 103);

  /// Secondary color of the application.
  static const Color secondaryColor = Color(0xFFFCAF17);

  /// Secondary variant of the secondary color.
  static const Color secondaryColorSecondV = Color.fromARGB(255, 240, 73, 78);

  /// Dark color of the application.
  static const Color darkColor = Color(0xFF000A1E);

  /// Neutral color of the application.
  static const Color neutralColor = Color(0xFF666C78);

  /// Light color of the application.
  static const Color lightColor = Color(0xFFDEDFE2);

  /// Returns the input color based on the current theme.
  ///
  /// If the theme is dark, returns a dark gray color.
  /// If the theme is light, returns a light gray color.
  static Color getInputColor(BuildContext context) {
    if (getThemeManager(context).isDarkMode) {
      return Color.fromARGB(255, 56, 55, 55);
    } else {
      return Color.fromARGB(255, 245, 245, 245);
    }
  }

  /// Returns the text color based on the current theme.
  ///
  /// If the theme is dark, returns white.
  /// If the theme is light, returns black.
  static Color getTextColor(BuildContext context) {
    if (getThemeManager(context).isDarkMode) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  /// Returns the inverse text color based on the current theme.
  ///
  /// If the theme is dark, returns black.
  /// If the theme is light, returns white.
  static Color getTextColorInverse(BuildContext context) {
    if (getThemeManager(context).isDarkMode) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }

  /// Returns a gradient based on the current theme.
  ///
  /// If the theme is dark, returns a linear gradient with colors [primaryColor],
  /// [primaryColorSecondV], and [secondaryColor].
  /// If the theme is light, returns a linear gradient with colors [primaryColor],
  /// [primaryColorSecondV], and [secondaryColor].
  static Gradient boxGradient(BuildContext context) {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ColorConfig.primaryColor,
        ColorConfig.primaryColorSecondV,
        ColorConfig.secondaryColor,
      ],
    );
  }

  /// List of predefined gradients.
  static const List<Gradient> gradients = [
    // ...
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ColorConfig.primaryColor,
        ColorConfig.primaryColorSecondV,
        ColorConfig.secondaryColor,
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ColorConfig.primaryColor,
        ColorConfig.primaryColorSecondV,
        ColorConfig.primaryColorThirdV,
      ],
    ),
    LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        ColorConfig.primaryColor,
        ColorConfig.primaryColorSecondV,
        ColorConfig.primaryColorThirdV,
      ],
    ),
  ];
}

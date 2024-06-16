import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../variables/enums.dart';
import '../variables/fonts_names.dart';
import 'color_config.dart';


/// This class contains configuration for the application theme.
class ThemeConfig {
  // GetStorage instance for storing theme data.
  static var themeData = GetStorage('Theme');

  /// Returns the actual theme mode used by the app.
  ///
  /// If the theme mode is not stored in the [themeData], it defaults to light mode.
  static AppThemeMode getActualThemeMode() {
    // If theme mode is not stored, write it as light mode.
    themeData.writeIfNull('theme_mode', AppThemeMode.Light.value);

    // If the stored theme mode is light, return light mode.
    // Otherwise, return dark mode.
    if (themeData.read('theme_mode') == AppThemeMode.Light.value) {
      return AppThemeMode.Light;
    } else {
      return AppThemeMode.Dark;
    }
  }

  /// Changes the theme mode to the given [mode].
  static void changeMode(AppThemeMode mode) {
    // Write the new theme mode to the storage.
    themeData.write('theme_mode', mode.value);
  }

  // Colors used for light and dark themes.
  static Color lightThemeColor = Colors.white,
      darkThemeColor = Colors.grey[900]!;

  /// Theme data for light theme.
  static final lightThemeData = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily: FontsNames.fontMono,
    primaryColor: Colors.white,
    primaryColorLight: ColorConfig.primary,
    primaryColorDark: ColorConfig.primary,
    highlightColor: Colors.grey[200],
    cardColor: const Color.fromARGB(255, 245, 245, 245),
    canvasColor: const Color.fromARGB(255, 245, 245, 245),
    focusColor: const Color.fromARGB(246, 243, 237, 237),
    shadowColor: const Color.fromARGB(246, 195, 190, 190),
    switchTheme: SwitchThemeData(
      thumbColor:
          MaterialStateProperty.resolveWith<Color>((states) => lightThemeColor),
    ),
  );

  /// Theme data for dark theme.
  static final darkThemeData = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    fontFamily: FontsNames.fontMono,
    highlightColor: const Color.fromARGB(100, 56, 55, 55),
    primaryColor: Colors.grey[900],
    primaryColorDark: ColorConfig.primary,
    primaryColorLight: ColorConfig.primary,
    cardColor: const Color.fromARGB(255, 56, 55, 55),
    canvasColor: const Color.fromARGB(255, 56, 55, 55),
    shadowColor: const Color.fromARGB(255, 56, 55, 55),
    switchTheme: SwitchThemeData(
      trackColor:
          MaterialStateProperty.resolveWith<Color>((states) => darkThemeColor),
    ),
  );
}

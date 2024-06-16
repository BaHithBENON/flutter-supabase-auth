import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../variables/fonts_names.dart';

/// Class containing utilities for working with text.
///
/// Contains methods for generating simple and Google-style text styles,
/// as well as functions for removing HTML tags and replacing &nbsp;
/// with a space.
class TextConfig {
  /// Returns a simple text style with the given parameters.
  ///
  /// [bold] indicates whether the text should be bold.
  /// [color] indicates the color of the text.
  /// [size] indicates the size of the text.
  /// [withFont] indicates whether the text should use a specific font.
  /// [font] indicates the name of the font to use.
  /// [underline] indicates whether the text should be underlined.
  /// [height] indicates the height of the text.
  /// [letterSpacing] indicates the amount of spacing between characters.
  /// [wordSpacing] indicates the amount of spacing between words.
  /// [fontStyle] indicates the style of the font.
  /// [foreground] indicates the foreground paint for the text.
  static TextStyle getSimpleTextStyle(
    bool bold, {
    Color? color,
    int? size,
    bool withFont = true,
    String? font,
    bool underline = false,
    double? height,
    double? letterSpacing,
    double? wordSpacing,
    FontStyle? fontStyle,
    Paint? foreground,
  }) {
    return TextStyle(
      fontFamily: withFont ? ( font ?? FontsNames.fontMono) : null,
      decoration: underline ? TextDecoration.underline : TextDecoration.none,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
      fontSize: size != null ? (size == 3 ? 10 : size.toDouble()) : null,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      fontStyle: fontStyle,
      foreground: foreground,
    );
  }

  /// Returns a Google-style text style with the given parameters.
  ///
  /// [font] indicates the name of the font to use.
  /// [color] indicates the color of the text.
  /// [bold] indicates whether the text should be bold.
  /// [size] indicates the size of the text.
  /// [underline] indicates whether the text should be underlined.
  /// [height] indicates the height of the text.
  /// [letterSpacing] indicates the amount of spacing between characters.
  /// [wordSpacing] indicates the amount of spacing between words.
  /// [fontStyle] indicates the style of the font.
  /// [foreground] indicates the foreground paint for the text.
  static TextStyle getGoogleStyle(
    String font, {
    Color? color,
    bool bold = false,
    int? size,
    bool underline = false,
    double? height,
    double? letterSpacing,
    double? wordSpacing,
    FontStyle? fontStyle,
    Paint? foreground,
  }) {
    return GoogleFonts.getFont(
      font, 
      textStyle: getSimpleTextStyle(
        bold,
        color: color,
        size: size,
        underline: underline,
        height: height,
        letterSpacing: letterSpacing,
        wordSpacing: wordSpacing,
        fontStyle: fontStyle,
        foreground: foreground,
      ),
    );
  }

  /// Removes HTML tags from the given string.
  static RegExp regExpForRemoveHTMLTags = RegExp(r"<[^>]*>");


  /// Replaces &nbsp; with a space.
  static RegExp nbsp = RegExp(r"&nbsp;");

  /// Removes HTML tags and replaces &nbsp; with a space in the given string.
  static String textWorker(String str) {
    String option1 = str.replaceAll(TextConfig.regExpForRemoveHTMLTags, "");
    String option2 = option1.replaceAll(TextConfig.nbsp, " ");
    return option2;
  }
}

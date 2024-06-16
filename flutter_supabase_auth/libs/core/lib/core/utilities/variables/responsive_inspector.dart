import 'package:flutter/material.dart';

///
/// [ResponsiveInspector.]
///
/// [@author	Unknown]
/// [ @since	v0.0.1 ]
/// [@version	v1.0.0	Sunday, December 17th, 2023]
/// [@global]
///
/// A class that provides methods to check the current device's screen size.
///
/// This class is used to determine the current device's screen size and
/// return a boolean value indicating if the device is a mobile, tablet or
/// desktop.
class ResponsiveInspector {
  /// A method that checks if the current device's screen width is less than
  /// 650 pixels and returns a boolean value indicating if the device is a mobile.
  ///
  /// [BuildContext context] - The current build context of the application.
  /// Returns a boolean value indicating if the device is a mobile.
  static bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < 650;

  /// A method that checks if the current device's screen width is less than
  /// 1100 pixels and greater or equal to 650 pixels and returns a boolean value
  /// indicating if the device is a tablet.
  ///
  /// [BuildContext context] - The current build context of the application.
  /// Returns a boolean value indicating if the device is a tablet.
  static bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width < 1100 &&
    MediaQuery.of(context).size.width >= 650;

  /// A method that checks if the current device's screen width is greater or
  /// equal to 500 pixels and returns a boolean value indicating if the device
  /// is a desktop.
  ///
  /// [BuildContext context] - The current build context of the application.
  /// Returns a boolean value indicating if the device is a desktop.
  static bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= 500;
}

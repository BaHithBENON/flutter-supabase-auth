// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../features/authentication/ui/login_ui.dart';

/// Map that contains the routes for the application.
///
/// The key is the route's name and the value is a function that
/// returns the widget to be displayed when the route is activated.
///
/// The [BuildContext] argument is used to access the application's
/// dependencies.
///
/// The keys are defined in the [AppRoutes] class.
Map<String, Widget Function(BuildContext)> getAppRoutes(BuildContext context) => {
  // Login route
  /// Route for the login screen.
  ///
  /// This route is used to display the login screen.
  ///
  /// The [context] argument is used to access the application's
  /// dependencies.
  AppRoutes.LOGIN: (context) => const LoginUI(),
};

/// Class that contains the routes for the application.
///
/// The keys are used to identify the routes in the application.
///
/// The values are the names of the routes used in the application.
///
/// The constants are defined in this class.
class AppRoutes {
  /// Route for the login screen.
  ///
  /// This route is used to display the login screen.
  static const LOGIN = "/login"; // no need to comment this constant
}

class RoutesConfig {
  static void changePage(String route, {dynamic arguments, bool replace = false}) {
    if(replace) {
      Get.offAndToNamed(route, arguments: arguments);
    } else {
      Get.toNamed(route, arguments: arguments);
    }
  }
}
import 'package:flutter/material.dart';

/// This class is responsible for navigation.
///
/// It includes the [navigatorKey] attribute, which is a [GlobalKey] used to
/// access the current state of the navigator. It also includes the [navigateTo]
/// method, which is used to navigate to a specific route name, and the [goBack]
/// method, which is used to go back to the previous route.
class NavigationService {
  // The navigator key used to access the current state of the navigator.
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  /// Navigates to the specified [routeName].
  ///
  /// Returns a [Future] that completes to the value passed to [Navigator.pop]
  /// when the pushed route is popped off the navigator.
  ///
  /// The [routeName] parameter is the name of the route to push to the navigator.
  Future<dynamic> navigateTo(String routeName) {
    // Push the named route to the navigator and return the result of the pop
    // operation.
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  /// Navigates back to the previous route.
  ///
  /// This method uses the [pop] method of the [NavigatorState] to navigate
  /// back to the previous route in the navigator stack.
  ///
  /// Returns nothing.
  void goBack() {
    return navigatorKey.currentState!.pop();
  }

}

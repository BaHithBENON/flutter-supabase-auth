// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

import '../../features/authentication/controllers/auth_controller.dart';


/// This class is currently not used and is kept here for future use.
/// It provides a way to access controllers from anywhere in the application.
///
/// It is commented out to prevent accidental usage.
/// If you want to use this class, you can uncomment it.
///
/// This class does not have any methods, it only holds static fields.
class ControllersProvider {
  static final AUTH_CONTROLLER = Get.find<AuthController>();
}

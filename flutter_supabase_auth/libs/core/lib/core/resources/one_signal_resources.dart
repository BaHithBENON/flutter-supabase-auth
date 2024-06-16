import 'package:core/core/secrets/app_secrets.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

/// This class provides resources related to OneSignal.
///
/// This class is used to manage OneSignal sessions, users, and permissions.
class OneSignalResources {

  /// OneSignal session.
  /// Used to interact with OneSignal services.
  static get oneSignalSession => OneSignal.Session;

  /// OneSignal user.
  /// Used to get user information from OneSignal.
  static get oneSignalUser => OneSignal.User;

  /// Initializes OneSignal with the provided app ID.
  ///
  /// [AppSecrets.ONE_SIGNAL_APP_ID] is the app ID for OneSignal.
  static Future<void> init() async {
    // Initialize OneSignal with the provided app ID
    OneSignal.initialize(AppSecrets.ONE_SIGNAL_APP_ID);
  }

  /// Logs in the user with the provided external ID.
  ///
  /// [externalId] is the external ID of the user.
  static Future<void> login(String externalId) async {
    // Log in the user with the provided external ID
    await OneSignal.login(externalId);
  }

  /// Logs out the current user.
  static Future<void> logout() async {
    // Logout the current user
    return await OneSignal.logout();
  }

  /// Requests permission for notifications.
  ///
  /// Returns a boolean indicating whether the permission was granted.
  static Future<bool> requestPermissionForNotification() async {
    // Request permission for notifications
    return await OneSignal.Notifications.requestPermission(true);
  }
}

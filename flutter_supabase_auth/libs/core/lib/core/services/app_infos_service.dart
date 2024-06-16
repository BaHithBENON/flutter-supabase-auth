import 'package:package_info_plus/package_info_plus.dart';

/// This class is responsible for managing app info.
///
/// It includes static properties and methods to retrieve and manipulate app info.
/// The app info includes the app name, package name, version, and build number.
class AppInfosService {
  /// The package info object.
  ///
  /// Contains information about the app like app name, package name, version, and build number.
  static PackageInfo? packageInfo;

  /// Initializes the app info service by fetching the package info.
  ///
  /// This method is asynchronous and fetches the package info from the device.
  static Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  /// Returns the name of the app.
  ///
  /// This getter retrieves the app name from the package info object.
  static String get appName => packageInfo!.appName;

  /// Returns the package name of the app.
  ///
  /// This getter retrieves the package name from the package info object.
  static String get packageName => packageInfo!.packageName;

  /// Returns the version of the app.
  ///
  /// This getter retrieves the version from the package info object.
  static String get version => packageInfo!.version;

  /// Returns the build number of the app.
  ///
  /// This getter retrieves the build number from the package info object.
  static String get buildNumber => packageInfo!.buildNumber;
}

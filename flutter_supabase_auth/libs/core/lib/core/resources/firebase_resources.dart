import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


/// This class is used to manage Firebase resources.
///
/// This class includes an instance of FirebaseMessaging which is used to
/// manage push notifications.
///
/// It also includes a static method to initialize the Firebase app.
/// This method takes optional parameters to customize the Firebase app.
///
/// It also includes a static method to get the Firebase app token.
class FirebaseResources {

  /// The FirebaseMessaging instance used to manage push notifications.
  static FirebaseMessaging messagingInstance = FirebaseMessaging.instance;

  /// The Firebase app instance.
  ///
  /// This attribute is used to access the Firebase app instance.
  static FirebaseApp? get app => Firebase.app();

  /// The Firebase app instance.
  ///
  /// This attribute is used to initialize the Firebase app instance.
  static FirebaseApp instance = Firebase.app();


  /// Initialize the Firebase app.
  ///
  /// This method initializes the Firebase app instance.
  /// It takes optional parameters to customize the Firebase app.
  static Future<void> init({
    String? name,
    FirebaseOptions? options,
    String? demoProjectId,
  }) async {
    instance = await Firebase.initializeApp(
      name: name,
      options: options,
      demoProjectId: demoProjectId,
    );
  }

  /// Get the Firebase app token.
  ///
  /// This method returns the Firebase app token.
  static Future<String?> get token async => await messagingInstance.getToken();

}

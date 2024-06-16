// ignore_for_file: constant_identifier_names

/// This class contains the attributes of the different models and the API response.
/// Each attribute is a constant string that represents the key of the data.
class ModelsAttributs {
  // ModelUser
  /// The unique identifier of a user.
  static const String UID = "uid";
  /// The authentication token of a user.
  static const String TOKEN = "token";
  /// The first name of a user.
  static const String FIRST_NAME = "firstName";
  /// The last name of a user.
  static const String LAST_NAME = "lastName";
  /// The phone number of a user.
  static const String PHONE_NUMBER = "phoneNumber";
  /// The email of a user.
  static const String EMAIL = "email";
  /// The password of a user.
  static const String PASSWORD = "password";
  /// The photo URL of a user.
  static const String PHOTO_URL = "photoUrl";
  /// Indicates if a user is active.
  static const String IS_ACTIVE = "isActive";
  /// Indicates if a user is driver certified.
  static const String DRIVER_CERTIFIED = "driverCertifed";
  /// The push notification token of a user.
  static const String PUSH_TOKEN = "pushToken";

  // Api
  /// The code of the API response.
  static const String RESPONSE_CODE = "responseCode";
  /// The status of the API response.
  static const String RESPONSE_STATUS = "responseStatus";
  /// The message of the API response.
  static const String RESPONSE_MESSAGE = "responseMessage";
  /// The comment of the API response.
  static const String RESPONSE_COMMENT = "responseComment";
  /// The body of the API response.
  static const String RESPONSE_BODY = "responseBody";

  /// The success status.
  static const String SUCCESS = "success";
  /// The failure status.
  static const String FAILURE = "failure";
  /// The waiting status.
  static const String WAITING = "waiting";
  /// The data of the API response.
  static const String DATA = "data";

  /// The message of the API response.
  static const String MESSAGE = "message";
  /// The status of the API response.
  static const String STATUS = "status";
}

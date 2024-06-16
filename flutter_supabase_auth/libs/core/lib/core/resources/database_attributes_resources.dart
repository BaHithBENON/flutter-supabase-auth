/// Class containing all the attributes used in the database.
///
/// This class groups all the attributes used in the database as constants.
/// Each constant represents an attribute used in the database for a specific
/// entity (e.g., user, deal, etc.).
class DatabaseAttributesResources {
  // User
  //
  /// The id of the user.
  static const String id = "id";

  /// The unique identifier of the user.
  static const String uid = "uid";

  /// The authentication token of the user.
  static const String token = "token";

  /// The username of the user.
  static const String username = "username";

  /// The email of the user.
  static const String email = "email";

  /// The first name of the user.
  static const String firstname = "firstname";

  /// The last name of the user.
  static const String lastname = "lastname";

  /// The phone number of the user.
  static const String phoneNumber = "phone_number";

  /// The phone number verification code of the user.
  static const String phoneNumberCode = "phone_number_code";

  /// The timestamp of the last update of the user.
  static const String updatedAt = "updated_at";

  /// The timestamp of the creation of the user.
  static const String createdAt = "created_at";

  /// Indicates whether the user is valid or not.
  static const String isValid = "is_valid";

  /// Indicates whether the user is active or not.
  static const String isActive = "is_active";

  /// Indicates whether the user is deleted or not.
  static const String isDeleted = "is_deleted";

  /// The score of the user.
  static const String score = "score";

  /// The timestamp of the last verification of the user.
  static const String verifiedAt = "verified_at";

  /// Indicates whether the user is verified or not.
  static const String isVerified = "is_verified";

  /// The name of the user.
  static const String name = "name";

  /// The deals accepted by the user.
  static const String dealsAccepted = "deals_accepted";

  /// The Firebase Cloud Messaging (FCM) token of the user.
  static const String fcmToken = "fcm_token";

}


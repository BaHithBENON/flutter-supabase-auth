import 'package:equatable/equatable.dart';

/// Represents a user entity.
///
/// This class holds various attributes of a user, such as their ID, username,
/// email, first name, last name, phone number, phone number code, token, FCM
/// token, updated at, created at, verified at, active status, deleted status,
/// verified status, score, and deals accepted.
class EntityUser extends Equatable {
  /// The ID of the user.
  final String? id;

  /// The UID of the user.
  final String? uid;

  /// The username of the user.
  final String? username;

  /// The email of the user.
  final String? email;

  /// The first name of the user.
  final String? firstname;

  /// The last name of the user.
  final String? lastname;

  /// The phone number of the user.
  final String? phoneNumber;

  /// The phone number code of the user.
  final String? phoneNumberCode;

  /// The token of the user.
  final String? token;

  /// The FCM token of the user.
  final String? fcmToken;

  /// The updated at timestamp of the user.
  final String? updatedAt;

  /// The created at timestamp of the user.
  final String? createdAt;

  /// The verified at timestamp of the user.
  final String? verifiedAt;

  /// The active status of the user.
  final bool? isActive;

  /// The deleted status of the user.
  final bool? isDeleted;

  /// The verified status of the user.
  final bool? isVerified;

  /// The score of the user.
  final int? score;

  /// The number of deals accepted by the user.
  final int? dealsAccepted;

  /// Creates an instance of [EntityUser].
  ///
  /// Takes in various attributes of a user and initializes them.
  const EntityUser({
    this.id,
    this.uid,
    this.token,
    this.fcmToken,
    this.username,
    this.email,
    this.firstname,
    this.lastname,
    this.phoneNumber,
    this.phoneNumberCode,
    this.updatedAt,
    this.createdAt,
    this.isActive,
    this.isDeleted,
    this.score,
    this.isVerified,
    this.verifiedAt,
    this.dealsAccepted,
  });

  @override
  /// Returns a list of the attributes of the user.
  List<Object?> get props => [
    id,
    username,
    email,
    firstname,
    lastname,
    phoneNumber,
    phoneNumberCode,
    token,
    fcmToken,
    updatedAt,
    createdAt,
    isActive,
    isDeleted,
    isVerified,
    score,
    dealsAccepted,
    verifiedAt,
  ];
}

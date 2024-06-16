import 'package:core/core/resources/database_attributes_resources.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/entity_user.dart';

/*
 * ModelUser class
 * This class is used to represent a user model which is used to interact with the database.
 */
class ModelUser extends EntityUser with EquatableMixin {
  /*
   * Constructor for ModelUser class
   * This constructor is used to create a new user model.
   */
  const ModelUser({
    super.id,
    super.uid,
    super.token,
    super.fcmToken,
    super.username,
    super.email,
    super.firstname,
    super.lastname,
    super.phoneNumber,
    super.phoneNumberCode,
    super.updatedAt,
    super.createdAt,
    super.isActive,
    super.isDeleted,
    super.isVerified,
    super.score,
    super.verifiedAt,
    super.dealsAccepted,
  });

  /*
   * fromJson function
   * This function is used to create a user model from a json object.
   */
  factory ModelUser.fromJson(Map<String, dynamic> json) {
    return ModelUser(
      id: json[DatabaseAttributesResources.id],
      uid: json[DatabaseAttributesResources.uid],
      token: json[DatabaseAttributesResources.token],
      fcmToken: json[DatabaseAttributesResources.fcmToken],
      username: json[DatabaseAttributesResources.username],
      email: json[DatabaseAttributesResources.email],
      firstname: json[DatabaseAttributesResources.firstname],
      lastname: json[DatabaseAttributesResources.lastname],
      phoneNumber: json[DatabaseAttributesResources.phoneNumber],
      phoneNumberCode: json[DatabaseAttributesResources.phoneNumberCode] ?? '',
      updatedAt: json[DatabaseAttributesResources.updatedAt],
      createdAt: json[DatabaseAttributesResources.createdAt],
      verifiedAt: json[DatabaseAttributesResources.verifiedAt],
      isActive: json[DatabaseAttributesResources.isActive] ?? false,
      isDeleted: json[DatabaseAttributesResources.isDeleted] ?? false,
      isVerified: json[DatabaseAttributesResources.isVerified] ?? false,
      score: int.tryParse("${json[DatabaseAttributesResources.score] ?? 0}"),
      dealsAccepted: int.tryParse("${json[DatabaseAttributesResources.dealsAccepted] ?? 0}"),
    );
  }

  /*
   * toJson function
   * This function is used to convert a user model to a json object.
   */
  Map<String, dynamic> toJson() => {
    DatabaseAttributesResources.id: id,
    DatabaseAttributesResources.uid: uid,
    DatabaseAttributesResources.token: token,
    DatabaseAttributesResources.fcmToken: fcmToken,
    DatabaseAttributesResources.username: username,
    DatabaseAttributesResources.email: email,
    DatabaseAttributesResources.firstname: firstname,
    DatabaseAttributesResources.lastname: lastname, 
    DatabaseAttributesResources.phoneNumber: phoneNumber,
    DatabaseAttributesResources.phoneNumberCode: phoneNumberCode,
    DatabaseAttributesResources.updatedAt: updatedAt,
    DatabaseAttributesResources.createdAt: createdAt,
    DatabaseAttributesResources.isActive: isActive,
    DatabaseAttributesResources.isDeleted: isDeleted,
    DatabaseAttributesResources.verifiedAt: verifiedAt,
    DatabaseAttributesResources.isVerified: isVerified,
    DatabaseAttributesResources.score: score,
    DatabaseAttributesResources.dealsAccepted: dealsAccepted
  };

  /*
   * toJsonWithoutId function
   * This function is used to convert a user model to a json object, without the id field.
   */
  Map<String, dynamic> toJsonWithoutId() => {
    DatabaseAttributesResources.uid: uid,
    DatabaseAttributesResources.token: token,
    DatabaseAttributesResources.fcmToken: fcmToken,
    DatabaseAttributesResources.username: username,
    DatabaseAttributesResources.email: email,
    DatabaseAttributesResources.firstname: firstname,
    DatabaseAttributesResources.lastname: lastname, 
    DatabaseAttributesResources.phoneNumber: phoneNumber,
    DatabaseAttributesResources.phoneNumberCode: phoneNumberCode,
    DatabaseAttributesResources.updatedAt: updatedAt,
    DatabaseAttributesResources.createdAt: createdAt,
    DatabaseAttributesResources.isActive: isActive,
    DatabaseAttributesResources.isDeleted: isDeleted,
    DatabaseAttributesResources.verifiedAt: verifiedAt,
    DatabaseAttributesResources.isVerified: isVerified,
    DatabaseAttributesResources.score: score,
    DatabaseAttributesResources.dealsAccepted: dealsAccepted
  };

  /*
   * copyWith function
   * This function is used to create a new user model with some fields replaced by new values.
   */
  ModelUser copyWith({
    String? id,
    String? uid,
    String? token,
    String? fcmToken,
    String? username,
    String? email,
    String? firstname,
    String? lastname,
    String? phoneNumber,
    String? phoneNumberCode,
    String? updatedAt,
    String? createdAt,
    bool? isActive,
    bool? isDeleted,
    int? score,
    String? verifiedAt,
    bool? isVerified,
    int? dealsAccepted
  }) => ModelUser(
    id: id ?? this.id,
    uid: uid ?? this.uid,
    token: token ?? this.token,
    fcmToken: fcmToken ?? this.fcmToken,
    username: username ?? this.username,
    email: email ?? this.email,
    firstname: firstname ?? this.firstname,
    lastname: lastname ?? this.lastname,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    phoneNumberCode: phoneNumberCode ?? this.phoneNumberCode,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
    isActive: isActive ?? this.isActive,
    isDeleted: isDeleted ?? this.isDeleted,
    verifiedAt: verifiedAt ?? this.verifiedAt,
    isVerified: isVerified ?? this.isVerified,
    score: score ?? this.score,
    dealsAccepted: dealsAccepted ?? this.dealsAccepted
  );

  /*
   * toEntity function
   * This function is used to create a new user entity from a user model.
   */
  EntityUser toEntity({
    String? id,
    String? uid,
    String? token,
    String? fcmToken,
    String? username,
    String? email,
    String? firstname,
    String? lastname,
    String? phoneNumber,
    String? phoneNumberCode,
    String? updatedAt,
    String? createdAt,
    bool? isActive,
    bool? isDeleted,
    int? score,
    String? verifiedAt,
    bool? isVerified,
    int? dealsAccepted
  }) => EntityUser(
    id: id ?? this.id,
    uid: uid ?? this.uid,
    token: token ?? this.token,
    fcmToken: fcmToken ?? this.fcmToken,
    username: username ?? this.username,
    email: email ?? this.email,
    firstname: firstname ?? this.firstname,
    lastname: lastname ?? this.lastname,
    phoneNumber: phoneNumber ?? this.phoneNumber,
    phoneNumberCode: phoneNumberCode ?? this.phoneNumberCode,
    updatedAt: updatedAt ?? this.updatedAt,
    createdAt: createdAt ?? this.createdAt,
    isActive: isActive ?? this.isActive,
    isDeleted: isDeleted ?? this.isDeleted,
    verifiedAt: verifiedAt ?? this.verifiedAt,
    isVerified: isVerified ?? this.isVerified,
    score: score ?? this.score,
    dealsAccepted: dealsAccepted ?? this.dealsAccepted
  );

  /*
   * fromEntity function
   * This function is used to create a new user model from a user entity.
   */
  factory ModelUser.fromEntity(EntityUser entity) => ModelUser(
    id: entity.id,
    uid: entity.uid,
    token: entity.token,
    fcmToken: entity.fcmToken,
    username: entity.username,
    email: entity.email,
    firstname: entity.firstname,
    lastname: entity.lastname,
    phoneNumber: entity.phoneNumber,
    phoneNumberCode: entity.phoneNumberCode,
    updatedAt: entity.updatedAt,
    createdAt: entity.createdAt,
    isActive: entity.isActive,
    isDeleted: entity.isDeleted,
    verifiedAt: entity.verifiedAt,
    isVerified: entity.isVerified,
    score: entity.score,
    dealsAccepted: entity.dealsAccepted,
  );

}

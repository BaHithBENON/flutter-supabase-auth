// ignore_for_file: avoid_print

import 'package:core/core/errors/failure.dart';
import 'package:core/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/entity_user.dart';
import '../repositories/auth_repository.dart';

/// The [UserRegisterEmailPasswordUseCase] class is responsible for registering a user
/// with the provided email and password.
///
/// It implements the `UseCase` interface and is used to encapsulate the
/// registration logic.
class UserRegisterEmailPasswordUseCase implements UseCase<EntityUser, UserRegisterEmailPasswordUseCaseParams> {
  final AuthRepository authRepository;
  const UserRegisterEmailPasswordUseCase({required this.authRepository});

  @override
  // Calls the `registerWithEmailAndPassword` method of the `authRepository` with the provided parameters.
  /// Registers a user with the provided email and password.
  ///
  /// Parameters:
  /// - `params` (required): The parameters for the registration.
  ///
  /// Returns a `Future` that resolves to an `Either` object.
  /// If the registration is successful, it resolves to a `Right` object
  /// containing an `EntityUser` object representing the registered user.
  /// If there is an error, it resolves to a `Left` object containing a `Failure` object
  /// with the corresponding error message.
  ///
  /// Logs the result of the registration and the end of the use case.
  Future<Either<Failure, EntityUser>> call(UserRegisterEmailPasswordUseCaseParams params) async {
    // Log the start of the use case
    print('UserRegisterEmailPasswordUseCase started with params: $params');
    
    // Call the registerWithEmailAndPassword method of the authRepository
    // to perform the registration operation.
    final result = await authRepository.registerWithEmailAndPassword(
      username: params.username, email: params.email, password: params.password, 
      firstname: params.firstname, lastname: params.lastname, phone: params.phoneNumber, phoneCode: params.phoneCode
    );

    // Log the result
    result.fold(
      (l) => print('UserRegisterEmailPasswordUseCase failed. Error: $l'),
      (r) => print('UserRegisterEmailPasswordUseCase succeeded with result: $r'),
    );

    // Log the end of the use case
    print('UserRegisterEmailPasswordUseCase ended');

    return result;
  }
}


/// The parameters for the `UserRegisterEmailPasswordUseCase`.
///
/// This class is used to group all the parameters needed for the
/// `UserRegisterEmailPasswordUseCase`.
class UserRegisterEmailPasswordUseCaseParams {

  /// The username of the user.
  final String username;

  /// The first name of the user.
  final String firstname;

  /// The last name of the user.
  final String lastname;

  /// The email of the user.
  final String email;

  /// The phone code of the user.
  final String phoneCode;

  /// The password of the user.
  final String password;

  /// The phone number of the user.
  final String phoneNumber;

  /// Creates a new instance of `UserRegisterEmailPasswordUseCaseParams`.
  ///
  /// All parameters are required.
  const UserRegisterEmailPasswordUseCaseParams({
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.email,
    required this.phoneCode,
    required this.password,
    required this.phoneNumber,
  });
}

// ignore_for_file: avoid_print

import 'package:core/core/errors/failure.dart';
import 'package:core/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/entity_user.dart';
import '../repositories/auth_repository.dart';

/// `UserLoginEmailPasswordUseCase` is a use case responsible for handling the login functionality using email and password.
/// It implements the `UseCase` interface from the `core` package.
class UserLoginEmailPasswordUseCase implements UseCase<EntityUser, UserLoginEmailPasswordUseCaseParams> {
  /// Repository that handles the authentication operations.
  final AuthRepository authRepository;

  /// Creates a new instance of `UserLoginEmailPasswordUseCase`.
  ///
  /// Parameters:
  /// - `authRepository`: Repository that handles the authentication operations.
  const UserLoginEmailPasswordUseCase({required this.authRepository});

  /// Calls the `loginWithEmailAndPassword` method of the `authRepository` with the provided `email` and `password` parameters.
  ///
  /// Parameters:
  /// - `params`: An instance of `UserLoginEmailPasswordUseCaseParams` containing the `email` and `password` to be used for authentication.
  ///
  /// Returns a `Future` that resolves to an `Either` object. If the login is successful, it returns a `Right` containing an `EntityUser` object. If there is a failure, it returns a `Left` containing a `Failure` object.
  ///
  /// Throws a `ServerException` if there is an error during the login process.
  @override
  /// Calls the `loginWithEmailAndPassword` method of the `authRepository` with the provided `email` and `password` parameters.
  ///
  /// Parameters:
  /// - `params`: An instance of `UserLoginEmailPasswordUseCaseParams` containing the `email` and `password` to be used for authentication.
  ///
  /// Returns a `Future` that resolves to an `Either` object. If the login is successful, it returns a `Right` containing an `EntityUser` object. If there is a failure, it returns a `Left` containing a `Failure` object.
  ///
  /// Throws a `ServerException` if there is an error during the login process.
  @override
  Future<Either<Failure, EntityUser>> call(UserLoginEmailPasswordUseCaseParams params) async {
    // Call the loginWithEmailAndPassword method of the authRepository
    // to perform the login operation.
    final result = await authRepository.loginWithEmailAndPassword(
      // Pass the email and password provided in the params
      email: params.email,
      password: params.password,
    );

    // Log the result
    result.fold(
      // If there is a failure, print the error message
      (l) => print('UserLoginEmailPasswordUseCase failed. Error: $l'),
      // If the login is successful, print success message
      (_) => print('UserLoginEmailPasswordUseCase succeeded'),
    );

    // Return the result
    return result;
  }
}

/// `UserLoginEmailPasswordUseCaseParams` is a class that represents the parameters for the `UserLoginEmailPasswordUseCase`.
///
/// It contains the `email` and `password` attributes which are used for authentication.
class UserLoginEmailPasswordUseCaseParams {
  /// The email of the user.
  ///
  /// It is required.
  final String email;

  /// The password of the user.
  ///
  /// It is required.
  final String password;

  /// Creates a new instance of [UserLoginEmailPasswordUseCaseParams].
  ///
  /// Parameters:
  /// - `email`: The email of the user.
  /// - `password`: The password of the user.
  const UserLoginEmailPasswordUseCaseParams({
    required this.email,
    required this.password,
  });
}

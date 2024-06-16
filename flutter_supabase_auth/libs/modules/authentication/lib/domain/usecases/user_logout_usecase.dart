// ignore_for_file: avoid_print

import 'package:core/core/errors/failure.dart';
import 'package:core/core/resources/params.dart';
import 'package:core/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/auth_repository.dart';

/// [UserLogoutUseCase] is a class that implements the `UseCase` interface.
///
/// It is responsible for calling the `logout` method of the `authRepository`
/// with no parameters.
///
/// The purpose of this use case is to log out the user.
class UserLogoutUseCase implements UseCase<void, NoParams> {
  /// The `authRepository` is an instance of `AuthRepository`.
  ///
  /// It is responsible for handling authentication-related operations.
  final AuthRepository authRepository;

  /// Creates a new instance of `UserLogoutUseCase`.
  ///
  /// Takes an instance of `AuthRepository` as a required parameter.
  const UserLogoutUseCase({required this.authRepository});

  @override
  /// Calls the `logout` method of the `authRepository` with no parameters.
  ///
  /// This method logs the result of the logout operation and ends the use case.
  ///
  /// Returns a `Future` that resolves to an `Either` object.
  /// If the logout is successful, it resolves to a `Right` object containing `void`.
  /// If there is an error, it resolves to a `Left` object containing a `Failure` object
  /// with the corresponding error message.
  Future<Either<Failure, void>> call(NoParams params) async {
    // Log the start of the use case
    print('UserLogoutUseCase started');
    
    // Call the logout method of the authRepository
    final result = await authRepository.logout();

    // Log the result
    result.fold(
      // If there is a failure, print the error message
      (l) => print('UserLogoutUseCase failed. Error: $l'),
      // If the logout is successful, print success message
      (_) => print('UserLogoutUseCase succeeded'),
    );

    // Log the end of the use case
    print('UserLogoutUseCase ended');

    return result;
  }
}

// ignore_for_file: avoid_print

import 'package:core/core/errors/failure.dart';
import 'package:core/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/auth_repository.dart';

/// Class that represents a use case to get OTP by email.
class UserGetOtpEmailUseCase implements UseCase<void, UserGetOtpEmailUseCaseParams> {
  /// The repository that contains the methods to interact with the server.
  final AuthRepository authRepository;

  /// Initializes a new instance of [UserGetOtpEmailUseCase].
  ///
  /// The [authRepository] parameter is required and must not be null.
  const UserGetOtpEmailUseCase({required this.authRepository});

  /// Calls the method to get OTP by email with the provided parameters.
  ///
  /// Parameters:
  /// - [params]: An instance of [UserGetOtpEmailUseCaseParams] containing the email to be used.
  ///
  /// Returns a [Future] that resolves to an [Either] object.
  /// If the OTP retrieval is successful, it returns a [Right] with `void`.
  /// If there is a failure, it returns a [Left] containing a [Failure] object.
  @override
  Future<Either<Failure, void>> call(UserGetOtpEmailUseCaseParams params) async {
    // Log the start of the use case
    print('UserGetOtpEmailUseCase started');

    // Log the parameters
    print('Email: ${params.email}');

    // Execute the use case
    final result = await authRepository.getOTPByEmail(email: params.email);

    // Log the result
    result.fold(
      (l) => print('UserGetOtpEmailUseCase failed. Error: $l'),
      (_) => print('UserGetOtpEmailUseCase succeeded'),
    );

    // Log the end of the use case
    print('UserGetOtpEmailUseCase ended');

    return result;
  }
}

/// Class that represents the parameters for the [UserGetOtpEmailUseCase].
///
/// Contains the [email] attribute, which is the email to be used for the OTP retrieval.
class UserGetOtpEmailUseCaseParams {
  /// The email to be used for the OTP retrieval.
  ///
  /// This attribute is required and must not be null.
  final String email;

  /// Initializes a new instance of [UserGetOtpEmailUseCaseParams].
  ///
  /// The [email] parameter is required and must not be null.
  const UserGetOtpEmailUseCaseParams({
    required this.email,
  });
}

// ignore_for_file: avoid_print

import 'package:core/core/errors/failure.dart';
import 'package:core/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/auth_repository.dart';

/// Class that represents the use case for verifying user authentication by OTP.
/// [VerifyUserAuthByOtpUseCase] is a use case that verifies user authentication by OTP.
///
/// This class is responsible for calling the `verifyOtp` function of the [authRepository]
/// with the provided OTP token and email, and returns a `Future` that resolves to an `Either` object.
/// If the verification is successful, it returns a `Right` with `void`. If there is a failure,
/// it returns a `Left` containing a [Failure] object.
///
/// Throws an error if there is an issue with the authentication process.
class VerifyUserAuthByOtpUseCase implements UseCase<void, VerifyUserAuthByOtpUseCaseParams> {
  /// The authentication repository.
  ///
  /// This attribute is responsible for handling the authentication related operations.
  final AuthRepository authRepository;

  /// Creates a new instance of the [VerifyUserAuthByOtpUseCase] class.
  ///
  /// The [authRepository] parameter must not be null.
  const VerifyUserAuthByOtpUseCase({required this.authRepository});

  /// Verifies the user authentication by OTP.
  ///
  /// This function takes an instance of [VerifyUserAuthByOtpUseCaseParams] containing the OTP token, email, and a flag indicating if the OTP is for registration.
  /// It returns a `Future` that resolves to an `Either` object.
  /// If the verification is successful, it returns a `Right` with `void`.
  /// If there is a failure, it returns a `Left` containing a [Failure] object.
  ///
  /// Throws an error if there is an issue with the authentication process.
  @override
  Future<Either<Failure, void>> call(VerifyUserAuthByOtpUseCaseParams params) async {
    // Calls the `verifyOtp` function of the `authRepository` with the provided OTP token and email.
    // Returns a `Future` that resolves to an `Either` object.
    final result = await authRepository.verifyOtp(
      token: params.token,
      email: params.email,
      forRegistration: params.forRegistration,
    );

    // Logs the result
    result.fold(
      (l) => print('VerifyUserAuthByOtpUseCase failed. Error: $l'),
      (r) => print('VerifyUserAuthByOtpUseCase succeeded with result: $r'),
    );

    return result;
  }
}


/// Class that represents the parameters for the `VerifyUserAuthByOtpUseCase` use case.
///
/// This class contains the necessary attributes to execute the use case.
class VerifyUserAuthByOtpUseCaseParams {
  /// The OTP token.
  final String token;

  /// The email associated with the OTP.
  final String email;

  /// Indicates whether the OTP is for registration.
  /// Defaults to `false`.
  final bool forRegistration;

  /// Creates a new instance of the `VerifyUserAuthByOtpUseCaseParams` class.
  ///
  /// The [token] parameter represents the OTP token.
  /// The [email] parameter represents the email associated with the OTP.
  /// The [forRegistration] parameter indicates whether the OTP is for registration. Defaults to `false`.
  const VerifyUserAuthByOtpUseCaseParams({
    required this.token,
    required this.email,
    this.forRegistration = false,
  });
}

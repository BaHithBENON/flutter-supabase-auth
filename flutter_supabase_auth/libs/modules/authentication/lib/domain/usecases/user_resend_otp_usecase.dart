// ignore_for_file: avoid_print

import 'package:core/core/errors/failure.dart';
import 'package:core/core/usecases/usecase.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/auth_repository.dart';

/// [UserResendOtpUseCase] is a use case that implements the responsibility of resending an OTP (One-Time Password) to a specific email.
///
/// This use case is responsible for calling the `authRepository.resendOTP` method with the provided `email` parameter.
/// It takes an instance of `UserResendOtpUseCaseParams` as a parameter, which contains the `email` to be used for resending the OTP.
///
/// Attributes:
/// - `authRepository`: An instance of `AuthRepository` that is responsible for interacting with the data source.
class UserResendOtpUseCase implements UseCase<void, UserResendOtpUseCaseParams> {
  final AuthRepository authRepository;

  /// Constructs a new instance of `UserResendOtpUseCase`.
  ///
  /// Parameters:
  /// - `authRepository`: An instance of `AuthRepository` that is responsible for interacting with the data source.
  const UserResendOtpUseCase({required this.authRepository});

  @override
  /// Calls the `resendOTP` method of the `authRepository` with the provided `email` parameter.
  ///
  /// This method is responsible for resending the OTP (One-Time Password) to the specified email.
  /// It takes an instance of `UserResendOtpUseCaseParams` as a parameter, which contains the `email` to be used for resending the OTP.
  ///
  /// Parameters:
  /// - `params`: An instance of `UserResendOtpUseCaseParams` containing the `email` to be used for resending OTP.
  ///
  /// Returns a `Future` that resolves to an `Either` object. If the OTP resend is successful, it returns a `Right` with `void`. If there is a failure, it returns a `Left` containing a `Failure` object.
  /// If there is an error during the OTP resend process, it throws a `ServerException`.
  ///
  /// This method logs the result of the OTP resend process and ends the use case.
  Future<Either<Failure, void>> call(UserResendOtpUseCaseParams params) async {
    // Call the `resendOTP` method of the `authRepository` with the provided `email` parameter.
    final result = await authRepository.resendOTP(email: params.email);

    // Log the result of the OTP resend process
    result.fold(
      // If there is a failure, print the error message
      (l) => print('UserResendOtpUseCase failed. Error: $l'),
      // If the OTP resend is successful, print success message
      (_) => print('UserResendOtpUseCase succeeded'),
    );

    // Log the end of the use case
    print('UserResendOtpUseCase ended');

    // Return the result of the OTP resend process
    return result;
  }
}


/// Class that represents the parameters for the `UserResendOtpUseCase`
///
/// Attributes:
/// - `email`: The email used for resending OTP.
class UserResendOtpUseCaseParams {
  /// The email used for resending OTP.
  /// 
  /// Required.
  final String email;

  /// Creates a new instance of `UserResendOtpUseCaseParams`.
  ///
  /// Parameters:
  /// - `email`: The email used for resending OTP.
  const UserResendOtpUseCaseParams({
    required this.email,
  });
}

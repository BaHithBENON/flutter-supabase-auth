import 'package:core/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../entities/entity_user.dart';

/// An interface for accessing the authentication service.
///
/// This interface defines the methods that need to be implemented by a
/// concrete class for accessing the authentication service.
abstract class AuthRepository {
  /// Logs in a user with the provided email and password.
  ///
  /// Parameters:
  /// - `email` (required): The email of the user as a `String`.
  /// - `password` (required): The password of the user as a `String`.
  ///
  /// Returns a `Future<Either<Failure, EntityUser>>` that resolves to a
  /// `EntityUser` object representing the logged-in user.
  ///
  /// Throws a `ServerException` if the user is not found or if there is an
  /// authentication error.
  Future<Either<Failure, EntityUser>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sends a one-time password (OTP) to the provided email address for signing in.
  ///
  /// Parameters:
  /// - `email`: The email address to send the OTP to. (required)
  ///
  /// Returns a `Future<Either<Failure, void>>` with no return value.
  ///
  /// Throws a `ServerException` if there is an error during the OTP sending process.
  Future<Either<Failure, void>> getOTPByEmail({required String email});

  /// Resends a one-time password (OTP) to the provided email address.
  ///
  /// Parameters:
  /// - `email`: The email address to resend the OTP to. (required)
  ///
  /// Returns a `Future<Either<Failure, void>>` with no return value.
  ///
  /// Throws a `ServerException` if the user is not found or if there is an error during the resend process.
  Future<Either<Failure, void>> resendOTP({required String email});

  /// Registers a new user with the provided `username`, `email`, `password`,
  /// `firstname`, `lastname`, `phone`, and `phoneCode`.
  ///
  /// Throws a `ServerException` if the user already exists and is not deleted,
  /// or if there is an authentication error.
  Future<Either<Failure, EntityUser>> registerWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String phone,
    required String phoneCode,
  });

  /// Verifies the OTP for the given email address.
  ///
  /// Parameters:
  /// - `token`: The OTP token to verify. (required)
  /// - `forRegistration`: Whether the OTP is for user registration. Default is `false`.
  ///
  /// Returns a `Future<Either<Failure, EntityUser>>` that resolves to a
  /// `EntityUser` object representing the logged-in user.
  ///
  /// Throws a `ServerException` if the OTP is invalid.
  Future<Either<Failure, EntityUser>> verifyOtp({
    required String token,
    required String email,
    bool forRegistration = false,
  });

  /// Logs out the current user.
  ///
  /// Returns a `Future<Either<Failure, void>>` with no return value.
  ///
  /// Throws a `ServerException` if there is an error during the logout process.
  Future<Either<Failure, void>> logout();
}

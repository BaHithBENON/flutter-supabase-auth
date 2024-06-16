// ignore_for_file: avoid_print

import 'package:core/core/errors/exception.dart';
import 'package:core/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/entities/entity_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../data_sources/auth_remote_data_source.dart';

// AuthRepositoryImpl class
// This class implements the AuthRepository interface and provides the implementation for each function.
// Each function is responsible for performing a specific operation related to authentication.
class AuthRepositoryImpl implements AuthRepository {

  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImpl(this.authRemoteDataSource);

  @override
  /// Logs in a user with the provided email and password.
  ///
  /// Parameters:
  /// - `email` (required): The email of the user as a `String`.
  /// - `password` (required): The password of the user as a `String`.
  ///
  /// Returns a `Future<Either<Failure, EntityUser>>` that resolves to an `Either`
  /// object. If the login is successful, it resolves to a `Right` object containing
  /// an `EntityUser` object representing the logged-in user. If there is an error,
  /// it resolves to a `Left` object containing a `Failure` object with the corresponding
  /// error message.
  Future<Either<Failure, EntityUser>> loginWithEmailAndPassword({required String email, required String password}) async {
    // Debugging statement
    print("loginWithEmailAndPassword function called with email: $email and password: $password");

    // Call the loginWithEmailAndPassword function of the authRemoteDataSource
    // to perform the login operation.
    try {
      // Debugging statement
      print("Calling authRemoteDataSource.loginWithEmailAndPassword...");
      final user = await authRemoteDataSource.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      // Debugging statement
      print("Login successful with user: $user");
      return Right(user);
    } on ServerException catch (e) {
      // Debugging statement
      print("Server exception caught: ${e.message}");
      // If there is a server exception, return a Left object containing a Failure
      // object with the error message.
      return left(Failure(e.message));
    } catch (e) {
      // Debugging statement
      print("Unexpected exception caught: ${e.toString()}");
      rethrow;
    }
  }

  @override
  /// Registers a user with the provided email and password.
  ///
  /// Parameters:
  /// - `username` (required): The username of the user as a `String`.
  /// - `email` (required): The email of the user as a `String`.
  /// - `password` (required): The password of the user as a `String`.
  /// - `firstname` (required): The first name of the user as a `String`.
  /// - `lastname` (required): The last name of the user as a `String`.
  /// - `phone` (required): The phone number of the user as a `String`.
  /// - `phoneCode` (required): The phone code of the user as a `String`.
  ///
  /// Returns a `Future<Either<Failure, EntityUser>>` that resolves to an `Either`
  /// object. If the registration is successful, it resolves to a `Right` object
  /// containing an `EntityUser` object representing the registered user. If there
  /// is an error, it resolves to a `Left` object containing a `Failure` object
  /// with the corresponding error message.
  Future<Either<Failure, EntityUser>> registerWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String phone,
    required String phoneCode,
  }) async {
    // Debugging statement
    print("registerWithEmailAndPassword function called with username: $username, email: $email, password: $password, firstname: $firstname, lastname: $lastname, phone: $phone, phoneCode: $phoneCode");

    try {
      // Call the registerWithEmailAndPassword function of the authRemoteDataSource
      // to perform the registration operation.
      final user = await authRemoteDataSource.registerWithEmailAndPassword(
        username: username,
        email: email,
        password: password,
        firstname: firstname,
        lastname: lastname,
        phone: phone,
        phoneCode: phoneCode
      );
      // Debugging statement
      print("Registration successful with user: $user");
      return Right(user);
    } on ServerException catch (e) {
      // Debugging statement
      print("Server exception caught: ${e.message}");
      // If there is a server exception, return a Left object containing a Failure
      // object with the error message.
      return left(Failure(e.message));
    } catch (e) {
      // Debugging statement
      print("Unexpected exception caught: ${e.toString()}");
      rethrow;
    }
  }

  @override
  /// Retrieves the one-time password (OTP) for the given email address.
  ///
  /// This function calls the `getOTPByEmail` function of the `authRemoteDataSource`
  /// to send the OTP request to the server. If the request is successful, it
  /// returns a `Right` object containing `null`. If there is an error, it returns
  /// a `Left` object containing a `Failure` object with the corresponding error
  /// message.
  ///
  /// Parameters:
  /// - `email` (required): The email address for which the OTP is requested.
  ///
  /// Returns a `Future<Either<Failure, void>>` that resolves to an `Either`
  /// object. If the request is successful, it resolves to a `Right` object
  /// containing `null`. If there is an error, it resolves to a `Left` object
  /// containing a `Failure` object with the corresponding error message.
  Future<Either<Failure, void>> getOTPByEmail({required String email}) async {
    // Debugging statement
    print("getOTPByEmail function called with email: $email");

    // Call the getOTPByEmail function of the authRemoteDataSource
    // to send the OTP request to the server.
    try {
      await authRemoteDataSource.getOTPByEmail(email: email);
      // Debugging statement
      print("OTP request sent successfully for email: $email");
      return const Right(null);
    } on ServerException catch (e) {
      // Debugging statement
      print("Server exception caught for email: $email. Error message: ${e.message}");
      // If there is a server exception, return a Left object containing a Failure
      // object with the error message.
      return left(Failure(e.message));
    }
  }

  @override
  /// Verifies the one-time password (OTP) for the given email address.
  ///
  /// This function calls the `verifyOtp` function of the `authRemoteDataSource`
  /// to send the OTP verification request to the server. If the request is successful, it
  /// returns a `Right` object containing the verified [EntityUser]. If there is an error, it
  /// returns a `Left` object containing a `Failure` object with the corresponding error
  /// message.
  ///
  /// Parameters:
  /// - `token` (required): The OTP token to be verified.
  /// - `email` (required): The email address for which the OTP is verified.
  /// - `forRegistration` (optional): Indicates whether the OTP is being verified for registration.
  ///
  /// Returns a `Future<Either<Failure, EntityUser>>` that resolves to an `Either`
  /// object. If the verification is successful, it resolves to a `Right` object
  /// containing the verified [EntityUser]. If there is an error, it resolves to a `Left` object
  /// containing a `Failure` object with the corresponding error message.
  Future<Either<Failure, EntityUser>> verifyOtp({required String token, required String email, bool forRegistration = false}) async {
    // Debugging statement
    print("verifyOtp function called with token: $token, email: $email, forRegistration: $forRegistration");

    try {
      // Call the verifyOtp function of the authRemoteDataSource
      // to send the OTP verification request to the server.
      final response = await authRemoteDataSource.verifyOtp(token: token, email: email, forRegistration: forRegistration);
      // Debugging statement
      print("OTP verification response received: $response");
      if(response == null) {
        // If the server returns null, return a Left object containing a Failure object with the error message.
        print("User not found");
        return const Left(Failure("User not found"));
      }
      // If the verification is successful, return a Right object containing the verified EntityUser.
      print("OTP verification successful");
      return Right(response);
    } on ServerException catch (e) {
      // Debugging statement
      print("Server exception caught: ${e.message}");
      // If there is a server exception, return a Left object containing a Failure
      // object with the error message.
      return left(Failure(e.message));
    }
  }

  @override
  /// Resends the OTP (One-Time Password) for the given email address.
  ///
  /// This function calls the `resendOTP` function of the `authRemoteDataSource`
  /// to send the OTP resend request to the server. If the request is successful,
  /// it returns a `Right` object containing `null`. If there is an error,
  /// it returns a `Left` object containing a `Failure` object with the corresponding error
  /// message.
  ///
  /// Parameters:
  /// - `email` (required): The email address for which the OTP is resent.
  ///
  /// Returns a `Future<Either<Failure, void>>` that resolves to an `Either`
  /// object. If the request is successful, it resolves to a `Right` object
  /// containing `null`. If there is an error, it resolves to a `Left` object
  /// containing a `Failure` object with the corresponding error message.
  Future<Either<Failure, void>> resendOTP({required String email}) async {
    // Debugging statement
    print("resendOTP function called with email: $email");

    try {
      // Call the resendOTP function of the authRemoteDataSource
      // to send the OTP resend request to the server.
      await authRemoteDataSource.resendOTP(email: email);
      // Debugging statement
      print("OTP resend request sent successfully for email: $email");
      return const Right(null);
    } on ServerException catch (e) {
      // Debugging statement
      print("Server exception caught for email: $email. Error message: ${e.message}");
      // If there is a server exception, return a Left object containing a Failure
      // object with the error message.
      return left(Failure(e.message));
    } catch (e) {
      // Debugging statement
      print("Exception caught for email: $email. Error message: ${e.toString()}");
      // If there is an exception, return a Left object containing a Failure
      // object with the error message.
      return left(Failure(e.toString()));
    }
  }
  
  @override
  /// Logs out the user by calling the `logout` function of the `authRemoteDataSource`.
  ///
  /// Returns a `Future<Either<Failure, void>>` that resolves to an `Either`
  /// object. If the logout is successful, it resolves to a `Right` object containing
  /// `null`. If there is an error, it resolves to a `Left` object containing a
  /// `Failure` object with the corresponding error message.
  Future<Either<Failure, void>> logout() async {
    // Debugging statement
    print("logout function called");

    try {
      // Call the logout function of the authRemoteDataSource to perform the logout operation.
      await authRemoteDataSource.logout();

      // Debugging statement
      print("Logged out successfully");

      // If the logout is successful, return a Right object containing null.
      return const Right(null);
    } on ServerException catch (e) {
      // Debugging statement
      print("Server exception caught during logout: ${e.message}");

      // If there is a server exception, return a Left object containing a Failure
      // object with the error message.
      return left(Failure(e.message));
    } catch (e) {
      // Debugging statement
      print("Exception caught during logout: ${e.toString()}");

      // If there is an exception, return a Left object containing a Failure
      // object with the error message.
      return left(Failure(e.toString()));
    } finally {
      // Debugging statement
      print("Logout operation completed");
    }
  }
}

import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/model_user.dart';


/// An interface for accessing the authentication service remotely.
///
/// This interface defines the methods that need to be implemented by a
/// concrete class for accessing the authentication service remotely.
///
/// To implement this interface, you can create a class that extends
/// [AuthRemoteDataSource] and implements each of the methods.
abstract interface class AuthRemoteDataSource {

  /// Returns the current user session.
  ///
  /// This method returns the current user session object if the user is
  /// authenticated, otherwise it returns null.
  Session? get currentUserSession;

  /// Logs in a user with the provided email and password.
  ///
  /// This method logs in a user with the provided email and password
  /// and returns a [Future] that resolves to a [ModelUser] object
  /// representing the logged-in user.
  ///
  /// Throws a [ServerException] if the user is not found or if there
  /// is an authentication error.
  Future<ModelUser> loginWithEmailAndPassword({required String email, required String password});

  /// Sends a one-time password (OTP) to the provided email address
  /// for signing in.
  ///
  /// This method sends a one-time password (OTP) to the provided email
  /// address for signing in and returns a [Future] with no return
  /// value.
  ///
  /// Throws a [ServerException] if there is an error during the OTP
  /// sending process.
  Future<void> getOTPByEmail({required String email});

  /// Registers a new user with the provided [username], [email], [password],
  /// [firstname], [lastname], [phone], and [phoneCode].
  ///
  /// Throws a [ServerException] if the user already exists and is not
  /// deleted, or if there is an authentication error.
  Future<ModelUser> registerWithEmailAndPassword({required String username, required String email, required String password,
    required String firstname, required String lastname, required String phone, required String phoneCode,
  });

  /// Resends a one-time password (OTP) to the provided email address.
  ///
  /// This method resends a one-time password (OTP) to the provided email
  /// address and returns a [Future] with no return value.
  ///
  /// Throws a [ServerException] if the user is not found or if there
  /// is an error during the resend process.
  Future<void> resendOTP({required String email});

  /// Verifies the OTP for the given email address.
  ///
  /// This method verifies the OTP for the given email address and returns
  /// a [Future] that resolves to a [ModelUser] object representing
  /// the verified user.
  ///
  /// Throws a [ServerException] if the OTP is invalid or if there is
  /// an authentication error.
  Future<ModelUser?> verifyOtp({required String token, required String email, bool forRegistration = false});

  /// Logs out the current user.
  ///
  /// This method logs out the current user and returns a [Future] with
  /// no return value.
  Future<void> logout();
}

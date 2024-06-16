// ignore_for_file: avoid_print

import 'dart:async';
import 'package:core/core/errors/exception.dart';
import 'package:core/core/resources/collections_tables_resources.dart';
import 'package:core/core/resources/database_attributes_resources.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/model_user.dart';
import 'auth_remote_data_source.dart';

/// `AuthRemoteDataSourceImpl` is an implementation of the `AuthRemoteDataSource` interface.
/// It provides methods for authentication-related operations, such as login, registration,
/// one-time password (OTP) sending and verification, and user logout.
///
/// This class uses the Supabase client to interact with the authentication service.
/// It handles the network requests and responses, and converts the data to the appropriate
/// models before returning them.
///
/// The methods in this class throw a `ServerException` if there is an error during the
/// authentication process. The error message is logged before throwing the exception.
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {

  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);

  @override
  // TODO: implement currentUserSession
  Session? get currentUserSession => supabaseClient.auth.currentSession;

  @override
  /// Logs in a user with the provided email and password.
  ///
  /// Parameters:
  /// - `email` (required): The email of the user as a `String`.
  /// - `password` (required): The password of the user as a `String`.
  ///
  /// Returns a `Future<ModelUser>` that resolves to a `ModelUser` object representing the logged-in user.
  ///
  /// Throws a `ServerException` if the user is not found or if there is an authentication error.
  Future<ModelUser> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      print("Login with email and password: $email, $password");
      final verifiedUserExists = await _getUserByEmail(email: email);
      if (verifiedUserExists == null) {
        print("User not found: $email");
        throw const ServerException("User not found");
      } else {
        if (verifiedUserExists.isDeleted != null && verifiedUserExists.isDeleted == true) {
          print("User is already deleted: $email");
          throw const ServerException("User not found");
        }
      }

      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      if (response.user == null) {
        print("User not found: $email");
        throw const ServerException("User not found");
      }

      final userConnected = ModelUser.fromJson(response.user!.toJson());
      print("User logged in: $userConnected");

      return userConnected;
    } on AuthException catch (e) {
      print("AuthException: ${e.message}");
      throw ServerException(e.message);
    } catch (e) {
      print("Exception: ${e.toString()}");
      throw ServerException(e.toString());
    }
  }

  @override
  /// Registers a new user with the provided [username], [email], [password],
  /// [firstname], [lastname], [phone], and [phoneCode].
  ///
  /// Throws a `ServerException` if the user already exists and is not deleted,
  /// or if there is an authentication error.
  Future<ModelUser> registerWithEmailAndPassword({
    required String username,
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String phone,
    required String phoneCode,
  }) async {
    print("Registering new user with email: $email");
    // Check if user already exists and is not deleted
    final verifiedUserExists = await _getUserByEmail(email: email);
    if (verifiedUserExists != null) {
      if (verifiedUserExists.isDeleted == null ||
          verifiedUserExists.isDeleted == false) {
        print("User already exists and is active: $email");
        throw const ServerException("User exists and active");
      } else {
        // Update existing user account
        // TODO: Implement updating user account
        // Currently, only the connected user can modify their account
      }
    }

    // Register new user
    final response = await supabaseClient.auth.signUp(
      email: email, // Email address
      password: password, // Password
      data: {
        DatabaseAttributesResources.name: username, // Full name
        DatabaseAttributesResources.username: username, // Username
        DatabaseAttributesResources.email: email, // Email address
        DatabaseAttributesResources.firstname: firstname, // First name
        DatabaseAttributesResources.lastname: lastname, // Last name
        DatabaseAttributesResources.phoneNumber: phone, // Phone number
        DatabaseAttributesResources.phoneNumberCode: phoneCode, // Phone code
        DatabaseAttributesResources.updatedAt: DateTime.now().toIso8601String(), // Last updated
        DatabaseAttributesResources.createdAt: DateTime.now().toIso8601String(), // Created at
        DatabaseAttributesResources.verifiedAt: null, // Verified at
        DatabaseAttributesResources.token: null, // Authentication token
        DatabaseAttributesResources.isVerified: false, // Is verified
        DatabaseAttributesResources.isActive: false, // Is active
        DatabaseAttributesResources.isDeleted: false, // Is deleted
        DatabaseAttributesResources.score: 0, // Score
      },
    );

    if (response.user == null) {
      print("User registration failed: $email");
      throw const ServerException("User not found");
    }
    final userRegistered = ModelUser.fromJson(response.user!.toJson());
    print("User registered: $userRegistered");
    return userRegistered;
  }

  @override
  /// Sends a one-time password (OTP) to the provided email address for signing in.
  ///
  /// Parameters:
  /// - `email`: The email address to send the OTP to. (required)
  ///
  /// Returns a `Future` with no return value.
  ///
  /// Throws a `ServerException` if there is an error during the OTP sending process.
  Future<void> getOTPByEmail({required String email}) async {
    // Log the start of the getOTPByEmail function.
    print('[AuthRemoteDataSourceImpl] getOTPByEmail function started');

    // Sends a one-time password (OTP) to the provided email address for signing in.
    try {
      // Log the start of the OTP sending process.
      print('[AuthRemoteDataSourceImpl] Start of OTP sending process');

      // Use Supabase client to sign in with OTP.
      // The `shouldCreateUser` parameter is set to `false` to prevent creating a new user if it doesn't exist.
      await supabaseClient.auth.signInWithOtp(
        email: email,
        shouldCreateUser: false,
      );

      // Log the success of the OTP sending process.
      print('[AuthRemoteDataSourceImpl] OTP sending process successful');

      // Return nothing if the OTP was sent successfully.
      print('[AuthRemoteDataSourceImpl] getOTPByEmail function ended');
      return;
    } catch (e) {
      // If there is an error during the OTP sending process, print the error and throw a ServerException.
      print('[AuthRemoteDataSourceImpl] OTP sending process failed: $e');
      throw ServerException(e.toString());
    }

    // Log the end of the getOTPByEmail function.
  }

  @override
  /// Resends a one-time password (OTP) to the provided email address.
  ///
  /// Parameters:
  /// - `email`: The email address to resend the OTP to. (required)
  ///
  /// Returns a `Future` with no return value.
  ///
  /// Throws a `ServerException` if the user is not found or if there is an error during the resend process.
  Future<void> resendOTP({required String email}) async {
    try {
      // Log the start of the resendOTP function.
      print('[AuthRemoteDataSourceImpl] resendOTP function started');

      // Use Supabase client to resend the OTP.
      final response = await supabaseClient.auth.resend(email: email, type: OtpType.signup);

      // Log the response from Supabase.
      print('[AuthRemoteDataSourceImpl] Supabase response: $response');

      // If the `messageId` in the response is null, throw a `ServerException`.
      if(response.messageId == null) {
        print('[AuthRemoteDataSourceImpl] User not found');
        throw const ServerException("User not found");
      }

      // Return nothing if the OTP was resent successfully.
      print('[AuthRemoteDataSourceImpl] resendOTP function ended');
      return;
    } catch (e) {
      // If there is an error during the resend process, print the error and throw a ServerException.
      print('[AuthRemoteDataSourceImpl] resendOTP function failed: $e');
      print(e.toString());
      throw ServerException(e.toString());
    }
  }

  @override
  /// Verifies the OTP for the given email address.
  ///
  /// Parameters:
  /// - `token`: The OTP token to verify. (required)
  /// - `email`: The email address associated with the OTP. (required)
  /// - `forRegistration`: Whether the OTP is used for user registration. Defaults to `false`.
  ///
  /// Returns a `Future` that resolves to a `ModelUser` object if the OTP is valid,
  /// or `null` if the user is not found.
  ///
  /// Throws a `ServerException` if there is an error during the verification process.
  Future<ModelUser?> verifyOtp({required String token, required String email, bool forRegistration = false}) async {
    try {
      print('[AuthRemoteDataSourceImpl] verifyOtp function started');
      print('[AuthRemoteDataSourceImpl] Token: $token');
      print('[AuthRemoteDataSourceImpl] Email: $email');
      print('[AuthRemoteDataSourceImpl] ForRegistration: $forRegistration');

      // Use Supabase client to verify the OTP.
      // If `forRegistration` is true, use `OtpType.signup`, otherwise use `OtpType.magiclink`.
      AuthResponse response;
      if(forRegistration) {
        response = await supabaseClient.auth.verifyOTP(token: token, email: email, type: OtpType.signup);
      } else {
        response = await supabaseClient.auth.verifyOTP(token: token, email: email, type: OtpType.magiclink);
      }

      print('[AuthRemoteDataSourceImpl] Supabase response: $response');

      // If the `user` in the response is null, throw a `ServerException`.
      if(response.user == null) {
        throw const ServerException("User not found");
      }

      // Return a `ModelUser` object created from the response `user`.
      final user = ModelUser.fromJson(response.user!.toJson());
      print('[AuthRemoteDataSourceImpl] User: $user');
      return user;
    } catch (e) {
      // If there is an error during the verification process, print the error and throw a ServerException.
      print('[AuthRemoteDataSourceImpl] verifyOtp function failed: $e');
      print(e.toString());
      throw ServerException(e.toString());
    }
    finally {
      print('[AuthRemoteDataSourceImpl] verifyOtp function ended');
    }
  }
  
  @override
  /// Logs out the current user by signing them out globally.
  ///
  /// This function sends a request to the Supabase authentication service to sign out the user.
  /// If the sign out is successful, the function returns without any value.
  /// If there is an error during the sign out process, a `ServerException` is thrown with the error message.
  ///
  /// Returns a `Future` with no return value.
  Future<void> logout() async{
    try {
      // Start the logout process.
      print("[AuthRemoteDataSourceImpl] logout function started");

      // Send a sign out request to Supabase using the `global` scope.
      await supabaseClient.auth.signOut(scope: SignOutScope.global);

      // Log the successful completion of the logout process.
      print("[AuthRemoteDataSourceImpl] logout function completed");
    } catch (e) {
      // If there is an error during the sign out process, print the error and throw a ServerException.
      print("[AuthRemoteDataSourceImpl] logout function failed: $e");
      print(e.toString());
      throw ServerException(e.toString());
    }
  }

  /// Retrieves a [ModelUser] object from the database by the given email address.
  ///
  /// This function queries the 'PROFILES' table in the database to find the user
  /// data corresponding to the given email. It uses the Supabase client to
  /// execute the query and returns the first matching user data as a
  /// [ModelUser] object. If no user is found, it returns `null`.
  ///
  /// Parameters:
  ///   - email: The email address of the user to retrieve.
  ///
  /// Returns:
  ///   - A [Future] that resolves to a [ModelUser] object if a matching user
  ///     is found, or `null` if no user is found.
  ///
  /// Throws:
  ///   - [ServerException] if there is an error while retrieving the user data.
  Future<ModelUser?> _getUserByEmail({required String email}) async {
    try {
      // Log the start of the function.
      print("[AuthRemoteDataSourceImpl] _getUserByEmail function started");

      // Log the email being queried.
      print("[AuthRemoteDataSourceImpl] Querying email: $email");

      // Query the 'PROFILES' table for the user data with the given email.
      final userData = await supabaseClient
        .from(CollectionsTablesResources.PROFILES)
        .select()
        .eq(DatabaseAttributesResources.email, email);

      // Log the result of the query.
      print("[AuthRemoteDataSourceImpl] Query result: $userData");

      // If no user data is found, return null.
      if (userData.isEmpty) {
        print("[AuthRemoteDataSourceImpl] No user found");
        return null;
      }

      // Convert the user data to a [ModelUser] object and return it.
      final user = ModelUser.fromJson(userData.first);
      print("[AuthRemoteDataSourceImpl] Found user: $user");
      return user;
    } catch (e) {
      // If there is an error during the query, log the error and throw a ServerException with the error message.
      print("[AuthRemoteDataSourceImpl] _getUserByEmail function failed: $e");
      print(e.toString());
      throw ServerException(e.toString());
    } finally {
      // Log the end of the function.
      print("[AuthRemoteDataSourceImpl] _getUserByEmail function ended");
    }
  }
  
}
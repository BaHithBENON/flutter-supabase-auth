// ignore_for_file: avoid_print

import 'dart:async';
import 'package:core/core/resources/one_signal_resources.dart';
import 'package:core/core/resources/params.dart';
import 'package:core/core/resources/supabase_resources.dart';
import 'package:get/get.dart';

import 'package:authentication/domain/usecases/user_get_otp_email_usecase.dart';
import 'package:authentication/domain/usecases/user_login_email_password_usecase.dart';
import 'package:authentication/domain/usecases/user_logout_usecase.dart';
import 'package:authentication/domain/usecases/user_register_email_password_usecase.dart';
import 'package:authentication/domain/usecases/user_resend_otp_usecase.dart';
import 'package:authentication/domain/usecases/verify_user_auth_by_otp_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// AuthController is the controller for the authentication functionality.
///
/// This class contains methods for registering a user, retrieving OTP,
/// verifying OTP, logging in with email and password, and logging out the
/// current user. It also handles the authentication state changes and
/// initializes the Supabase resources.
class AuthController extends GetxController {

  // Use cases for user registration, OTP retrieval, OTP verification,
  // email and password login, and user logout.
  final UserLoginEmailPasswordUseCase userLoginEmailPasswordUseCase;
  final UserRegisterEmailPasswordUseCase userRegisterEmailPasswordUseCase;
  final UserGetOtpEmailUseCase userGetOtpEmailUseCase;
  final VerifyUserAuthByOtpUseCase verifyUserAuthByOtpUseCase;
  final UserResendOtpUseCase userResendOtpUseCase;
  final UserLogoutUseCase userLogoutUseCase;

  // Observables for loading status, success status, and connection status.
  final Rx<bool> isLoading = false.obs;
  final Rx<bool> isSuccess = false.obs;
  final Rx<bool> isConnected = false.obs;

  // Subscription to the authentication state changes stream.
  late StreamSubscription<AuthState> authStreamSubscription;

  AuthController({
    required this.userLoginEmailPasswordUseCase,
    required this.userRegisterEmailPasswordUseCase,
    required this.userGetOtpEmailUseCase,
    required this.verifyUserAuthByOtpUseCase,
    required this.userResendOtpUseCase,
    required this.userLogoutUseCase,
  });

  @override
  /// Initializes the controller.
  ///
  /// This method is called when the controller is initialized. It calls the
  /// [checkAuth] method to check the authentication status and updates the
  /// connection status.
  @override
  void onInit() {
    // Log the function call.
    print('Initializing AuthController');

    // Call the superclass onInit method to initialize the controller.
    super.onInit();

    // Check the authentication status and update the connection status.
    checkAuth();

    // Log the success of initializing the controller.
    print('AuthController initialized successfully');
  }

  
  @override
  /// Called when the controller is ready to use.
  ///
  /// This method is called when the controller is ready to use. It initializes the
  /// [authStreamSubscription] by calling the [listenToAuthStatus] method.
  @override
  void onReady() {
    // Log the function call.
    print('Subscribing to the authentication state changes stream');

    // Subscribe to the authentication state changes stream.
    authStreamSubscription = listenToAuthStatus();

    // Log the success of subscribing to the stream.
    print('Subscribed to the authentication state changes stream successfully');

    // Call the superclass onReady method to indicate that the controller is ready.
    super.onReady();
  }

  @override
  /// Cancels the authentication state subscription when the controller is closed.
  ///
  /// This method cancels the [authStreamSubscription] when the controller is closed
  /// to prevent memory leaks.
  @override
  void onClose() {
    // Log the function call.
    print('Closing AuthController');

    // Cancel the subscription to the authentication state changes stream.
    authStreamSubscription.cancel();

    // Log the success of closing the controller.
    print('AuthController closed successfully');

    // Call the superclass onClose method to close the controller.
    super.onClose();
  }

  /// Checks the authentication status and updates the connection status.
  ///
  /// This function reinitializes the Supabase resources and updates the
  /// connection status based on whether the user is signed in or not.
  void checkAuth() {
    // Log the function call.
    print('Checking authentication status');

    // Reinitialize the Supabase resources.
    SupabaseResources.reinit();

    // Log the updated connection status.
    print('Connection status updated: ${SupabaseResources.isSignedIn}');

    // Update the connection status based on whether the user is signed in.
    isConnected(SupabaseResources.isSignedIn);
  }

  /// Checks if the user is currently logged in.
  ///
  /// Returns `true` if the user is logged in, `false` otherwise.
  bool isLoggedIn() {
    // Log the function call.
    print('Checking if user is logged in');

    // Check if the current user is not null, indicating that the user is logged in.
    final isLoggedIn = SupabaseResources.supabase.client.auth.currentUser != null;

    // Log the result.
    print('User is logged in: $isLoggedIn');

    return isLoggedIn;
  }

  /// Listens to changes in the authentication state of the user.
  ///
  /// This method listens to the authentication state changes and performs
  /// certain actions based on the event type.
  ///
  /// Returns a [StreamSubscription] that can be used to cancel the subscription
  /// to the authentication state changes stream.
  StreamSubscription<AuthState> listenToAuthStatus() {
    // Listen to changes in the authentication state
    return SupabaseResources.supabase.client.auth.onAuthStateChange.listen((data) async {
      // Get the authentication event
      final AuthChangeEvent event = data.event;

      // Log the authentication event
      print('Authentication event: $event');

      // Perform actions based on the event type
      switch (event) {
        // User signed in
        case AuthChangeEvent.signedIn:
          if (SupabaseResources.supabase.client.auth.currentUser != null) {
            // Log the user ID
            print('User signed in: ${SupabaseResources.supabase.client.auth.currentUser!.id}');
            // Login to OneSignal with the user ID
            await OneSignalResources.login(
                SupabaseResources.supabase.client.auth.currentUser!.id);
          }
          break;
        // User signed out
        case AuthChangeEvent.signedOut:
          // Log the event
          print('User signed out');
          // Logout from OneSignal
          await OneSignalResources.logout();
          break;
        // Initial session
        case AuthChangeEvent.initialSession:
          if (SupabaseResources.supabase.client.auth.currentUser != null) {
            // Log the user ID
            print('Initial session: ${SupabaseResources.supabase.client.auth.currentUser!.id}');
            // Login to OneSignal with the user ID
            await OneSignalResources.login(
                SupabaseResources.supabase.client.auth.currentUser!.id);
          }
          break;
        // Default case
        default:
          // Log the default case
          print('Default case');
      }
    });
  }

  /// Registers a user with email and password.
  ///
  /// This function takes the user's [username], [firstname], [lastname], [email],
  /// [phoneCode], [password], and [phoneNumber] as parameters and registers the user
  /// with these details using the [UserRegisterEmailPasswordUseCase].
  ///
  /// Returns a [Future] that resolves to `void`.
  ///
  /// Throws a [Failure] if the registration fails.
  Future<void> registerWithEmailAndPassword({
    required String username, // The username of the user.
    required String firstname, // The first name of the user.
    required String lastname, // The last name of the user.
    required String email, // The email of the user.
    required String phoneCode, // The phone code of the user's country.
    required String password, // The password of the user.
    required String phoneNumber, // The phone number of the user.
  }) async {
    
    // Log the function call with the provided parameters.
    print('Registering user with email and password: '
        'username: $username, firstname: $firstname, lastname: $lastname, '
        'email: $email, phoneCode: $phoneCode, password: $password, '
        'phoneNumber: $phoneNumber');
    
    // Call the use case to register the user with the provided details.
    final response = await userRegisterEmailPasswordUseCase.call(UserRegisterEmailPasswordUseCaseParams(
      email: email, // The email of the user.
      password: password, // The password of the user.
      username: username, // The username of the user.
      firstname: firstname, // The first name of the user.
      lastname: lastname, // The last name of the user.
      phoneNumber: phoneNumber, // The phone number of the user.
      phoneCode: phoneCode, // The phone code of the user's country.
    ));

    // Handle the response based on whether it is a failure or a success.
    response.fold(
      (failure) {
        // Log the failure.
        print('Registration failed: ${failure.message}');
        isSuccess(false);
        Get.snackbar("Error", failure.message);
      }, 
      (r) {
        // Log the success.
        print('Registration successful');
        isSuccess(true);
        Get.snackbar("Success", "User created successfully");
      },
    );
    
  }

  /// Retrieves the OTP for the specified email address.
  ///
  /// This function calls the [UserGetOtpEmailUseCase] to retrieve the OTP for
  /// the specified email address. If the OTP is successfully retrieved, a
  /// success snackbar is displayed. If there is an error, an error snackbar
  /// is displayed.
  ///
  /// Parameters:
  /// - [email] (required): The email address for which the OTP is to be retrieved.
  /// - [redirectTo] (optional): The URL to redirect to after the OTP is retrieved.
  Future<void> getOtpByEmail({required String email, String? redirectTo}) async {
    // Log the function call with the provided parameters.
    print('Retrieving OTP for email: $email');

    // Call the use case to retrieve the OTP for the specified email address.
    final response = await userGetOtpEmailUseCase.call(UserGetOtpEmailUseCaseParams(email: email));

    // Handle the response based on whether it is a failure or a success.
    response.fold(
      (failure) {
        // Log the failure.
        print('Error retrieving OTP: ${failure.message}');
        // Display an error snackbar.
        isSuccess(false);
        Get.snackbar("Error", failure.message);
      }, 
      (r) {
        // Log the success.
        print('OTP sent to $email');
        // Display a success snackbar.
        isSuccess(true);
        Get.snackbar("OTP", "OTP sent to $email");
      },
    );
  }


  /// Resends the OTP (One Time Password) to the specified email address.
  ///
  /// This function calls the [UserResendOtpUseCase] to resend the OTP to the
  /// specified email address. If the OTP is successfully resent, a success
  /// snackbar is displayed. If there is an error, an error snackbar is displayed.
  ///
  /// Parameters:
  /// - [email] (required): The email address to which the OTP is to be resent.
  Future<void> resendOTP({required String email}) async {
    // Log the function call with the provided parameters.
    print('Resending OTP to email: $email');

    // Call the use case to resend the OTP to the specified email address.
    final response = await userResendOtpUseCase.call(UserResendOtpUseCaseParams(email: email));

    // Handle the response based on whether it is a failure or a success.
    response.fold(
      (failure) {
        // Log the failure.
        print('Error resending OTP: ${failure.message}');
        // Display an error snackbar.
        isSuccess(false);
        Get.snackbar("Error", failure.message);
      }, 
      (r) {
        // Log the success.
        print('OTP resent to $email');
        // Display a success snackbar.
        isSuccess(true);
        Get.snackbar("OTP", "OTP resent to $email");
      },
    );
  }

  /// Verifies the OTP (One Time Password) for the specified email address.
  ///
  /// This function calls the [VerifyUserAuthByOtpUseCase] to verify the OTP for
  /// the specified email address. If the OTP is successfully verified, a success
  /// snackbar is displayed. If there is an error, an error snackbar is displayed.
  ///
  /// Parameters:
  /// - [token] (required): The OTP token to be verified.
  /// - [email] (required): The email address for which the OTP is being verified.
  /// - [redirectTo] (optional): The URL to redirect to after the OTP is verified.
  /// - [forRegistration] (optional): Specifies whether the OTP is being verified for registration.
  Future<void> verifyOtp({
    required String token,
    required String email,
    String? redirectTo,
    bool forRegistration = false,
  }) async {
    // Log the function call with the provided parameters.
    print(
      'Verifying OTP: token: $token, email: $email, forRegistration: $forRegistration',
    );

    // Log the use case call parameters.
    print('Calling verifyUserAuthByOtpUseCase with parameters:');
    print('  token: $token');
    print('  email: $email');
    print('  forRegistration: $forRegistration');

    // Call the use case to verify the OTP for the specified email address.
    final response = await verifyUserAuthByOtpUseCase.call(
      VerifyUserAuthByOtpUseCaseParams(
        token: token,
        email: email,
        forRegistration: forRegistration,
      ),
    );

    // Handle the response based on whether it is a failure or a success.
    response.fold(
      (failure) {
        // Log the failure.
        print('Error verifying OTP: ${failure.message}');
        // Display an error snackbar.
        isSuccess(false);
        Get.snackbar("Error", failure.message);
      }, 
      (r) {
        // Log the success.
        print('OTP verified successfully');
        // Display a success snackbar.
        isSuccess(true);
        Get.snackbar("Success", "OTP verified successfully");
      },
    );
  }

  /// Logs in a user with email and password.
  ///
  /// This function takes the user's [email] and [password] as parameters and
  /// logs in the user using the [UserLoginEmailPasswordUseCase]. If the login
  /// is successful, a success snackbar is displayed. If there is an error,
  /// an error snackbar is displayed.
  ///
  /// Parameters:
  /// - [email] (required): The email of the user.
  /// - [password] (required): The password of the user.
  Future<void> loginWithEmailAndPassword({
    required String email, // The email of the user.
    required String password, // The password of the user.
  }) async {
    
    // Log the function call with the provided parameters.
    print('Logging in user with email and password: email: $email, password: $password');

    // Call the use case to log in the user with the provided email and password.
    final response = await userLoginEmailPasswordUseCase.call(
      UserLoginEmailPasswordUseCaseParams(
        email: email, 
        password: password,
      ),
    );

    // Handle the response based on whether it is a failure or a success.
    response.fold(
      (failure) {
        // Display an error snackbar.
        isSuccess(false);
        print('Login failed: ${failure.message}');
        Get.snackbar("Error", failure.message);
      }, 
      (r) async {
        // Display a success snackbar.
        isSuccess(true);
        print('Login successful');
        Get.snackbar("Success", "User logged in successfully");
      },
    );
    
  }

  /// Logs out the current user.
  ///
  /// This function calls the [UserLogoutUseCase] to log out the current user.
  /// If the logout is successful, a success snackbar is displayed. If there is
  /// an error, an error snackbar is displayed.
  ///
  /// Returns a [Future] that completes when the logout process is finished.
  Future<void> logout() async {
    // Log the function call.
    print('Logging out user');

    // Call the use case to log out the current user.
    final response = await userLogoutUseCase.call(NoParams());

    // Handle the response based on whether it is a failure or a success.
    response.fold(
      // If there is an error, log the error and display an error snackbar.
      (failure) {
        print('Logout failed: ${failure.message}');
        isSuccess(false);
        Get.snackbar("Error", failure.message);
      }, 
      // If the logout is successful, log the success and display a success snackbar.
      (r) {
        print('Logout successful');
        isSuccess(true);
        Get.snackbar("Success", "User logged out successfully");
      },
    );
  }
}
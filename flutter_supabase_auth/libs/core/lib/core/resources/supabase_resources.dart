import 'dart:async';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../secrets/app_secrets.dart';

/*
 * This class is responsible for managing Supabase resources.
 * It provides methods to initialize Supabase, get current user session,
 * check if user is signed in, get user id and email, and listen to auth status.
 * 
 * @author: Marcelo F. Cianfrone <marcelo.cianfrone@gmail.com>
 */
class SupabaseResources {

  // Supabase client instance
  static Supabase supabase = Supabase.instance;

  // Current user session
  static Session? _currentUserSession;
  // Getter for current user session
  static Session? get currentUserSession => _currentUserSession;
  // Setter for current user session
  static setCurrentUserSession() => _currentUserSession = supabase.client.auth.currentSession;

  // If user is signed in
  static bool _isSignedIn = false;
  // Getter for user sign in status
  static bool get isSignedIn => _isSignedIn;
  // Setter for user sign in status
  static void setIsSignedIn() => _isSignedIn = supabase.client.auth.currentSession != null;

  // Current user id
  static String _currentUserId = "";
  // Getter for user id
  static String get currentUserId => _currentUserId;
  // Setter for user id
  static void setCurrentUserId() => _isSignedIn ? _currentUserId = currentUserSession!.user.id : "";

  // Current user email
  static String _currentEmail = "";
  // Getter for user email
  static String get email => _currentEmail;
  // Setter for user email
  static void setCurrentEmail() => _isSignedIn ? _currentEmail = currentUserSession!.user.email! : "";

  // Bucket name for users documents
  static String get usersDocumentsBucketName => "users_documents";

  /*
   * Initializes Supabase client.
   * 
   * @return Future<void>
   */
  static Future<void> init() async {
    supabase = await Supabase.initialize(
      url: AppSecrets.SUPABASE_PROJECT_URL, 
      anonKey: AppSecrets.SUPABASE_API_KEY,
      authOptions: const FlutterAuthClientOptions(
        authFlowType: AuthFlowType.implicit,
      ),
    );
  }

  /*
   * Reinitializes Supabase resources.
   * 
   * @return void
   */
  static void reinit() async {
    setCurrentUserSession();
    setIsSignedIn();
    setCurrentUserId();
    setCurrentEmail();
  }

  /*
   * Listens to auth status changes.
   * 
   * @return StreamSubscription<AuthState>
   */
  static StreamSubscription<AuthState> listenToAuthStatus() {
    return supabase.client.auth.onAuthStateChange.listen((data) {
      //final Session? session = data.session;
      final AuthChangeEvent event = data.event;

      reinit();

      switch (event) {
        case AuthChangeEvent.signedIn:
          // Do something when user signs in
          break;
        case AuthChangeEvent.signedOut:
          // Do something when user signs out
          break;
        case AuthChangeEvent.initialSession:
          // Do something when initial session is set
          break;
        default:
      }
    });
  }
}

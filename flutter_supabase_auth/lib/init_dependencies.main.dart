part of 'init_dependencies.dart';


final serviceLocator = GetIt.instance;


/// Initializes the dependencies of the application.
///
/// This function initializes the Get Storage, Theme Manager, and the Supabase
/// and OneSignal dependencies.
///
/// The Get Storage is used to store the theme and filters data.
/// The Theme Manager is used to manage the application's theme.
/// The Supabase and OneSignal dependencies are used for data storage and push notifications.
///
/// This function is asynchronous and returns a [Future] that completes when
/// all the dependencies have been initialized.
Future<void> initDependencies() async {
  // Initialize Get Storage for storing theme and filters data
  await GetStorage.init('Theme');
  await GetStorage.init('Filters');

  // Initialize Theme Manager for managing the application's theme
  await ThemeManager.initialise();

  // Initialize Supabase and OneSignal dependencies
  await supabaseInitDependencies();
  await oneSignalInitDependencies();
}


/// Initializes the Supabase dependencies.
///
/// This function initializes the Supabase client and registers it as a lazy
/// singleton in the service locator.
///
/// This function is asynchronous and returns a [Future] that completes when
/// the Supabase client has been initialized and registered.
Future<void> supabaseInitDependencies() async {
  // Initialize the Supabase client
  await SupabaseResources.init();

  // Register the Supabase client as a lazy singleton in the service locator.
  // A lazy singleton is a singleton that is only initialized when it is first
  // accessed, and then its instance is cached and returned every time it is
  // accessed again.
  serviceLocator.registerLazySingleton(
    () => SupabaseResources.supabase.client,

    // Optionally, you can specify a name for the lazy singleton. This can be
    // useful for debugging or identifying the instance in the service locator.
    instanceName: 'SupabaseClient',
  );
}


/// Initializes the OneSignal dependencies.
///
/// This function initializes OneSignal and requests permission for notifications.
///
/// This function is asynchronous and returns a [Future] that completes when
/// OneSignal has been initialized and permission has been requested.
Future<void> oneSignalInitDependencies() async {
  // Set the log level to verbose to enable OneSignal logging.
  // This is useful for debugging and identifying any issues with OneSignal.
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  // Initialize OneSignal.
  // This function initializes OneSignal and registers the App Id and
  // Android/iOS project number with OneSignal.
  await OneSignalResources.init();

  // Request permission for notifications.
  // This function requests permission for notifications on the device.
  // If the permission is granted, OneSignal can send push notifications to the device.
  await OneSignalResources.requestPermissionForNotification();
  // OneSignal initialisation
  await OneSignalResources.init();
  await OneSignalResources.requestPermissionForNotification();
}

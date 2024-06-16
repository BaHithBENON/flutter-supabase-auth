// ignore_for_file: constant_identifier_names, avoid_print

import 'package:get_storage/get_storage.dart';

/// Class responsible for managing preferences in the application.
///
/// This class provides methods to register, retrieve, and delete values
/// associated with keys in the storage.
class PreferencesServices {
  /// The storage instance used to store preferences.
  static final GetStorage _storage = GetStorage('Filters');

  /// Registers a value with the given [key] in the storage.
  ///
  /// If the [value] is null or an empty string, this method does nothing.
  /// If a value with the given [key] already exists in the storage, it is updated.
  /// Otherwise, a new key-value pair is added to the storage.
  ///
  /// Parameters:
  ///   - key: The key with which the value will be registered in the storage.
  ///   - value: The value to be registered in the storage.
  static Future<void> registerValue(String key, dynamic value) async {
    // Log the input key and value.
    print("Registering value: key=$key, value=$value");

    // If the value is null or an empty string, do nothing.
    if(value == null || value == '') {
      print("Value is null or empty string. Doing nothing.");
      return;
    }

    // If a value with the given key already exists in the storage, update it.
    if (_storage.read(key) != null) {
      // Print the key-value pair for debugging purposes.
      print("Updating value: key=$key, value=$value");

      // Write the value to the storage.
      await _storage.write(key, value);
    } else {
      // If the key-value pair does not exist in the storage, write it only if the value is not null.
      print("Writing value if null: key=$key, value=$value");
      await _storage.writeIfNull(key, value);
    }
  }

  /// Retrieves the value associated with the given [key] from the storage.
  ///
  /// Parameters:
  ///   - key: The key with which the value is stored in the storage.
  ///
  /// Returns:
  ///   The value associated with the given [key], or null if the key does not exist.
  static dynamic getValue(String key) {
    // Log the input key.
    print("Getting value: key=$key");

    // Read the value associated with the given key from the storage.
    dynamic value = _storage.read(key);

    // Log the value.
    print("Value: $value");

    // Return the value.
    return value;
  }

  /// Deletes the value associated with the given [key] from the storage.
  ///
  /// Parameters:
  ///   - key: The key with which the value is stored in the storage.
  ///
  /// Returns:
  ///   A [Future] that completes when the value is successfully deleted.
  Future<void> deleteValue(String key) async {
    // Log the input key.
    print("Deleting value: key=$key");

    // Remove the value from the storage.
    await _storage.remove(key);

    // Log the result.
    print("Value with key $key deleted successfully.");
  }

  /// The key used to store the favorite phone number preference.
  static const String FAVORITE_PHONE_NUMBER = 'favorite_phone_number';

  /// Returns whether the favorite phone number preference is set.
  static get isFavoritePhoneNumber => PreferencesServices.getValue(FAVORITE_PHONE_NUMBER) != null;

  /// The key used to store the theme mode preference.
  static const String THEME_MODE  = 'dark';

  /// Returns whether the theme mode preference is set.
  static get isThemeMode => PreferencesServices.getValue(THEME_MODE) != null;
}

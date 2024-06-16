/// This class holds all the API routes for the application.
/// It defines the constants for the API preffix and the specific routes.
/// It also has a function to replace the parameters in the URL.
class ApiRoutes {

  /// The API preffix for the application.
  /// This is the base URL for all the API requests.
  static const String apiPreffix = "http://localhost:8765";

  /// Replaces the parameters in the [url] with the corresponding values in the [values] list.
  ///
  /// The [values] list should contain the values in the same order as the parameters in the [url].
  /// For example, if the [url] is "/books/{id}" and the [values] is [1], then the returned URL will be "/books/1".
  ///
  /// Returns the modified URL.
  static String replaceUrlParams(List<dynamic> values, String url) {
    String modifiedUrl = url;

    for (int i = 0; i < values.length; i++) {
      modifiedUrl = modifiedUrl.replaceFirst(RegExp('{.*?}'), values[i].toString());
    }

    return modifiedUrl;
  }


  /// The API preffix for the "book by year" route.
  /// This is the base URL for the "book by year" API route.
  static const String apiBookPreffix = "http://localhost:3000";

}

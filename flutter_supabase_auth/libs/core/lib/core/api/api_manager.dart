import 'dart:convert';

import 'api_response.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

/// This class handles the API requests and responses.
///
/// It uses the `http` package to make HTTP requests and the `get_storage` package
/// to store user data.
class ApiManager {
  // Storage for user data
  static final userData = GetStorage();

  // Default headers for HTTP requests
  static var headerContent = <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  /// Sends an API request and returns the response.
  ///
  /// The [requestUrl] parameter is the URL of the API endpoint.
  /// The [method] parameter is the HTTP method to use for the request.
  /// The [header] parameter indicates whether to include default headers in the request.
  /// The [data] parameter is the request body.
  ///
  /// Returns an [ApiResponse] object representing the response from the API.
  static Future<dynamic> apiRequest(var requestUrl, var method,
      {var header = false, var data}) async {
    // Parse the request URL
    var url = Uri.parse(requestUrl);
    // Encode the request body if headers are included
    var body = header ? jsonEncode(data) : data;
    // Variable to store the response
    var res;
    // Switch statement to handle different HTTP methods
    switch (method) {
      case 'GET':
        res = await http.get(url, headers: header ? headerContent : null);
        break;
      case 'POST':
        res = await http.post(url, headers: header ? headerContent : null, body: body);
        break;
      case 'PUT':
        res = await http.put(url, headers: header ? headerContent : null, body: body);
        break;
      case 'PATCH':
        res = await http.patch(url, headers: header ? headerContent : null, body: body);
        break;
      case 'DELETE':
        res = await http.delete(url, headers: header ? headerContent : null);
        break;
      default:
    }
    // Return the API response
    return ApiResponse.toResponse(res);
  }
}

import 'package:http/http.dart';
import '../utilities/variables/enums.dart';
import '../utilities/variables/models_attributs.dart';
import '../utilities/variables/strings_to_enums.dart';

/// Represents an API response.
///
/// This class holds the response attributes and factory methods to create
/// instances from different sources.
class ApiResponse {
  /// The HTTP response code.
  int responseCode;

  /// The response status.
  ApiResponseStatus? responseStatus;

  /// The response message.
  String? responseMessage;

  /// The response comment.
  String? responseComment;

  /// The response body.
  dynamic responseBody;

  /// Creates a new instance of [ApiResponse].
  ///
  /// The [responseCode] is required and the other attributes are optional.
  ApiResponse(
      {required this.responseCode,
      this.responseStatus,
      this.responseMessage,
      this.responseComment,
      this.responseBody});

  /// Creates a new instance of [ApiResponse] from a map of data.
  ///
  /// The [datas] map must contain the [ModelsAttributs.STATUS],
  /// [ModelsAttributs.MESSAGE], and [ModelsAttributs.DATA] keys.
  factory ApiResponse.toApiResponse(Map<String, dynamic> datas) {
    return ApiResponse(
      responseCode: StringsToEnums.apiResponseStatusCode(datas[ModelsAttributs.STATUS]),
      responseComment: datas[ModelsAttributs.MESSAGE],
      responseMessage: datas[ModelsAttributs.MESSAGE],
      responseStatus: StringsToEnums.apiResponseStatus(datas[ModelsAttributs.STATUS]),
      responseBody: datas[ModelsAttributs.DATA],
    );
  }

  /// Creates a new instance of [ApiResponse] from a [Response] object.
  ///
  /// The [response] object must contain the [Response.statusCode] and
  /// [Response.reasonPhrase] properties.
  factory ApiResponse.toResponse(Response response) {
    return ApiResponse(
      responseCode: response.statusCode,
      responseComment: response.reasonPhrase,
      responseMessage: response.reasonPhrase,
      responseBody: response.body,
    );
  }

  /// Converts the [ApiResponse] instance to a map of data.
  ///
  /// The returned map contains the [responseCode], [responseComment],
  /// [responseMessage], and [responseBody] attributes.
  Map<String, dynamic> toMap(ApiResponse datas) {
    return <String, dynamic>{
      ModelsAttributs.RESPONSE_CODE: responseCode,
      ModelsAttributs.RESPONSE_COMMENT: responseComment,
      ModelsAttributs.RESPONSE_MESSAGE: responseMessage,
      ModelsAttributs.RESPONSE_BODY: responseBody,
    };
  }
}

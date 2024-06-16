
import 'enums.dart';
import 'enums_values_strings.dart';

/// This class is responsible for converting strings to their corresponding
/// enums.
///
/// It contains three methods that convert strings to their corresponding
/// enums. Each method takes a string as input and returns the corresponding
/// enum value.
class StringsToEnums {
  // String to StatusValue
  /// Converts a string to its corresponding [StatusValue] enum value.
  static StatusValue statusValue(String value) {
    StatusValue converted = StatusValue.Waiting;
    switch (value) {
      case EnumsValuesStrings.ACCEPTED:
        converted = StatusValue.Accepted;
        break;
      case EnumsValuesStrings.REFUSED:
        converted = StatusValue.Refused;
        break;
      case EnumsValuesStrings.WAITING:
        converted = StatusValue.Waiting;
        break;
      default:
        converted = StatusValue.Waiting;
    }
    return converted;
  }

  /// Converts a string to its corresponding [RatingEvaluations] enum value.
  static RatingEvaluations ratingValue(String value) {
    RatingEvaluations converted = RatingEvaluations.Mediocre;
    switch (value) {
      case EnumsValuesStrings.EXCELLENT:
        converted = RatingEvaluations.Excellent;
        break;
      case EnumsValuesStrings.TRES_BIEN:
        converted = RatingEvaluations.TresBien;
        break;
      case EnumsValuesStrings.BIEN:
        converted = RatingEvaluations.Bien;
        break;
      case EnumsValuesStrings.PASSABLE:
        converted = RatingEvaluations.Passable;
        break;
      case EnumsValuesStrings.MEDIOCRE:
        converted = RatingEvaluations.Mediocre;
        break;
      default:
        converted = RatingEvaluations.Mediocre;
    }
    return converted;
  }

  /// Converts a string to its corresponding [ApiResponseStatus] enum value.
  static ApiResponseStatus apiResponseStatus(String status) {
    ApiResponseStatus response = ApiResponseStatus.SUCCESS;
    switch (status) {
      case EnumsValuesStrings.SUCCESS:
        response = ApiResponseStatus.SUCCESS;
        break;
      case EnumsValuesStrings.FAILURE:
        response = ApiResponseStatus.FAILURE;
        break;
      default:
        response = ApiResponseStatus.FAILURE;
    }
    return response;
  }

  /// Converts a string to its corresponding HTTP status code.
  static int apiResponseStatusCode(String status) {
    int response = 200;
    switch (status) {
      case EnumsValuesStrings.SUCCESS:
        response = 200;
        break;
      case EnumsValuesStrings.FAILURE:
        response = 500;
        break;
      default:
        response = 200;
    }
    return response;
  }
}
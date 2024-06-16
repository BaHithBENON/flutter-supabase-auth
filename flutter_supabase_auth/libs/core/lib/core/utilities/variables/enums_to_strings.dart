import 'enums.dart';
import 'enums_values_strings.dart';

/// This class is used to convert enum values to their corresponding strings.
class EnumsToStrings {
  // StatusValue to String
  /// Converts a [StatusValue] enum to its corresponding string value.
  static String statusValue(StatusValue value) {
    String converted = EnumsValuesStrings.WAITING;
    switch (value) {
      case StatusValue.Accepted:
        converted = EnumsValuesStrings.ACCEPTED;
        break;
      case StatusValue.Refused:
        converted = EnumsValuesStrings.REFUSED;
        break;
      case StatusValue.Waiting:
        converted = EnumsValuesStrings.WAITING;
        break;
      default:
        converted = EnumsValuesStrings.WAITING;
    }
    return converted;
  }

  /// Converts a [RatingEvaluations] enum to its corresponding string value.
  static String ratingValue(RatingEvaluations value) {
    String converted = EnumsValuesStrings.MEDIOCRE;
    switch (value) {
      case RatingEvaluations.Excellent:
        converted = EnumsValuesStrings.EXCELLENT;
        break;
      case RatingEvaluations.Bien:
        converted = EnumsValuesStrings.BIEN;
        break;
      case RatingEvaluations.TresBien:
        converted = EnumsValuesStrings.TRES_BIEN;
        break;
      case RatingEvaluations.Passable:
        converted = EnumsValuesStrings.PASSABLE;
        break;
      case RatingEvaluations.Mediocre:
        converted = EnumsValuesStrings.MEDIOCRE;
        break;
      default:
        converted = EnumsValuesStrings.MEDIOCRE;
    }
    return converted;
  }

  /// Converts an [ApiResponseStatus] enum to its corresponding string value.
  static String apiResponseStatus(ApiResponseStatus status) {
    String response = "";
    switch (status) {
      case ApiResponseStatus.SUCCESS:
        response = EnumsValuesStrings.SUCCESS;
        break;
      case ApiResponseStatus.FAILURE:
        response = EnumsValuesStrings.FAILURE;
        break;
      default:
        response = EnumsValuesStrings.FAILURE;
    }
    return response;
  }


  /// Converts an enum value to its corresponding string value.
  ///
  /// The string value is obtained by splitting the enum value's string
  /// representation and taking the last part.
  String enumToString(dynamic enumValue) {
    return enumValue.toString().split('.').last.toUpperCase();
  }
}

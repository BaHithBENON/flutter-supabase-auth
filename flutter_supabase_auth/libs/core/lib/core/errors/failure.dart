import 'package:equatable/equatable.dart';


/// [Failure] represents a class that handles errors in the application.
/// It extends the [Equatable] class to compare instances.
///
/// The class contains a single attribute [message] which is a [String]
/// that describes the error that occurred.
///
/// The class implements the [props] method from the [Equatable] class.
/// This method is used to compare instances of this class.
///
/// The [Failure] class is the base class for all exceptions in the application.
/// This means that each exception should extend this class.
class Failure extends Equatable {
  /// The message that describes the error that occurred.
  final String message;

  /// Creates a [Failure] instance with an optional [message].
  /// If no [message] is provided, it defaults to 'An unexpected error occurred'.
  const Failure([this.message = 'An unexpected error occurred,']);

  /// Returns a list of the object's fields that should be used for equality comparison.
  ///
  /// The [props] method is used by the [Equatable] class to compare instances.
  /// This method is used to specify which fields should be used for comparison.
  /// In this case, only the [message] attribute is used for comparison.
  @override
  List get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);
}
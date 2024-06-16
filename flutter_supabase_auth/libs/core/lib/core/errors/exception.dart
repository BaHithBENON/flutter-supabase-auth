/// Represents an exception that is thrown when a server error occurs.
///
/// This exception is thrown when the application encounters an error while
/// communicating with the server. It provides a way to handle and log server
/// errors in a consistent manner.
class ServerException implements Exception {
  /// The message describing the server error.
  final String message;

  /// Creates a new [ServerException] with the specified message.
  ///
  /// The [message] parameter is the message describing the server error.
  const ServerException(this.message);

  /// Returns the message describing the server error.
  @override
  String toString() {
    return message;
  }
}
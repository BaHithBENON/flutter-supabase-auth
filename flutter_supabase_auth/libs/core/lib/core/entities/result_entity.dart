import '../errors/failure.dart';

/// [ResultEntity] represents a class that holds the result of an operation.
/// It contains a generic type [T] which can be any type of data.
/// The class contains two attributes: [data] and [error].
/// [data] is the result of the operation if it was successful.
/// [error] is the error that occurred if the operation failed.
class ResultEntity<T> {
  /// The result of the operation if it was successful.
  T? data;

  /// The error that occurred if the operation failed.
  Failure? error;

  /// Creates a new instance of [ResultEntity] with the given [data] and [error].
  ResultEntity(this.data, this.error);

  /// Checks if this [ResultEntity] is equal to another object.
  ///
  /// It checks if the other object is an instance of [ResultEntity] and if its
  /// [data] and [error] attributes are equal to this object's [data] and [error]
  /// attributes.
  @override
  bool operator ==(Object other) {
    // Check if the objects are the same instance
    if (identical(this, other)) {
      return true;
    }

    // Check if the other object is an instance of ResultEntity and if its
    // data and error attributes are equal to this object's data and error
    // attributes
    return other is ResultEntity<T> &&
        other.data == data &&
        other.error == error;
  }

  /// Returns a hash code for this [ResultEntity].
  ///
  /// The hash code is based on the hash codes of the [data] and [error] attributes.
  @override
  int get hashCode => data.hashCode ^ error.hashCode;
}

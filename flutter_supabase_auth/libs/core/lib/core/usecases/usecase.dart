import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';

/// This class represents a use case.
///
/// [UseCase] is an abstract interface class that defines the structure
/// of a use case. It takes a generic type [SucessType] which represents the type of the
/// success value and [Params] which represents the type of the parameters.
///
/// The class has a single method [call] which takes an instance of [Params]
/// and returns a [Future] of type [Either<Failure, SucessType>].
abstract interface class UseCase<SucessType, Params> {
  /// Executes the use case with the given parameters.
  ///
  /// The [params] parameter is the input parameters for the use case.
  ///
  /// Returns a [Future] that completes with the result of the use case. If the use case
  /// is successful, the result is a [Right] containing the success value. Otherwise,
  /// the result is a [Left] containing the failure.
  Future<Either<Failure, SucessType>> call(Params params);
}

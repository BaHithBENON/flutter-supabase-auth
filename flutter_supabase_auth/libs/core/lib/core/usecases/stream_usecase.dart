import 'package:fpdart/fpdart.dart';

import '../errors/failure.dart';


/// This class represents a stream use case.
///
/// [StreamUseCase] is an abstract interface class that defines the structure
/// of a use case that returns a stream of type [Either<Failure, SucessType>].
/// It takes a generic type [SucessType] which represents the type of the
/// success value and [Params] which represents the type of the parameters.
///
/// The class has a single method [call] which takes an instance of [Params]
/// and returns a [Stream] of type [Either<Failure, SucessType>].
abstract interface class StreamUseCase<SucessType, Params> {
  /// Calls the use case with the given [params] and returns a [Stream] of type
  /// [Either<Failure, SucessType>].
  ///
  /// The [params] parameter represents the parameters of the use case.
  ///
  /// Returns a [Stream] of type [Either<Failure, SucessType>] which emits the
  /// result of the use case.
  ///
  /// If the use case is successful, the stream emits a [Right] value of type
  /// [SucessType]. If the use case encounters an error, the stream emits a
  /// [Left] value of type [Failure].
  Stream<Either<Failure, SucessType>> call(Params params);
}

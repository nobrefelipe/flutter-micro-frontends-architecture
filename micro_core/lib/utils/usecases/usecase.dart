// import 'package:dependencies/dependencies.dart';

// import '../errors/failures.dart';

// abstract class Usecase<Input extends Params, Output> {
//   Usecase() {
//     ///
//     /// Make sure who implements this class
//     /// always specify an Input and Output.
//     ///
//     assert(Input != dynamic && Output != dynamic);
//   }

//   ///
//   /// This mehtod is the contract when we extend [Usecase]
//   /// Here is where we execute the code of out usecase.
//   ///
//   Future<Either<IFailure, Output>> call(Input params);
// }

// ///
// /// Because we need to pass a [Input] type to [Usecase],
// /// when we dont need to pass params we use the generic [NoParams] class.
// ///
// class NoParams extends Params {
//   @override
//   List<Object> get props => [];
// }

// abstract class Params extends Equatable {
//   @override
//   List<Object> get props => [];
// }

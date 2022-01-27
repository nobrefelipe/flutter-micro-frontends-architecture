// import 'package:dependencies/dependencies.dart';
// import 'package:legacy/legacy.dart';

// import '../../infrastructure.dart';

// //! to be removed
// class Failure extends IFailure {
//   Failure(String message) : super(message);
//   @override
//   List<Object> get props => [message];
// }

// abstract class IFailure extends Equatable implements Exception {
//   final String message;
//   final StackTrace? stackTrace;

//   IFailure(this.message, [this.stackTrace]) {
//     ErrorHandler().logException(this.message, this.stackTrace);
//   }

//   void showErrorSnacbar() {
//     final _showErrorMessage = ShowErrorMessage();
//     _showErrorMessage(message);
//   }
// }

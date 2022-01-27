import 'package:micro_core/micro_core.dart';

/// * Micro App Events
/// Register the micro app events here
/// so we provide them in [RouteEvents] to be fired from accross the micro apps.
/// The [initRouteListeners] method above will listen to the events listened here.
///

class UserLoggedOutEvent extends RouteEvent {}

class UserForgotPasswordEvent extends RouteEvent {}

///
/// Exports the events in a class so we dont need to import
/// them from other micro apps. LoginEvents will be used by [RouteEvents]
///
class LoginEvents extends RouteEvent {
  RouteEvent userLoggedOutEvent = UserLoggedOutEvent();
  RouteEvent userForgotPasswordEvent = UserForgotPasswordEvent();
}

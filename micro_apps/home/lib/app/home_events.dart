import 'package:micro_core/micro_core.dart';

/// * Micro App Events
/// Register the micro app events here
/// so we provide them in [RouteEvents] to be fired from accross the micro apps.
/// The [initRouteListeners] method above will listen to the events listened here.
///

class UserLoggedInEvent extends RouteEvent {
  final String user;
  UserLoggedInEvent(this.user);
}

class UserCreatedEvent extends RouteEvent {}

class OpenBottomSheetEvent extends RouteEvent {
  final String title;
  OpenBottomSheetEvent(this.title);
}

///
/// Exports the events in a class so we dont need to import
/// them from other micro apps. LoginEvents will be used by [RouteEvents]
///
class HomeEvents extends RouteEvent {
  RouteEvent userLoggedInEvent(String user) => UserLoggedInEvent(user);
  RouteEvent openBottomSheet(String title) => OpenBottomSheetEvent(title);
}

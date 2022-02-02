import 'package:flutter/widgets.dart';

import '../micro_core.dart';

///
/// * MicroApp
///
/// A micro app is a contract that all micro front ends must implement.
///
/// Here we have all it's needed for a micro app to work.
///
/// A MicroApp is implemented by the Resolver of each micro front end.
///
abstract class MicroApp {
  ///
  /// The micro app name, used for routing.
  ///
  String get microAppName;

  ///
  /// Register the routes for this micro app here.
  ///
  /// This getter will be used in the [BaseApp] to register all routes.
  ///
  Map<String, WidgetBuilderArgs> get routes;

  ///
  /// * Micro App Widget
  ///
  /// Sometimes our micro app is just a widget and not a view.
  ///
  /// In this case we gestister the widget here instead of creating a route for it.
  ///
  /// The widget gets registred in the WidgetsRegistry. Then we can call for this getter from other micro apps.
  ///
  Widget? microAppWidget();

  ///
  /// * Init Route Listeners
  ///
  /// Initialize the listeners for this micro app.
  ///
  /// This is where we listen to events and take action based on it.
  ///
  /// eg.: On UserLoggedOutEvent navigate to login screen,
  ///
  /// ```
  /// CustomEventBus.bus.on<UserLoggedOutEvent>().listen((UserLoggedOutEvent event) {
  ///    Routing.pushNamed<UserLoggedOutEvent>(Routes.login);
  ///  });
  /// ```
  ///
  void initEventListeners();

  ///
  /// * Micro App Events
  ///
  /// A method that returns an RouteEvent class.
  ///
  /// [RouteEvent] should register all the events the micro app needs to work properly.
  ///
  /// Thise object will be registred on the base app so all micro app can communicate between each other.
  ///
  /// Eg:
  /// ```
  ///  @override
  ///  LoginEvents microAppEvents() => LoginEvents();
  /// ```
  ///
  RouteEvent microAppEvents();
}

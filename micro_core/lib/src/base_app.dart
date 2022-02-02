import 'package:flutter/material.dart';

import '../micro_core.dart';

/// * Base App
///
/// Responsible for initializing the project and setting up the routing.
///
/// It's the only one to know all micro apps.
///
abstract class BaseApp {
  ///
  /// * Micro Apps
  ///
  /// A list of [MicroApp]. Here is where we declare all micro apps resolvers from the Base App
  ///
  List<MicroApp> get microApps;

  ///
  /// * Base Routes
  ///
  /// Here we can register routes that are not part of a micro app
  ///
  Map<String, WidgetBuilderArgs> get baseRoutes;

  final Map<String, WidgetBuilderArgs> routes = {};

  ///
  /// * Initialise Routing
  ///
  /// Responsible for initialising the routes for each micro app resolver.
  ///
  /// It also initializes the event listeners. And register widgets experoted as micro front ends.
  ///
  void initialiseRouting() {
    if (baseRoutes.isNotEmpty) routes.addAll(baseRoutes);
    if (microApps.isNotEmpty && routes.isEmpty) {
      for (MicroApp microapp in microApps) {
        routes.addAll(microapp.routes);
        microapp.initEventListeners();
        if (microapp.microAppWidget() != null) {
          WidgetsRegistry[microapp.microAppName] = microapp.microAppWidget();
        }
      }
    }
  }

  ///
  /// * Generate Route
  ///
  /// Generate the Flutter routing, registering all micro apps routes
  ///
  Route<dynamic>? generateRoute(RouteSettings settings) {
    var routerName = settings.name;
    var routerArgs = settings.arguments;

    var navigateTo = routes[routerName];
    if (navigateTo == null) return null;

    return MaterialPageRoute(
      builder: (context) => navigateTo.call(context, routerArgs),
    );
  }
}

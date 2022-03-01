import 'package:flutter/material.dart';

import '../../micro_core.dart';

///
/// * On Generate Route
/// This function  is resonsible for generating the routes navigation
/// based on [TransitionType].
/// Each [MicroApp] will define its transition type.
///
PageRoute onGenerateRoute({
  required Widget Function(BuildContext, Object?)? widget,
  required Widget Function(BuildContext, Object?) navigateTo,
  required RouteSettings settings,
  TransitionType? transitionType,
  Object? arguments,
}) {
  switch (transitionType) {
    case TransitionType.fade:
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, __, ___) => (widget!)(context, settings.arguments),
        transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
      );
    case TransitionType.slideUp:
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, __, ___) => (widget!)(context, settings.arguments),
        transitionsBuilder: (_, a, __, c) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, 1.0),
            end: const Offset(0.0, 0.0),
          ).animate(a),
          child: c,
        ),
      );
    case TransitionType.none:
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, __, ___) => (widget!)(context, settings.arguments),
      );
    case TransitionType.defaultTransition:
      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (context) => navigateTo.call(context, settings.arguments),
      );
    default:
      return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (context) => navigateTo.call(context, settings.arguments),
      );
  }
}

import 'package:flutter/material.dart';

import '../../micro_core.dart';

export 'routing_transitions.dart';

abstract class Routing {
  /// Push Named Route
  static pushNamed(Routes route, {RouteEvent? arguments}) {
    return navigatorKey.currentState?.pushNamed(route.value, arguments: arguments);
  }

  /// Back
  static back() {
    final bool canPop = navigatorKey.currentState != null && navigatorKey.currentState!.canPop();

    if (canPop) {
      return navigatorKey.currentState?.pop();
    }
  }

  /// Push With Custom Transition
  static pushCustom(
    Widget page, {
    TransitionType transitionType = TransitionType.defaultTransition,
  }) {
    return navigatorKey.currentState?.push(
      Transitions(
        transitionType: transitionType,
        widget: page,
      ),
    );
  }

  static offAllNamed(
    Routes route, {
    bool Function(Route<dynamic>)? predicate,
    dynamic arguments,
  }) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      route.value,
      predicate ?? (_) => false,
      arguments: arguments,
    );
  }

  static get current {
    String? currentPath;
    navigatorKey.currentState?.popUntil((route) {
      currentPath = route.settings.name;
      return true;
    });

    return currentPath;
  }
  // Add more routing type here if necessary
}

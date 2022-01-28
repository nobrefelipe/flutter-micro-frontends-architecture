import 'package:flutter/material.dart';

///
/// Define transition types
///
enum TransitionType {
  defaultTransition,
  none,
  fade,
  slideDown,
  slideUp,
  slideLeft,
  slideRight,
}

///
/// * Route Transitions
///
/// Define some out of the box page transitions.
///
/// Eg.: SlideUp, SLideDown, SlideRight, SlideLeft and Fade.
///
/// ```
///  Routing.pushCustom(SearchResults(), transitionType: TransitionType.slideUp);
/// ```
///
class Transitions<T> extends PageRouteBuilder<T> {
  final TransitionType transitionType;
  final Curve curve;
  final Curve reverseCurve;
  final Duration duration;
  final Widget widget;

  Transitions({
    required this.transitionType,
    required this.widget,
    this.curve = Curves.fastOutSlowIn,
    this.reverseCurve = Curves.fastOutSlowIn,
    this.duration = const Duration(milliseconds: 350),
  }) : super(
          transitionDuration: duration,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return widget;
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            animation = CurvedAnimation(parent: animation, curve: curve, reverseCurve: reverseCurve);

            switch (transitionType) {
              case TransitionType.defaultTransition:
              case TransitionType.none:
                return child;

              case TransitionType.fade:
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );

              case TransitionType.slideDown:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, -1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );

              case TransitionType.slideUp:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 1.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );

              case TransitionType.slideLeft:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );

              case TransitionType.slideRight:
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(-1.0, 0.0),
                    end: const Offset(0.0, 0.0),
                  ).animate(animation),
                  child: child,
                );
              default:
                return FadeTransition(opacity: animation, child: child);
            }
          },
        );
}

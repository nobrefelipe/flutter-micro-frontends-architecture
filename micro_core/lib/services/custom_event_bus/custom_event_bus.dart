// ignore_for_file: constant_identifier_names, prefer_final_fields

import 'package:event_bus/event_bus.dart';
import 'package:micro_core/services/routing/route_events.dart';

class CustomEventBus {
  CustomEventBus._internal();
  static final CustomEventBus _singleton = CustomEventBus._internal();
  factory CustomEventBus() => _singleton;

  EventBus _bus = EventBus();

  static EventBus get bus => _singleton._bus;

  static emit(RouteEvent event) {
    _singleton._bus.fire(event);
  }

  ///
  /// Listen to the fired event and execute a function
  ///
  static on<T>(Function f) {
    _singleton._bus.on<T>().listen((T event) {
      f(event);
    });
  }
}

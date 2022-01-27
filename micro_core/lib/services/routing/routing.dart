import '../../micro_core.dart';

abstract class Routing {
  static pushNamed(Routes route, {RouteEvent? arguments}) {
    navigatorKey.currentState?.pushNamed(route.value, arguments: arguments);
  }

  // Add more routing type here if necessary
}

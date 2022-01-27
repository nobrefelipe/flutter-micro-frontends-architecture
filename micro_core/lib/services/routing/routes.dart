import 'package:home/home.dart';
import 'package:login/login.dart';

import '../../utils/enum.dart';

///
/// * All NAMED ROUTES must be registred here
///
class Routes extends Enum<String> {
  Routes(String value) : super(value);

  static Routes home = Routes(HomeResolver().microAppName);
  static Routes login = Routes(LoginResolver().microAppName);
}

///
/// * All ROUTE EVENTS must be registred here
///
class RouteEvents {
  static LoginEvents get loginEvents => LoginResolver().microAppEvents();
  static HomeEvents get homeEvents => HomeResolver().microAppEvents();
}

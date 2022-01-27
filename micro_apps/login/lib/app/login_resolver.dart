import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import 'login_events.dart';
import 'presenter/login_view.dart';

class LoginResolver implements MicroApp {
  @override
  String get microAppName => "/login";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        microAppName: (context, args) => const LoginView(),
      };

  @override
  void initRouteListeners() {
    CustomEventBus.on<UserLoggedOutEvent>((event) {
      // we can use events to navigate as well.
      // Routing.pushNamed<UserLoggedOutEvent>(Routes.login);
      print('LOGGED OUT');
    });
  }

  @override
  LoginEvents microAppEvents() => LoginEvents();

  @override
  Widget? microAppWidget() => null;
}

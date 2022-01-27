// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:login/login.dart';
import 'package:micro_core/micro_core.dart';
import 'package:search/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseApp {
  @override
  Widget build(BuildContext context) {
    super.initialiseRouting();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigatorKey,
      onGenerateRoute: super.generateRoute,
      initialRoute: Routes.login.value,
    );
  }

  @override
  Map<String, WidgetBuilderArgs> get baseRoutes => {};

  @override
  List<MicroApp> get microApps => [
        LoginResolver(),
        HomeResolver(),
        SearchResolver(),
      ];
}

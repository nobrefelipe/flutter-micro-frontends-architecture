// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import '../home_events.dart';

class HomeView extends StatelessWidget {
  final UserLoggedInEvent args;
  HomeView(this.args);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi ${args.user}'),
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(),
            Text('Hi ${args.user}', style: TextStyle(fontSize: 24)),
            SizedBox(height: 30),

            ///
            /// Outputs the search micro app  widget.
            /// note: the Home micro app has no idea what this will output.
            /// THe WidgetsRegistry is generated when the app builds by providing to the base app the micro apps resolvers.
            /// This means we can include a Widget dynamicaly based on what an api tells us.
            /// It's also good for AB Testing, etc..
            ///
            WidgetsRegistry['/search'] ?? SizedBox.shrink(),
            //
            SizedBox(height: 30),
            CupertinoButton(
              child: const Text('logout'),
              onPressed: () {
                ///
                /// Navigating to Login Screen via routing
                ///
                Routing.pushNamed(Routes.login);

                ///
                /// Emit UserLoggedOutEvent listened by the Login view
                ///
                CustomEventBus.emit(RouteEvents.loginEvents.userLoggedOutEvent);
              },
            ),
            CupertinoButton(
              child: const Text('open bottom sheet'),
              onPressed: () {
                ///
                /// Open a bottom sheet via OpenBottomSheetEvent
                ///
                CustomEventBus.emit(OpenBottomSheetEvent('Home'));
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

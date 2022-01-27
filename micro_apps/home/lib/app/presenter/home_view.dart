// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:dependencies/dependencies.dart';
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
            SUIButton.solid(
              label: 'Logout',
              width: 240,
              height: 50,
              ontap: () {
                print('======== Navigating to Login Screen via routing ========');
                Routing.pushNamed(Routes.login);
                print('======== Emit UserLoggedOutEvent listened by the Login view ========');
                CustomEventBus.emit(RouteEvents.loginEvents.userLoggedOutEvent);
              },
            ),
            SUIButton.text(
              label: 'open bottom sheet',
              width: 240,
              height: 50,
              ontap: () {
                print('======== Open a bottom sheet via OpenBottomSheet Event ========');
                CustomEventBus.emit(OpenBottomSheet('Home'));
              },
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

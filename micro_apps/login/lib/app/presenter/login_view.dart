import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          height: 100,
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: SUIButton.solid(
                  label: 'Login',
                  width: 240,
                  height: 50,
                  ontap: () {
                    print('======== Navigating to Home Screen via UserLoggedInEvent ========');
                    Routing.pushNamed(
                      Routes.home,
                      arguments: RouteEvents.homeEvents.userLoggedInEvent('Felipe'),
                    );

                    print('======== Emit OpenBottomSheet | Home micro front end is listening to it ========');
                    CustomEventBus.emit(RouteEvents.homeEvents.openBottomSheet('Login'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

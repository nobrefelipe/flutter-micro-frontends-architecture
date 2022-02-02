import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          height: 200,
          child: Column(
            children: [
              CupertinoTextField(
                padding: const EdgeInsets.all(15.0),
                placeholder: 'Name',
                controller: textController,
              ),
              Align(
                alignment: Alignment.center,
                child: CupertinoButton(
                  child: const Text('Login'),
                  onPressed: () {
                    ///
                    /// Navigating to Home Screen via UserLoggedInEvent
                    ///
                    Routing.pushNamed(
                      Routes.home,
                      arguments: RouteEvents.homeEvents.userLoggedInEvent(textController.text),
                    );

                    ///
                    /// Emit OpenBottomSheetEvent | Home micro front end is listening to it
                    ///
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

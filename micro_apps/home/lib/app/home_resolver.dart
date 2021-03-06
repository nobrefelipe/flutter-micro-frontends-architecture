import 'package:flutter/widgets.dart';
import 'package:micro_core/micro_core.dart';

import 'home_events.dart';
import 'home_inject.dart';
import 'presenter/home_view.dart';
import 'presenter/widgets/bottom_sheet.dart';

class HomeResolver implements MicroApp {
  @override
  String get microAppName => "/home";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        microAppName: (context, args) => HomeView(args as UserLoggedInEvent),
      };

  @override
  void initEventListeners() {
    CustomEventBus.on<UserLoggedInEvent>((event) {
      Routing.pushNamed(Routes.home, arguments: event);
    });
    CustomEventBus.on<OpenBottomSheetEvent>((OpenBottomSheetEvent event) async {
      await showBottonSheetEvent(event.title);
    });
  }

  @override
  HomeEvents microAppEvents() => HomeEvents();

  @override
  Widget? microAppWidget() => null;

  @override
  void injectionsRegister() => Inject.initialize();

  @override
  TransitionType? get transitionType => TransitionType.fade;
}

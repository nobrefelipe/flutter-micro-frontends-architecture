import 'package:flutter/widgets.dart';
import 'package:micro_core/micro_core.dart';

import 'presenter/search_button.dart';
import 'presenter/search_results.dart';
import 'search_events.dart';

class SearchResolver implements MicroApp {
  @override
  String get microAppName => "/search";

  @override
  Map<String, WidgetBuilderArgs> get routes => {
        '$microAppName/results': (context, args) => SearchResults(),
      };

  @override
  void initRouteListeners() {
    CustomEventBus.on<SearchDummyEvent>((event) {
      print(event.user);
    });
  }

  @override
  SearchEvents microAppEvents() => SearchEvents();

  @override
  Widget microAppWidget() => SearchButton();
}

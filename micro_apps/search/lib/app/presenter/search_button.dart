import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SUIButton.outlined(
      label: 'Search micro app',
      ontap: () {
        navigatorKey.currentState?.pushNamed('/search/results');
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';
import 'package:search/app/presenter/search_results.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: const Text('Search micro app'),
      onPressed: () {
        Routing.pushCustom(SearchResults(), transitionType: TransitionType.slideUp);
      },
    );
  }
}

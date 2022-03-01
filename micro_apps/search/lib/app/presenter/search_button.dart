import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

import 'search_results.dart';

class SearchButton extends StatefulWidget {
  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 150,
        height: 100,
        padding: const EdgeInsets.all(10),
        color: Colors.red,
        child: FittedBox(
          child: const Text(
            'Search Component',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      onTap: () {
        Routing.pushCustom(
          SearchResults(),
          transitionType: TransitionType.slideUp,
        );
      },
    );
  }
}

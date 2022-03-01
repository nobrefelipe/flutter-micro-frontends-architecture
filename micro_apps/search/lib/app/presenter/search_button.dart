import 'dart:async';

import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';
import 'package:search/app/presenter/search_results.dart';

class SearchButton extends StatefulWidget {
  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  Timer? timer;
  @override
  void initState() {
    super.initState();

    IFlagsmith().init();
    // timer = Timer.periodic(Duration(milliseconds: 3000), (Timer t) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: IFlagsmith.searchMicroApp(),
      builder: (context, snapshot) {
        return AnimatedCrossFade(
          firstChild: GestureDetector(
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
          ),
          secondChild: Container(width: 150),
          crossFadeState:
              snapshot.data != null && snapshot.data == true ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 300),
        );
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}

class IFlagsmith {
  IFlagsmith._internal();
  static final IFlagsmith _singleton = IFlagsmith._internal();
  factory IFlagsmith() => _singleton;

  late FlagsmithClient? _flagsmithClient;

  Future<void> init() async {
    _flagsmithClient = FlagsmithClient(
      apiKey: 'CetxLJyvPPhyiiXzYyK8cT',
      seeds: [],
    );
  }

  static FlagsmithClient? get flagsmithClient => _singleton._flagsmithClient;

  static Future<bool?> searchMicroApp() async {
    final user = Identity(identifier: '7474447748');

    await flagsmithClient?.getFeatureFlags(user: user, reload: true);

    return flagsmithClient?.hasFeatureFlag("search_micro_app");
  }
}

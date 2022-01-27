import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

Future showBottonSheetEvent(String title) async {
  return SUIBottomSheet.show(
    navigatorKey.currentContext!,
    floatted: true,
    content: Container(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SUIText.subtitle('Opened from'),
          const SizedBox(height: 10),
          SUIText.header1(title),
        ],
      ),
    ),
  );
}

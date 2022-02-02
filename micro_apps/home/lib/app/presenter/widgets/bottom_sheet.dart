import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

Future showBottonSheetEvent(String title) async {
  return showBottomSheet(
    context: navigatorKey.currentContext!,
    builder: (context) {
      return Container(
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Opened from'),
            const SizedBox(height: 10),
            Text(title),
          ],
        ),
      );
    },
  );
}

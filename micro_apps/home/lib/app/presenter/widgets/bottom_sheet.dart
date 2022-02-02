import 'package:flutter/material.dart';
import 'package:micro_core/micro_core.dart';

Future showBottonSheetEvent(String title) async {
  return showModalBottomSheet(
    context: navigatorKey.currentContext!,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(30),
        height: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Bottom sheet opened via Event (OpenBottomSheetEvent) from the',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '$title micro app',
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ],
        ),
      );
    },
  );
}

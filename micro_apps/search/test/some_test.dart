import 'package:flutter_test/flutter_test.dart';

main() {
  test('Some Testy Test', () async {
    final int a = 1;
    final int b = 2;
    final int r = a + b;
    expect(r, 3);
  });
}

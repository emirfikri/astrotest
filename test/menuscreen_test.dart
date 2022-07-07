import 'package:astrotest/menu/view/menuScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty search bar return error', () {
    final result = validate('');
    expect(result, 'Empty');
  });

  test('non-empty email returns null', () {
    final result = validate('email');
    expect(result, '');
  });
}

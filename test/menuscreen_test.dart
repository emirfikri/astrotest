import 'package:astrotest/screens/mainmenuscreen/menuScreen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty search bar return error', () {
    final result = SearchFieldValidator.validate('');
    expect(result, 'Empty');
  });

  test('non-empty email returns null', () {
    final result = SearchFieldValidator.validate('email');
    expect(result, '');
  });
}

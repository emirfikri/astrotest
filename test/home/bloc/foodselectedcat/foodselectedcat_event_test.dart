import 'package:astrotest/home/bloc/block_export.dart';
import 'package:test/test.dart';

void main() {
  group('GetFoodSelectedcatEvent', () {
    test('supports comparisons', () {
      expect(GetFoodSelectedcat, GetFoodSelectedcat);
    });

    group('GetNullcat', () {
      test('supports comparisons', () {
        expect(GetNullcat(), GetNullcat());
      });
    });
  });
}

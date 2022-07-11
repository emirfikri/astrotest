import 'package:astrotest/home/bloc/block_export.dart';
import 'package:test/test.dart';

void main() {
  group('AllcategoryEvent', () {
    test('supports comparisons', () {
      expect(AllcategoryEvent, AllcategoryEvent);
    });

    group('GetFoodCategory', () {
      test('supports comparisons', () {
        expect(GetFoodCategory(), GetFoodCategory());
      });
    });

    group('GetDrinkCategory', () {
      test('supports comparisons', () {
        expect(GetDrinkCategory(), GetDrinkCategory());
      });
    });
  });
}

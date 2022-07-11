import 'package:astrotest/home/bloc/block_export.dart';
import 'package:astrotest/individual/individual_page.dart';
import 'package:test/test.dart';

void main() {
  group('ItemDetailsEvent', () {
    test('supports comparisons', () {
      expect(ItemdetailsEvent, ItemdetailsEvent);
    });

    group('GetFoodDetailsCache', () {
      test('supports comparisons', () {
        expect(GetFoodDetailsCache, GetFoodDetailsCache);
      });
    });

    group('GetFoodDetails', () {
      test('supports comparisons', () {
        expect(GetFoodDetails, GetFoodDetails);
      });
    });

    group('FoodDetailsErrorState', () {
      test('supports comparisons', () {
        expect(FoodDetailsErrorState, FoodDetailsErrorState);
      });
    });
  });
}

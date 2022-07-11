import 'package:astrotest/home/bloc/block_export.dart';
import 'package:astrotest/home/models/food_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeFoodList extends Mock implements FoodModel {}

void main() {
  late FoodModel fakeFoodList;

  setUp(() {
    fakeFoodList = FakeFoodList();
  });
  group('FoodselectedcatBloc ', () {
    FoodselectedcatBloc buildBloc() {
      return FoodselectedcatBloc();
    }

    test('returns correct values for FoodselectedcatBloc.isInitial', () {
      FoodselectedcatState foodselectedcatState = buildBloc().state;
      expect(foodselectedcatState, FoodselectedcatInitial());
    });

    test('returns correct values for FoodselectedcatBloc.isLoading', () {
      buildBloc().add(const GetFoodSelectedcat(selectedCat: 'beef'));
      expect(FoodselectedcatLoading(), FoodselectedcatLoading());
    });

    test('returns correct values for FoodCategoryLoaded.isSuccess', () async {
      buildBloc().add(const GetFoodSelectedcat(selectedCat: 'beef'));
      await Future.delayed(const Duration(seconds: 2));
      expect(FoodSelectedCatLoaded([fakeFoodList]),
          FoodSelectedCatLoaded([fakeFoodList]));
    });

    test('returns correct values for FoodCategoryLoaded.isError', () {
      buildBloc().add(const GetFoodSelectedcat(selectedCat: ''));
      expect(const CategoryError("message"), const CategoryError("message"));
    });
  });
}

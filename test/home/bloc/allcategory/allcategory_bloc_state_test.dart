import 'package:astrotest/home/bloc/block_export.dart';
import 'package:astrotest/home/models/drinkcategory_model.dart';
import 'package:astrotest/home/models/foodcategory_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FakeFoodCategoryList extends Mock implements FoodCategory {}

class FakeDrinkCategoryList extends Mock implements DrinkCategory {}

void main() {
  late FoodCategory fakeFoodCategoryList;
  late DrinkCategory fakeDrinkCategoryList;

  setUp(() {
    fakeFoodCategoryList = FakeFoodCategoryList();
    fakeDrinkCategoryList = FakeDrinkCategoryList();
  });
  group('AllcategoryBloc ', () {
    AllcategoryBloc buildBloc() {
      return AllcategoryBloc();
    }

    test('returns correct values for AllcategoryState.isInitial', () {
      AllcategoryState allcategoryState = buildBloc().state;
      expect(allcategoryState, AllcategoryInitial());
    });

    test('returns correct values for AllcategoryState.isLoading', () {
      buildBloc().add(GetFoodCategory());
      expect(AllcategoryLoading(), AllcategoryLoading());
    });

    test('returns correct values for FoodCategoryLoaded.isSuccess', () async {
      buildBloc().add(GetFoodCategory());
      await Future.delayed(const Duration(seconds: 2));
      expect(FoodCategoryLoaded([fakeFoodCategoryList]),
          FoodCategoryLoaded([fakeFoodCategoryList]));
    });

    test('returns correct values for DrinkCategoryLoaded.isSuccess', () async {
      buildBloc().add(GetDrinkCategory());
      await Future.delayed(const Duration(seconds: 2));
      expect(DrinkCategoryLoaded([fakeDrinkCategoryList]),
          DrinkCategoryLoaded([fakeDrinkCategoryList]));
    });

    test('returns correct values for AllCategory.isError', () {
      buildBloc().add(GetNull());
      expect(const CategoryError("message"), const CategoryError("message"));
    });
  });
}

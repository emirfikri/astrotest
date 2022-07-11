import 'package:astrotest/home/home_page.dart';
import 'package:astrotest/home/models/drinkcategory_model.dart';
import 'package:astrotest/home/models/food_model.dart';
import 'package:astrotest/home/models/foodcategory_model.dart';
import 'package:astrotest/home/resources/api_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements ApiRepository {}

class FakeFoodCategoryList extends Mock implements FoodCategory {}

class FakeDrinkCategoryList extends Mock implements DrinkCategory {}

class FakeFoodModel extends Mock implements FoodModel {}

void main() async {
  late ApiRepository apiRepository;
  late FoodCategory fakeFoodCategoryList;
  late DrinkCategory fakeDrinkCategoryList;
  late FoodModel fakeFoodModel;

  setUp(() {
    apiRepository = MockRepository();
    fakeFoodCategoryList = FakeFoodCategoryList();
    fakeDrinkCategoryList = FakeDrinkCategoryList();
    fakeFoodModel = FakeFoodModel();
  });

  group('AllcategoryBloc', () {
    AllcategoryBloc buildBloc() {
      return AllcategoryBloc();
    }

    test(
      'initial state [AllcategoryInitial]',
      () {
        expect(
          AllcategoryBloc().state,
          AllcategoryInitial(),
        );
      },
    );

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(AllcategoryInitial()),
        );
      });
    });

    test(
      'FoodCategoryLoaded ',
      () {
        expect(
          FoodCategoryLoaded([fakeFoodCategoryList]),
          const FoodCategoryLoaded([]),
        );
      },
    );

    blocTest<AllcategoryBloc, AllcategoryState>(
      'emits [AllcategoryBloc.loading, AllcategoryBloc.Loaded]'
      ' when repository fetchFoodCategory returns a successful outcome',
      setUp: () {
        when(() => apiRepository.fetchFoodCategory()).thenAnswer(
          (data) async => [fakeFoodCategoryList],
        );
      },
      build: () => AllcategoryBloc(),
      act: (bloc) async {
        bloc.add(GetFoodCategory());
        await Future.delayed(const Duration(seconds: 2)); // debounce time
      },
      expect: () => <AllcategoryState>[
        AllcategoryLoading(),
        FoodCategoryLoaded([fakeFoodCategoryList])
      ],
    );

    blocTest<AllcategoryBloc, AllcategoryState>(
      'emits [AllcategoryBloc.loading, AllcategoryBloc.getDrink]'
      'when repository returns a success outcome ',
      setUp: () {
        when(() => apiRepository.fetchDrinkCategory()).thenThrow(
          (e) {
            e.toString();
          },
        );
      },
      build: () => AllcategoryBloc(),
      act: (bloc) async {
        bloc.add(GetDrinkCategory());
        await Future.delayed(const Duration(seconds: 2)); // debounce time
      },
      expect: () => <AllcategoryState>[
        AllcategoryLoading(),
        DrinkCategoryLoaded([fakeDrinkCategoryList])
      ],
    );

    blocTest<AllcategoryBloc, AllcategoryState>(
      'emits [AllcategoryBloc.loading, AllcategoryBloc.Error]'
      'when repository returns a fail outcome ',
      setUp: () {
        when(() => apiRepository.fetchNull());
      },
      build: () => AllcategoryBloc(),
      act: (bloc) async {
        bloc.add(GetNull()); // debounce time
      },
      wait: const Duration(seconds: 2),
      expect: () => <AllcategoryState>[
        const CategoryError("mock"),
      ],
    );
  });
}

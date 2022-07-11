import 'package:astrotest/home/home_page.dart';
import 'package:astrotest/home/models/food_model.dart';
import 'package:astrotest/home/resources/api_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepository extends Mock implements ApiRepository {}

class FakeFoodModel extends Mock implements FoodModel {}

void main() async {
  late ApiRepository apiRepository;
  late FoodModel fakeFoodModel;

  setUp(() {
    apiRepository = MockRepository();
    fakeFoodModel = FakeFoodModel();
  });

  group('SelectedcategoryBloc', () {
    FoodselectedcatBloc buildBloc() {
      return FoodselectedcatBloc();
    }

    group('constructor', () {
      test('works properly', () {
        expect(buildBloc, returnsNormally);
      });

      test('has correct initial state', () {
        expect(
          buildBloc().state,
          equals(FoodselectedcatInitial()),
        );
      });
    });

    test(
      'FoodCategoryLoaded ',
      () {
        expect(
          const FoodCategoryLoaded([]),
          const FoodCategoryLoaded([]),
        );
      },
    );

    blocTest<FoodselectedcatBloc, FoodselectedcatState>(
      'emits [FoodselectedcatBloc.loading, FoodselectedcatBloc.Loaded]'
      ' when repository GetFoodSelectedcat returns a successful outcome',
      setUp: () {
        when(() =>
                apiRepository.fetchFoodModelSelectedCategory(category: "beef"))
            .thenAnswer(
          (data) async => [],
        );
      },
      build: () => FoodselectedcatBloc(),
      act: (bloc) async {
        bloc.add(const GetFoodSelectedcat(selectedCat: 'beef'));
        await Future.delayed(const Duration(seconds: 2)); // debounce time
      },
      expect: () => <FoodselectedcatState>[
        FoodselectedcatLoading(),
        const FoodSelectedCatLoaded([])
      ],
    );

    blocTest<FoodselectedcatBloc, FoodselectedcatState>(
      'emits [AllcategoryBloc.loading, AllcategoryBloc.Error]'
      'when repository returns a fail outcome ',
      setUp: () {
        when(() => apiRepository.fetchNull());
      },
      build: () => FoodselectedcatBloc(),
      act: (bloc) async {
        bloc.add(GetNullcat()); // debounce time
      },
      wait: const Duration(seconds: 2),
      expect: () => <FoodselectedcatState>[
        const FoodSelectedCatError("null"),
      ],
    );
  });
}

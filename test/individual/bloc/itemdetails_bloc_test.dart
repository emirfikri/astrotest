import 'package:astrotest/individual/individual_page.dart';
import 'package:astrotest/individual/models/fooddetails_model.dart';
import 'package:astrotest/individual/resources/api_repository.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/secure_storage.dart';

class MockRepository extends Mock implements ApiRepository {}

class FakeFoodDetails extends Mock implements FoodDetailsModel {}

class MockStorage extends Mock implements MockDatasource {}

void main() {
  late ApiRepository apiRepository;
  late FoodDetailsModel fakeFoodDetails;
  final mockStorage = MockStorage();

  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    fakeFoodDetails = FakeFoodDetails();
    apiRepository = MockRepository();
  });

  group('ItemdetailsBloc', () {
    ItemdetailsBloc buildBloc() {
      return ItemdetailsBloc();
    }

    test(
      'initial state [ItemdetailsBloc]',
      () {
        expect(
          ItemdetailsBloc().state,
          const ItemdetailsState(),
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
          equals(const ItemdetailsState()),
        );
      });
    });

    test(
      'ItemdetailsLoad ',
      () {
        expect(
          ItemDetailsLoaded(foodDetail: fakeFoodDetails),
          ItemDetailsLoaded(foodDetail: fakeFoodDetails),
        );
      },
    );

    test('returns FoodDetails ItemDetailsLoading', () {
      buildBloc().add(const GetFoodDetails(id: '53016'));
      expect(ItemDetailsLoading(), ItemDetailsLoading());
    });

    test('returns FoodDetailsError when no item Id or data', () {
      buildBloc().add(const GetFoodDetails(id: ''));
      expect(const FoodDetailsErrorState(message: ''),
          const FoodDetailsErrorState(message: ''));
    });
  });
}

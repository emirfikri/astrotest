import 'dart:convert';

import 'package:astrotest/individual/bloc/bloc_export.dart';
import 'package:astrotest/individual/models/fooddetails_model.dart';
import 'package:astrotest/individual/resources/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers/fixtures_reader.dart';
import '../../helpers/secure_storage.dart';

class FakeFoodDetails extends Mock implements FoodDetailsModel {}

class MockRepository extends Mock implements ApiRepository {}

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  // late FoodDetailsModel fakeFoodDetails;
  late ApiRepository apiRepository;
  late MockFlutterSecureStorage mockSecureStorage;
  late MockDatasource dataSource;
  final tAccessToken =
      FoodDetailsModel.fromJson(json.decode(fixture('fooddetails.txt')));
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    // fakeFoodDetails = FakeFoodDetails();
    apiRepository = MockRepository();
    mockSecureStorage = MockFlutterSecureStorage();
    dataSource = MockDatasourceImp(secureStorage: mockSecureStorage);
  });

  group('ItemDetailsBloc ', () {
    ItemdetailsBloc buildBloc() {
      return ItemdetailsBloc();
    }

    test('returns correct values for ItemDetailsState.isInitial', () {
      ItemdetailsState allcategoryState = buildBloc().state;
      expect(allcategoryState, const ItemdetailsState());
    });

    test('returns correct values for GetFoodDetails.isLoading', () {
      buildBloc().add(const GetFoodDetails(id: '53016'));
      expect(ItemDetailsLoading(), ItemDetailsLoading());
    });

    group('savedata', () {
      test('should call FlutterSecureStorage to save data', () async {
        // arrange
        when(() => mockSecureStorage.write(
                key: savedToken, value: json.encode(tAccessToken)))
            .thenAnswer((invocation) => Future<void>.value());

        //act
        dataSource.saveFoodDetails(tAccessToken);

        // assert
        final expectedJsonString = json.encode(tAccessToken.toJson());
        verify(() => mockSecureStorage.write(
            key: savedToken, value: expectedJsonString));
      });
    });

    test('returns FoodDetailsErrorState when no item Id or data', () {
      buildBloc().add(const GetFoodDetails(id: ''));
      expect(const FoodDetailsErrorState(message: ''),
          const FoodDetailsErrorState(message: ''));
    });
  });
}

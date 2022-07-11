import 'package:astrotest/home/bloc/block_export.dart';
import 'package:astrotest/individual/individual_page.dart';
import 'package:astrotest/individual/models/fooddetails_model.dart';
import 'package:flutter/material.dart';
import '../helpers/api_services.dart';
import 'package:flutter_test/flutter_test.dart';

import '../helpers/pump_app.dart';

Future<void> main() async {
  List<FoodDetailsModel> foodListmodel = [];
  var rawdata = await ApiService()
      .getApiData("https://www.themealdb.com/api/json/v1/1/lookup.php?i=53016");
  var responseData = rawdata['meals'];
  var detailsItem1 =
      responseData.map((e) => FoodDetailsModel.fromJson(e)).toList();
  foodListmodel.add(detailsItem1[0]);
  test('getapi single food detail with id 53016', () {
    expect(foodListmodel.length, 1);
    expect(foodListmodel.first.name, "Chick-Fil-A Sandwich");
    expect(detailsItem1[0].runtimeType, FoodDetailsModel);
    expect(foodListmodel.runtimeType, List<FoodDetailsModel>);
  });

  FoodDetailsModel mockmodel = detailsItem1[0];
  String mockmodeltosessionstorage = mockmodel.serialize();
  FoodDetailsModel sessiontoFoodDetails =
      FoodDetailsModel.deserialize(mockmodeltosessionstorage);

  test("mockmodel to json serialize and deserialize to fooddetailsmodel", () {
    expect(mockmodel.runtimeType, FoodDetailsModel);
    expect(mockmodeltosessionstorage.runtimeType,
        String); // serialize to string to save on storage session
    expect(sessiontoFoodDetails.runtimeType,
        FoodDetailsModel); // from text json to class fooddetails
  });

  group('IndividualItemDetails View', () {
    late MockRepository mockRepository;
    setUp(() {
      WidgetsFlutterBinding.ensureInitialized();
      mockRepository = MockRepository();
    });
    testWidgets('renders IndividualItemDetails ', (tester) async {
      Widget testWidget = const MediaQuery(
          data: MediaQueryData(),
          child: MaterialApp(
              home: IndividualItemDetails(
            itemId: '53016',
          )));
      await tester.pumpWidget(
        RepositoryProvider.value(
          value: mockRepository,
          child: testWidget,
        ),
      );
      await tester.pumpAndSettle(const Duration(seconds: 2));

      expect(find.byType(IndividualItemDetails), findsOneWidget);
    });
  });
}

import 'package:astrotest/helper/shared_configs.dart';
import 'package:astrotest/model/fooddetails_model.dart';
import 'package:astrotest/services/api_services.dart';
import 'package:flutter_test/flutter_test.dart';

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

  test("test", () {
    expect(mockmodel.runtimeType, FoodDetailsModel);
    expect(mockmodeltosessionstorage.runtimeType,
        String); // serialize to string to save on storage session
    expect(sessiontoFoodDetails.runtimeType,
        FoodDetailsModel); // from text json to class fooddetails
  });
}

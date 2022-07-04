import 'package:astrotest/model/food_model.dart';
import 'package:astrotest/model/foodcategory_model.dart';
import 'package:astrotest/screens/homescreen/homeScreen.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  test('empty search bar return error', () {
    final result = SearchFieldValidator.validate('');
    expect(result, 'Empty');
  });

  test('non-empty email returns null', () {
    final result = SearchFieldValidator.validate('email');
    expect(result, '');
  });

  List<FoodModel> foodviewmodel = [];
  var rawdata = await getapidata(
      "https://www.themealdb.com/api/json/v1/1/filter.php?c=Beef");
  var responseData = rawdata['meals'] as List;
  var menuList = responseData.map((e) => FoodModel.fromJson(e)).toList();
  foodviewmodel.add(menuList[0]);
  foodviewmodel.add(menuList[1]);
  foodviewmodel.add(menuList[2]);
  foodviewmodel.add(menuList[3]);
  foodviewmodel.add(menuList[4]);
  foodviewmodel.add(menuList[5]);
  test('getapi 6 food menu from server with beef', () {
    expect(foodviewmodel.length, 6);
    expect(foodviewmodel.first.name, "Beef and Mustard Pie");
  });

  List<FoodCategory> foodcategorymodel = [];
  var rawdatafoodcategory = await getapidata(
      "https://www.themealdb.com/api/json/v1/1/categories.php");
  var responseDatafoodcategory = rawdatafoodcategory['categories'] as List;
  var categoryList =
      responseDatafoodcategory.map((e) => FoodCategory.fromJson(e)).toList();
  foodcategorymodel.add(categoryList[0]);
  foodcategorymodel.add(categoryList[1]);
  foodcategorymodel.add(categoryList[2]);
  foodcategorymodel.add(categoryList[3]);
  foodcategorymodel.add(categoryList[4]);
  foodcategorymodel.add(categoryList[5]);
  test('getapi 6 food category and first is beef', () {
    expect(foodcategorymodel.length, 6);
    expect(foodcategorymodel.first.name, "Beef");
  });
}

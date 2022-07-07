import '../models/drinkcategory_model.dart';
import 'package:dio/dio.dart';
import '../models/foodcategory_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _urlFoodcategory =
      'https://www.themealdb.com/api/json/v1/1/categories.php';
  final String _urlDrinkcategory =
      'https://www.thecocktaildb.com/api/json/v1/1/list.php?c=list';
  Future<List<FoodCategory>?> fetchFoodCategory() async {
    try {
      Response rawdata = await _dio.get(_urlFoodcategory);
      var responseData = rawdata.data['categories'] as List;
      return responseData.map((e) => FoodCategory.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    return null;
  }

  Future<List<DrinkCategory>?> fetchDrinkCategory() async {
    try {
      Response rawdata = await _dio.get(_urlDrinkcategory);
      var responseData = rawdata.data['drinks'] as List;
      return responseData.map((e) => DrinkCategory.fromJson(e)).toList();
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
    return null;
  }
}

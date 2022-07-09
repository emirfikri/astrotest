import 'package:astrotest/individual/models/fooddetails_model.dart';

import 'package:dio/dio.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _urlFooddetails =
      'https://www.themealdb.com/api/json/v1/1/lookup.php?i=';

  Future<FoodDetailsModel?> fetchFoodModelDetails({required id}) async {
    try {
      Response rawdata = await _dio.get("$_urlFooddetails$id");
      var responseData = rawdata.data['meals'] as List;
      return responseData.map((e) => FoodDetailsModel.fromJson(e)).toList()[0];
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }
}

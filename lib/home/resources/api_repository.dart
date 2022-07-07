import 'package:astrotest/home/models/drinkcategory_model.dart';
import 'package:astrotest/home/models/foodcategory_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<FoodCategory>?> fetchFoodCategory() {
    return _provider.fetchFoodCategory();
  }

  Future<List<DrinkCategory>?> fetchDrinkCategory() {
    return _provider.fetchDrinkCategory();
  }
}

class NetworkError extends Error {}

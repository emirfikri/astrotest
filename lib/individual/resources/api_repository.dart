import 'package:astrotest/individual/models/fooddetails_model.dart';
import 'package:astrotest/individual/resources/cache_provider.dart';

import 'api_provider.dart';

class ApiRepository {
  final _apiprovider = ApiProvider();

  Future<FoodDetailsModel?> fetchFoodDetails({required id}) {
    return _apiprovider.fetchFoodModelDetails(id: id);
  }

  final _cacheprovider = CacheProvider();

  Future<FoodDetailsModel?> fetchFoodDetailsCache({required id}) {
    return _cacheprovider.fetchFoodDetailsCache(id: id);
  }

  Future<void> saveFoodDetailsCache(
      {required id, required FoodDetailsModel data}) {
    return _cacheprovider.saveFoodDetailsCache(id: id, data: data);
  }
}

class NetworkError extends Error {}

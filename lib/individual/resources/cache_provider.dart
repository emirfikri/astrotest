import 'package:astrotest/individual/models/fooddetails_model.dart';

import '../../configs/shared_configs.dart';

class CacheProvider {
  final SharedConfigs configs = SharedConfigs();

  Future<FoodDetailsModel?> fetchFoodDetailsCache({required id}) async {
    var cache = await configs.readKey("$id");
    if (cache == null) {
      return null;
    } else {
      FoodDetailsModel foodCache = FoodDetailsModel.deserialize(cache);
      // print("foodCache ${foodCache.runtimeType} $foodCache ");
      return foodCache;
    }
  }

  Future<void> saveFoodDetailsCache(
      {required id, required FoodDetailsModel data}) async {
    configs.writeKey("$id", data.serialize());
  }
}

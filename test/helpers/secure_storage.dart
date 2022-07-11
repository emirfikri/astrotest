import 'dart:convert';

import 'package:astrotest/individual/models/fooddetails_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class MockDatasource {
  Future<FoodDetailsModel> getSavedFoodDetails();
  void saveFoodDetails(FoodDetailsModel accessToken);
}

const savedToken = 'SAVED_TOKEN';

class MockDatasourceImp implements MockDatasource {
  MockDatasourceImp({required this.secureStorage});

  final FlutterSecureStorage secureStorage;

  @override
  Future<FoodDetailsModel> getSavedFoodDetails() async {
    final jsonString = await secureStorage.read(key: savedToken);
    if (jsonString != null) {
      return Future.value(FoodDetailsModel.fromJson(json.decode(jsonString)));
    } else {
      throw UnimplementedError();
    }
  }

  @override
  Future<void> saveFoodDetails(FoodDetailsModel accessToken) {
    return secureStorage.write(
        key: savedToken, value: json.encode(accessToken));
  }
}

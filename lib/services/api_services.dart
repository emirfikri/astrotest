// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:dio/dio.dart';

class ApiService {
  // final AsyncMemoizer _memoizer = AsyncMemoizer();
  ApiService();
  Dio dio = Dio();

  Future getApiData(String linkUrl) async {
    // var url = "http://avisena.com.my/API/patient/create.php";
    String url = linkUrl;
    var data;
    print("url api trace === !! $url");

    return dio
        .get(url,
            options: Options(contentType: Headers.formUrlEncodedContentType))
        .then((Response response) async {
      var statusCode = response.statusCode!;
      print("statusCode! $statusCode!");
      if (statusCode < 200 || statusCode > 400) {
        throw Exception("Error while fetching data 1 $statusCode!");
      }
      data = response.toString();
      final jsonData = jsonDecode(data);
      // print('data response is ====== $jsonData');
      return jsonData;
    });
  }
}

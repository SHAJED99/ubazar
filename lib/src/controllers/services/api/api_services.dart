import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ubazar/src/controllers/services/api/http_call.dart';

class ApiServices {
  static Future getProductList(String token) async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.productListSlider()");
    const String httpLink = "/invoiceapps/Values/GetProductList";
    try {
      http.Response res = await HttpCall.get(url: httpLink, token: token);
      print(res.body);
      // if (res.statusCode != 200) throw res.statusCode;
      // var json = jsonDecode(res.body);
      // List<ProductListSliderModel> data = [];
      // if (json['data'] != null) {
      //   json['data'].forEach((v) {
      //     data.add(ProductListSliderModel.fromJson(v));
      //   });
      // }
      if (res.statusCode != 200) throw res.statusCode;
      var jsonData = jsonDecode(res.body);

      // return data;
    } catch (e) {
      rethrow;
    }
  }
}

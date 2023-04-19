import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ubazar/src/controllers/services/api/http_call.dart';
import 'package:ubazar/src/models/pojo_classes/product_model.dart';

class ApiServices {
  static Future<List<ProductModel>> getProductList(String token) async {
    if (kDebugMode) print("ApiServices: Requesting ApiServices.productListSlider()");
    const String httpLink = "/invoiceapps/Values/GetProductList";
    try {
      http.Response res = await HttpCall.get(url: httpLink, token: token);

      if (res.statusCode != 200) throw res.statusCode;
      var jsonData = jsonDecode(res.body);
      if (jsonData['Success'] != 1) throw Exception("Went something wrong.");
      List<ProductModel> data = [];
      if (jsonData['ProductList'] != null) {
        jsonData['ProductList'].forEach((v) {
          data.add(ProductModel.fromJson(v));
        });
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }
}

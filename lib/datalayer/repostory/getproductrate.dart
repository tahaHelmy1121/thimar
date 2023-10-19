import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/cartmodel.dart';

import '../model/loginmodel.dart';
import '../model/product_rate.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class GetProductRateRepo {
  static Future<ProductRateModel> getRateRepo({token}) async {
    var response = await http.get(
      Uri.parse("https://thimar.amr.aait-d.com/public/api/products/1/rates"),
      headers: {'AUTHORIZATION': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ProductRateModel.fromJson(json);
      print(result.status.toString());
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ProductRateModel.fromJson(json);
      return result;
    }
  }
}

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/const/url.dart';
import 'package:untitled1/datalayer/model/cartmodel.dart';
import 'package:untitled1/datalayer/model/categoriesproduct.dart';
import 'package:untitled1/datalayer/model/productsmodel.dart';

import '../model/loginmodel.dart';
import '../model/productcategory.dart';

dynamic toArabic({required Uint8List bodyBytes}) {
  return jsonDecode(utf8.decode(bodyBytes));
}

class GetProductCategoryRepo {
  static Future<ProductsModel> getSubProductCategory({token ,category_id , id , index}) async {

    var response = await http.get(
      Uri.parse("https://thimar.amr.aait-d.com/public/api/products?category_id=$id"),
      headers: {
        'AUTHORIZATION': 'Bearer $token',
        "Accept-Language":"ar"
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ProductsModel.fromJson(json);
      print(result.data.length);
      return result;
    } else {
      Map<String, dynamic> json = toArabic(bodyBytes: response.bodyBytes);
      final result = ProductsModel.fromJson(json);
      return result;
    }
  }
}
